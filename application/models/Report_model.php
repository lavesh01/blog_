<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report_model extends CI_Model {

	public function lead_agent($users="") {
		$leads = $this->db->where('1 = 1',null);
		$calls = clone $leads;
		$callbacks = clone $leads;
		$sipnames = clone $leads;
		$agent_disposition = clone $leads;
		$lead_status = clone $leads;
		$data = [];
		$sip_user_names_in = array();

		if ($users == "")
		{
			$lead_status->where('leads.agent',$this->user_id);
			$leads->where('leads.agent',$this->user_id);
			$agent_disposition->where('leads.agent',$this->user_id);
			$sip_user_names =$sipnames->select('name')->from('users_extension')->where('user_id', $this->user_id)->where('deleted',0)->get();
		}
		else{
			$lead_status->where_in('leads.agent',$users);
			$agent_disposition->where_in('leads.agent',$users);
			$leads->where_in('leads.agent',$users);
			$sip_user_names =$sipnames->select('name')->from('users_extension')->where_in('user_id', $users)->where('deleted',0)->get();
		}

		if (isset($input["agent_date_start_time"]) && !empty($input["agent_date_start_time"]) && isset($input["agent_date_end_time"]) && !empty($input["agent_date_end_time"])) 
        {
            $agent_date_start_time = $this->input->post("agent_date_start_time");
            $agent_date_end_time = $this->input->post("agent_date_end_time");
            $leads->group_start();
            	$leads->where('leads.agent_date_time >=',$agent_date_start_time); 
            	$leads->where('leads.agent_date_time <=',$agent_date_end_time); 
            $leads->group_end();

            $agent_disposition->group_start();
            	$agent_disposition->where('leads.agent_date_time >=',$agent_date_start_time); 
            	$agent_disposition->where('leads.agent_date_time <=',$agent_date_end_time); 
            $agent_disposition->group_end();

            $lead_status->group_start();
            	$lead_status->where('leads.agent_date_time >=',$agent_date_start_time); 
            	$lead_status->where('leads.agent_date_time <=',$agent_date_end_time); 
            $lead_status->group_end();

            $calls->group_start();
            	$calls->where('created_date >=',$agent_date_start_time); 
            	$calls->where('created_date <=',$agent_date_end_time); 
            $calls->group_end();


        }
        else if (isset($input["agent_date_end_time"]) && !empty($input["agent_date_end_time"])) 
        {
        	$agent_date_end_time = $this->input->post("agent_date_end_time");
        	$lead_status->where('leads.agent_date_time <=',$agent_date_end_time);
        	$agent_disposition->where('leads.agent_date_time <=',$agent_date_end_time);
        	$leads->where('leads.agent_date_time <=',$agent_date_end_time);
        	$calls->where('created_date <=',$agent_date_end_time); 
        }
        else if (isset($input["agent_date_start_time"]) && !empty($input["agent_date_start_time"])) 
        {
        	$agent_date_start_time = $this->input->post("agent_date_start_time");
        	$lead_status->where('leads.agent_date_time >=',$agent_date_start_time); 
        	$agent_disposition->where('leads.agent_date_time >=',$agent_date_start_time); 
        	$leads->where('leads.agent_date_time >=',$agent_date_start_time); 
        	$calls->where('created_date >=',$agent_date_start_time);
        }
        else
        {
        	$lead_status->where('leads.agent_date_time = CURDATE()',null);
        	$agent_disposition->where('leads.agent_date_time = CURDATE()',null); 
        	$leads->where('leads.agent_date_time = CURDATE()',null); 
        	$calls->where('created_date = CURDATE()',null);
        }


		$leads->select('count(leads.agent) as assigned_lead,sum(case when leads.status != 0 and leads.status != 1 then 1 else 0 end ) as disposed_lead,sum(case when  asset_id is null or asset_id = 0 then 1 else 0 end ) as manual_lead',false);
		$data["leads"] =  $leads->from('leads as leads')->get()->result_array()[0];

	    if ($sip_user_names->num_rows() > 0) {
	      $sip_user_names = $sip_user_names->result();
	      $ext_users = [];
	      foreach($sip_user_names as $v)
	      {
	        $ext_users[] = $v->name;
	      }
	      $data["calls"] = $calls->select("count(distinct(called)) as called, sum(duration)/1000 as duration")
	                   ->from('crd_moitele')->where('eventName',"cdr")->where_in('caller',$ext_users)->get()->result_array()[0];          
	    }
	    else
	    {
	      $data["calls"] = array('called'=>0,'duration'=>0);
	    }

	    $this->load->model('Timetracker_model');
	    $data["loggedTime"] = $this->Timetracker_model->todays_total_time();

	    $this->load->model("Lead_model");
	    $data["callbacks"] = $this->Lead_model->assigned_leads("")
   		->where('leads_others_details.lead_id is not null',null)->where('callback = CURDATE()',null)
   		->where('leads.status',1)->get()->num_rows();

   		$data["agent_month_productivity"] =$this->db->query(' SELECT e.points, COUNT(1) * c.grade AS achieved, ((COUNT(1) * c.grade / e.points)) achieved_percentage FROM bf_leads b JOIN bf_campaign_grade c ON c.id = b.campaign_id and b.customer_id = '.$this->customer_id . ' AND b.status = 3 and agent = '.$this->user_id . ' and MONTH(b.agent_date_time) = MONTH(CURRENT_DATE()) AND YEAR(b.agent_date_time) = YEAR(CURRENT_DATE()) JOIN bf_users d ON b.agent = d.id JOIN bf_user_designation_points e ON e.id = d.designation_id')->result_array()[0];

   		$data["quality_month_productivity"] =$this->db->query(' SELECT e.points, COUNT(1) * c.qualityGrade AS achieved, ((COUNT(1) * c.qualityGrade / e.points)) achieved_percentage FROM bf_leads b JOIN bf_campaign_grade c ON c.id = b.campaign_id and b.customer_id = '.$this->customer_id . ' AND b.status = 3 and quality_user_id = '.$this->user_id . ' and MONTH(b.quality_date_time) = MONTH(CURRENT_DATE()) AND YEAR(b.quality_date_time) = YEAR(CURRENT_DATE()) JOIN bf_users d ON b.agent = d.id JOIN bf_user_designation_points e ON e.id = d.designation_id')->result_array()[0];

		$agent_disposition->select('concat(agent_disposition.name, " - " ,agent_sub_disposition.name) as disposition, count(1) as c')
		->from("leads")
		->join("agent_disposition agent_disposition",'leads.agent_disposition=agent_disposition.id')
		->join("agent_sub_disposition agent_sub_disposition",'leads.agent_sub_disposition=agent_sub_disposition.id')
		->where('leads.status not in (1,0)')
		->where('leads.agent',$this->user_id)
		->group_by('leads.agent_disposition,leads.agent_sub_disposition')
		->order_by('count(1)','DESC');
		//$data["adsql"] = $agent_disposition->get_compiled_select();
		$ad =  $agent_disposition->get()->result_array();
		$adseries = [];
		$adcategories = [];

		foreach ($ad as $key => $value) {
			$adseries[] = (int)$value["c"];
			$adcategories[] = $value["disposition"];
		}
		$data["agent_disposition"]["adseries"] = $adseries;
		$data["agent_disposition"]["adcategories"] = $adcategories;

		$lead_status->select('leads_status.status, count(1) as c')
		->from("leads")
		->join("leads_status leads_status",'leads.status=leads_status.id')
		->where('leads.status != 0',null)
		->where('leads.agent',$this->user_id)
		->group_by('leads.status')
		->order_by('count(1)','DESC');
		//$data["adsql"] = $lead_status->get_compiled_select();
		$ad =  $lead_status->get()->result_array();
		$adseries = [];
		$adcategories = [];
		foreach ($ad as $key => $value) {
			$adseries[] = (int)$value["c"];
			$adcategories[] = $value["status"];
		}
		$data["lead_status"]["adseries"] = $adseries;
		$data["lead_status"]["adcategories"] = $adcategories;
   		return $data;
	}

	public function customreportlist($id="", $select="")
	{
		if ($select == "") {
			$this->db->select("*");
		}
		
		if ($id != "") {
			$this->db->where("id",$id);
		}
		return $this->db->from('customreports')->where('customer_id',$this->customer_id);
	}

	public function getchartByIDjson($id='', $select="")
    {
        if ($select == ""){
          $this->db->select('id, icon, name');  
        }
        else{
            $this->db->select($select);
        }
        if ($id != "") {
            $this->db->where('id', $id);
        }
        $chk = $this->db->from('customreporttypes')->get();
        if ($chk->num_rows())
        {
           return $chk->result_array();
        }
        return 0;
    }
}