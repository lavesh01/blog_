<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Agent_ajax_dailer extends admin_Controller   {

	public function __construct() {
       parent::__construct();
       $this->load->helper(array('form', 'url'));
	   $this->load->library('form_validation');
	   $this->load->model("Campaign_model");
	   if (!$this->check_permission('agent','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","You don't have permission!!","error");
			return false;
		}
	   if(!$this->input->is_ajax_request())
	   {
		 echo $this->ajax__response_data_preperation("ssdsd","asas","error");
		 die;
	   }
	}
	
	public function agent_all_disposition() {
		$q = $this->db->select("id, name")
			->from("agent_disposition")
			->where("customer_id",$this->customer_id)
			->get();
		if ($q->num_rows() > 0 ) {
			return $q->result();
		}
		else {
			return 0;
		}
	}

	public function agent_sub_disposition($dispo_id) {
		$q = $this->db->select("id, name")
			->from("agent_disposition")
			->where("agent_disposition_id",$dispo_id)
			->where("customer_id",$this->customer_id)
			->get();
		if ($q->num_rows() > 0 ) {
			return $q->result();
		}
		else {
			return 0;
		}
	}

	public function replaceformquestopn($campaign_id,$lead_id) {
		
		$input  = $this->input->post();
		unset($input["ci_csrf_token"]);
		$err = "";
		foreach($input as $k=>$v)
		{
			
			if(!empty($v)) {
				$q = $this->db->select("id")
				->from("form_data")
				->where("campaign_id",$campaign_id)
				->where("lead_id",$lead_id)
				->where("id",$k)
				->where("customer_id",$this->customer_id)
				->get()->num_rows();
				if ($q == 0) {
					if (is_array($v)){$v = implode(',', $v);}
					$a = array('id'=>$k, 'value'=>$v, "campaign_id"=>$campaign_id,"lead_id" =>$lead_id,"customer_id"=>$this->customer_id);
					$chk = $this->db->insert("form_data",$a);
				}
				else
				{
					if (is_array($v)){$v = implode(',', $v);}
					$this->db->set("value",$v)
					->where("campaign_id",$campaign_id)
					->where("lead_id",$lead_id)
					->where("customer_id",$this->customer_id)
					->where("id",$k)
					->update('form_data');
				}
			}
		}

		echo $this->ajax__response_data_preperation("Updated Custom Questions",$err ,"success");
			   return false;
	}

/*
	public function save_prospect($campaign_id='')
	{
		

		$input = $this->input->post();
		if (!isset($input)) {
			echo $this->ajax__response_data_preperation("User Added",  "invalid request","error");
		}
		$this->form_validation->set_error_delimiters('', '');
		$this->form_validation->set_rules('p_f_name', 'First Name', 'trim|required');
		$this->form_validation->set_rules('p_l_name', 'Last Name', 'trim|required');
		$this->form_validation->set_rules('p_email_id', 'Proper Email', 'trim|required');
		$this->form_validation->set_rules('p_title', 'Job Title', 'trim|required');
		$this->form_validation->set_rules('p_job_level', 'Job Level', 'trim|required');
		$this->form_validation->set_rules('p_job_function', 'Job Function', 'trim|required');
		$this->form_validation->set_rules('p_hob_title_link', 'Job Link', 'trim|required');
		$this->form_validation->set_rules('address', 'Address 1', 'trim|required');
		$this->form_validation->set_rules('p_country', 'Country', 'trim|required');
		$this->form_validation->set_rules('p_zip', 'Zip', 'trim|required');
		$this->form_validation->set_rules('c_domain', 'Domain', 'trim|required');
		$this->form_validation->set_rules('c_company', 'Company', 'trim|required');
		$this->form_validation->set_rules('c_industry', 'Industry', 'trim|required');
		$this->form_validation->set_rules('c_emp_size', 'Employee Size', 'trim|required');
		$this->form_validation->set_rules('c_revenue', 'Revenue', 'trim|required');
		$this->form_validation->set_rules('c_company_link', 'Company Link', 'trim|required');
		
		if ($this->form_validation->run() == FALSE) {
			    echo $this->ajax__response_data_preperation("error",  validation_errors(),"error");
			    return false;
		}

		
		// Email does not already exists in campaign
		$this->load->model("Prospects_model");
		$this->load->model("Lead_model");
		$prospect_id = $this->Prospects_model->isEmailExists($input["p_email_id"]);

		if ($prospect_id != false) {
			$lead_id = $this->Lead_model->isProspectExists($prospect_id,$campaign_id);
			if ($lead_id != false) {
				echo $this->ajax__response_data_preperation("error",$prospect_id. $lead_id.  "Email already in campaign","error");
			    return false;
			}			
			$internal_suppression = $this->Campaign_model->getSuppression($campaign_id);
                $suppression_type = $internal_suppression->suppression_type;
			    $suppression_days = $internal_suppression->suppression_days;
			    $client_alias_id = $internal_suppression->client_alias_id;
            
			
			// internal suppression :   client
			if ($suppression_type == "2" && checkClientLevelSuppression($prospect_id, $client_alias_id, $days)) {
				echo $this->ajax__response_data_preperation("error",   "Already in Client Suppression","error");
			    return false;
			}
			// internal suppression : organization
			if ($suppression_type == "1" && checkOrgLevelSuppression($prospect_id, $days)) {
				echo $this->ajax__response_data_preperation("error",   "Already in Client","error");
			    return false;
			}
		}
		// Email and domain does not already exists in External Suppression
		$this->load->model("Suppression_model");
		$external_suppression = $this->Campaign_model->getCampaignExternalSupp($campaign_id);
		foreach ($external_suppression as $key => $value) {
			//table_name, encryption_type, field_type
			$external_suppression_table = $value->table_name ;
			$external_suppression_type =  $value->encryption_type ;
			$external_suppression_encryption =  $value->field_type ;
			$encryption_str ="";
			if ($external_suppression_type == "domain") {
				$encryption_str = $input["c_domain"];
			}
			else if ($external_suppression_type == "email")
			{
				$encryption_str = $input["p_email_id"];
			}
			
			if ($external_suppression_encryption == "none") {
				$encryption_str =$encryption_str;
			}
			else if ($external_suppression_encryption == "md5") {
				$encryption_str = md5($encryption_str);
			}
			else {
				$encryption_str = hash($external_suppression_encryption, $encryption_str); 
			}

			$chk = $this->Suppression_model->IsEmailExistSuppression($external_suppression_table, $encryption_str);
			//echo $encryption_str;
			if ($chk != 0) {
				echo $this->ajax__response_data_preperation("Error", 
					"Already in Client External Suppression","error");
			    return false;
			}
		}
		
		// DNC check

		//  add prospect and lead
		$lead_data = $this->Lead_model->addLead($campaign_id,$input);
		//Inserted lead and prospect ID and put into array
		$dataresult=array($lead_data);
		echo $this->ajax__response_data_preperation("Details Added","Prospect Details Added Successfully","success",$dataresult);
		return false;
	}
*/
	public function save_lead_disposition($campaign_id='')
	{
		$input = $this->input->post();
		if (!isset($input)) {
			echo $this->ajax__response_data_preperation("Invalid Request",  "invalid request","error");
		}

		$this->form_validation->set_error_delimiters('', '');
		$this->form_validation->set_rules('agent_dnc', 'agent_dnc', 'trim|required');
		$this->form_validation->set_rules('agent_sub_disposition', 'agent_sub_disposition', 'trim|required');
		$this->form_validation->set_rules('agent_disposition', 'agent_disposition', 'trim|required');
		$this->form_validation->set_rules('agent_consent', 'agent_consent', 'trim|required');
		$this->form_validation->set_rules('agent_web_verified', 'agent_web_verified', 'trim|required');
		//$this->form_validation->set_rules('agent_notes', 'agent_notes', 'trim|required');
		$this->form_validation->set_rules('lead_id', 'lead_id', 'trim|required');
		$this->form_validation->set_rules('prospect_id', 'prospect_id', 'trim|required');
		
		if ($this->form_validation->run() == FALSE) {
			    echo $this->ajax__response_data_preperation("Error",  validation_errors(),"error");
			    return false;
		}
		$dispo_data = array(
		"dnc"=>$input["agent_dnc"],
		"agent_sub_disposition"=>$input["agent_sub_disposition"],
		"agent_disposition"=>$input["agent_disposition"],
		"isConsent"=>$input["agent_consent"],
		"isWebVerified"=>$input["agent_web_verified"],
		"agent_notes"=>$input["agent_notes"],
		"agent_date_time" =>date("Y-m-d H:i:s"),
		"status" => 9
		);
		$this->db->where("prospect_id",$input["prospect_id"]);
		$this->db->where("id",$input["lead_id"]);
		$this->db->where("campaign_id",$campaign_id);
		$this->db->where("customer_id",$this->customer_id);
		$chk = $this->db->update("leads",$dispo_data);
		if (!$chk) {
			echo $this->ajax__response_data_preperation("error", "","warning", $this->db->error());
		}
		else
		{
			$this->db->set('preqa', 'preqa+1', FALSE);        
		    $where = array('id' =>$campaign_id,"customer_id" => $this->customer_id );
		    $this->db->where($where);
		    if ($this->db->update('campaigns')) {
		    	echo $this->ajax__response_data_preperation("Lead added",  "Submitted For Quality" ,"success");
		    }
		    else
		    {	
		    	echo $this->ajax__response_data_preperation("Error",  $this->db->error()["message"],"error", $this->db->error());
		    }

		    
		    return;
		}
		//"agent_tech_tag"=>$input["agent_tech_tag"],
	}

	public function upload_audio($value='')
    {
    	$lead_id = $this->input->post("lead_id");
    	$called_number = $this->input->post("called_number");
    	$call_duration = $this->input->post("call_duration");
    	if (isset($lead_id) && !empty($lead_id) && isset($lead_id) && !empty($lead_id)) {
    		$data = $this->_do_upload('file',"Recordings",$lead_id, "50000", "mp3|ogg|wav|mp4");
    		if ($data) {
    			$cdr = [];
    			$cdr["userName"] = $this->session->userdata("username");
    			$cdr["caller"] = $this->session->userdata("username");
    			$cdr["lead_id"] = $lead_id;
    			$cdr["eventName"] = 'cdr';
    			$cdr["eventData"] = 'manual';
    			$cdr["recordedURL"] = site_url(). $data['url'];
    			$cdr["called"] = $called_number;
    			$cdr["customer_id"] = $this->customer_id;
    			$cdr["duration"] = $call_duration*1000;
    			$chk = $this->db->insert('crd_moitele',$cdr);
    			if ($chk) {
    				echo $this->ajax__response_data_preperation("","","success", $data);
    			}
    			else
    			{
    				echo $this->ajax__response_data_preperation("Not Added","Check With Admin","warning", $data);
    			}
    		}
    		else
 			{
 				echo $this->ajax__response_data_preperation("Not Added","Check With Admin","warning", $data);
 			}
    		
    	}
    	else
    		echo $this->ajax__response_data_preperation("ID not found","Access required for delete action","warning");
    }

    public function fetch_sub_dispositions()
    {
    	$this->load->model("Sales_model");
		 if($this->input->post('agent_disposition'))
           {
           	$agent_disposition= ltrim($this->input->post("agent_disposition"),',');
            echo $this->Sales_model->fetch_subdispositionsManual($agent_disposition);
           }
    }

    public function manual_dailerlist($value='data')
    {
        $table_name = 'bf_prospects';
		$query =  $this->db->select('t2.Name As Company, 
			t1.first_name,
			t1.last_name,
			t5.name AS Job Level,
			t6.name AS Job Function Name,
			t10.name AS Disposition,
			t11.name AS Sub Disposition,
			t9.campaign_name As Campaign,
			t1.title,
			t1.email_id,
			t1.mobile_number As mobile,
			t1.office_number As Office Contact,
			t3.domain_name As Domain,
			t4.status As Lead Status,
			')
			
							->from('bf_prospects t1')
							->join('bf_companies t2','t1.company_id=t2.id','left')
							->join('bf_domains t3','t1.company_id=t3.company_id','left')
							->join('bf_leads t4','t1.id=t4.prospect_id','left')
							->join('bf_udc_job_level t5','t1.job_level_id=t5.id','left')
							->join('bf_udc_job_function t6','t1.job_functions_id=t6.id','left')
							->join('bf_country t7','t1.country=t7.id','left')
                            ->join('bf_state t8','t1.state=t8.id','left')
                            ->join('bf_campaigns t9','t4.campaign_id=t9.id','left')
                            ->join('bf_agent_disposition t10','t4.agent_disposition=t10.id','left')
                            ->join('bf_agent_sub_disposition t11','t4.agent_sub_disposition=t11.id','left')

							->where('t1.customer_id', $this->customer_id)
							 ->where('t1.deleted', 0) 
							->order_by('t1.id','DESC');
							
		echo $this->ajax__response_data_preperation("ssdsd","asas","success",$this->datatable_data($query,$iTotalDisplayRecords ,$value,"t1.first_name,t1.last_name,t9.campaign_name,t1.email_id,t3.domain_name"));
    }


   public function automatic_dailerlist($value='data')
    {
       $table_name = 'bf_prospects';
		
		$query =  $this->db->select('t9.id As Actions,t2.Name As Company, 
			t1.first_name,
			t1.last_name,
			t10.name AS Disposition,
			t11.name AS Sub Disposition,
			t9.campaign_name As Campaign,
			t1.mobile_number As mobile,
			t4.status As Lead Status
			')
			
							->from('bf_prospects t1')
							->join('bf_companies t2','t1.company_id=t2.id','left')
							->join('bf_domains t3','t1.company_id=t3.company_id','left')
							->join('bf_leads t4','t1.id=t4.prospect_id','left')
                            ->join('bf_campaigns t9','t4.campaign_id=t9.id','left')
                            ->join('bf_agent_disposition t10','t4.agent_disposition=t10.id','left')
                            ->join('bf_agent_sub_disposition t11','t4.agent_sub_disposition=t11.id','left')

							->where('t1.customer_id', $this->customer_id)
							 ->where('t1.deleted', 0) 
							->order_by('t1.id','DESC');
							
		echo $this->ajax__response_data_preperation("ssdsd","asas","success",$this->datatable_data($query,"" ,$value,"t1.first_name,t1.last_name,t9.campaign_name,t1.email_id,t3.domain_name"));
    }

  public function change_status()
  {
  	    $this->load->model('Lead_model'); 
	    $leadID = $this->input->post('leadID');
        $data = $this->Lead_model->updateLeadStatus($leadID);
        if($data)
        {
        	echo "1";
        	return;
        }
        else
        {
        	echo "0";
        	return;
        }
  }

}