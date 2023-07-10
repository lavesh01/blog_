<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lead_model extends CI_Model {

	public function isProspectExists($prospect_id, $campaign_id) {
		$q = $this->db->select("id")
			->from("leads")
			->where("prospect_id",$prospect_id)
			->where("campaign_id",$campaign_id)
			->where("customer_id",$this->customer_id)
			->order_by("id", 'DESC')
			->limit(1)
			->get();
			
			
		if ($q->num_rows() > 0 ) {
			return $q->result()[0]->id;
		}
		else {
			return 0;
		}
	}

	public function assignNextleadToAgentAuto( $campaign_id, $direct_landed_lead_id="") {
		if ($direct_landed_lead_id=="") {
			$this->db->where('((auto_dial = 0 and (bf_leads.asset_id is NULL or bf_leads.asset_id  = 0)) or auto_dial = 2 )',null,false);
			$this->db->where("id not in (select lead_id from bf_lead_skipped where user_id=".$this->user_id." and campaign_id = ".$campaign_id. " and customer_id=".$this->customer_id.")",null)->limit(1);
		}
		else
		{
			$this->db->where('id',$direct_landed_lead_id);
		}
		$a = $this->db->select("leads.id, leads.prospect_id, leads.campaign_id,leads_others_details.callback, leads.asset_id")
			->from("leads")
			->join('leads_others_details','leads.id = leads_others_details.lead_id','left')
			->where("agent",$this->user_id)
			->where("status",'1')
			->where("campaign_id",$campaign_id)
			->where("customer_id",$this->customer_id)
			->group_start()
               	->where('leads_others_details.callback is NULL',null)
               	->or_where('leads_others_details.callback >= CURRENT_TIMESTAMP() ',null)
            ->group_end()
			->order_by("id", 'DESC')
			->get();

		if ($a->num_rows() == 0 ) {
			//if ($direct_landed_lead_id=="") {
				$q = $this->db->select("leads.id, leads.prospect_id, leads.campaign_id,leads_others_details.callback, leads.asset_id")
				->from("leads")
				->join('leads_others_details','leads.id = leads_others_details.lead_id','left')
				->where("(agent is NULL or agent = 0)", NULL, FALSE)
				->where("status",'0')
				->where("campaign_id",$campaign_id)
				->where("customer_id",$this->customer_id)
				->where('((auto_dial = 0 and (bf_leads.asset_id is NULL or bf_leads.asset_id  = 0)) or auto_dial = 2 )',null,false)
				->group_start()
               	->where('leads_others_details.callback is NULL',null)
               	->or_where('leads_others_details.callback >= CURRENT_TIMESTAMP() ',null)
                ->group_end()
				->order_by("id", 'DESC')
				->limit(1)
				->get();
				if ($q->num_rows() > 0 ) {
					$newlead =  $q->result_array();
					$this->db->where('id',$newlead[0]['id']);
					$this->db->set('agent' ,$this->user_id);
					$this->db->set('status' ,1);
					$this->db->update('leads');
					return $newlead;
				}
				else {
					return 0;
				}
			/*}
			else
			{
				return 2;
			}*/
		}
		else
		{
			return  $a->result_array();
		}
		
	}

	public function checkClientLevelSuppression($prospect_id, $client_alias_id, $days)
	{
		$q = $this->db->from("leads")
			//->where("quality_disposition","1")
			->where("prospect_id",$prospect_id)
			->where("client_alias_id",$client_alias_id)
			->where('created_on BETWEEN CURDATE() - INTERVAL '.$days.' DAY AND CURDATE()')
			->where("customer_id",$this->customer_id)
			->count_all_results();;
			;
		if ($q > 0 ) {
			return 1;
		}
		else {
			return 0;
		}
	}

	public function checkOrgLevelSuppression($prospect_id, $days)
	{
		$q = $this->db->from("leads")
			->where("quality_disposition","1")
			->where("prospect_id",$prospect_id)
			->where('created_on BETWEEN CURDATE() - INTERVAL '.$days.' DAY AND CURDATE()')
			->where("customer_id",$this->customer_id)
			->count_all_results();;
			;
		if ($q > 0 ) {
			return 1;
		}
		else {
			return 0;
		}
	}
	

	public function viewLeadAgentDispostion($id,$prospect_id,$lead_id)
	{
		$this->db->select(' leads.id,
							leads.prospect_id,
							leads.campaign_id,
							agent_disposition.name agent_disposition,
							agent_sub_disposition.name agent_sub_disposition,
							leads.agent_date_time,
							leads.isConsent,
							leads.dnc,
							leads.isWebVerified,
							leads.agent_notes,
							leads.status as leadstatus,
							',FALSE); 
	    $this->db->from("leads");
	    $this->db->join("agent_disposition",'leads.agent_disposition=agent_disposition.id');
	    $this->db->join("agent_sub_disposition",'leads.agent_sub_disposition=agent_sub_disposition.id');
		$this->db->where('leads.customer_id', $this->customer_id);
		$this->db->where('leads.campaign_id', $id);
		$this->db->where('leads.id', $lead_id);
		$this->db->where('leads.prospect_id', $prospect_id);
		$campaign_data =$this->db->get();	
		//return $this->db->error();
		if ($campaign_data->num_rows() > 0) 
		{		
			return $campaign_data->result_array();
		}
		else{
			return FALSE;
		}

	}	
	public function viewLead($id,$prospect_id,$lead_id)
	{
		$this->db->select('campaigns.id , 
						    campaigns.client_id,
							campaigns.campaign_name ,
							campaign_grade.name as compaign_grade,
							campaign_type.name as campaign_type,
							campaigns.start_date ,
							campaigns.end_date ,
							campaigns.total_lead,
							extended_end_date,
							campaigns.status ,
							campaigns.lead_per_company,
							leads.agent_disposition,
							leads.agent_sub_disposition,
							leads.agent_date_time,
							leads.isConsent,
							leads.dnc,
							leads.isWebVerified,
							leads.agent_notes,
							leads.quality_disposition,
							leads.quality_sub_disposition,
							leads.quality_notes,
							leads.quality_date_time,
							leads.status as leadstatus,
							prospects.salutation_id	,
							prospects.first_name	,
							prospects.middle_name	,
							prospects.last_name	,
							prospects.job_level_id	,
							prospects.job_functions_id	,
							prospects.title	,
							prospects.email_id	,
							prospects.direct_number	,
							prospects.mobile_number	,
							prospects.office_number	,
							prospects.country	,
							prospects.state	,
							prospects.city	,
							prospects.address_1	,
							prospects.address_2	,
							prospects.company_id	,
							prospects.src	,
							prospects.zip 	,
							companies.Name as company_name ,
							companies.Revenue_id,
							companies.sic_code_id,
							companies.NIC_Code_id,
							companies.Primary_Domain,
							companies.Employee_Size_id,
							companies.Industry_Type_id,
							companies.company_src,
							domains.domain_name 
							',FALSE); //id, campaign_name, campaign_type_id, start_date, end_date, total_lead,status'
	    $this->db->from("leads");
	    $this->db->join('campaigns', 'campaigns.id = leads.campaign_id');
	    $this->db->join('prospects', 'prospects.id = leads.prospect_id');
	    $this->db->join('companies', 'companies.id = prospects.company_id');
	    $this->db->join('domains', 'domains.company_id = companies.id','left');
		$this->db->join('campaign_grade', 'campaign_grade.id = campaigns.campaign_grade_id','left');
		$this->db->join('campaign_type', 'campaign_type.id = campaigns.campaign_type_id','left');
		$this->db->where('leads.customer_id', $this->customer_id);
		$this->db->where('leads.campaign_id', $id);
		$this->db->where('leads.id', $lead_id);
		$this->db->where('leads.prospect_id', $prospect_id);
		$campaign_data =$this->db->get();	
		//return $this->db->error();
		if ($campaign_data->num_rows() > 0) 
		{		
			return $campaign_data->result_array();
		}
		else{
			return FALSE;
		}

	}
	public function leadSelectQuery()
	{
		
	    $this->db->from("leads");
	    $this->db->join('prospects', 'prospects.id = leads.prospect_id','left');
	    $this->db->join('companies', 'companies.id = prospects.company_id','left');
	    $this->db->join('udc_job_level','prospects.job_level_id=udc_job_level.id','left');
        $this->db->join('udc_job_function','prospects.job_functions_id=udc_job_function.id','left');
        $this->db->join('udc_country','prospects.country=udc_country.id','left');
        $this->db->join('udc_industry','companies.Industry_Type_id=udc_industry.id','left');
        return  $this->db->join('udc_employee_size','companies.Employee_Size_id=udc_employee_size.id','left');
	    
	    

		// $this->db->join('company_technology', 'prospects.id = company_technology.company_id','left');
		
	    //return $this->db->join('domains', 'domains.company_id = companies.id');
		// $this->db->where('leads.customer_id', $this->customer_id);
	}

	public function leadSearch()
	{	
		$query =  $this->leadSelectQuery();
		$input = $this->input->post();
		
		
		if (isset($input["campaignname_select"]) && !empty($input["campaignname_select"])) 
        {
            $campaignname_select= explode(',',ltrim($input["campaignname_select"],','));
            if ( sizeof($campaignname_select) > 0  )
            {
                $query->where_in('leads.campaign_id',$campaignname_select);
            }
        }

        //echo $input["select2_campaign_status"]; die();
		if (isset($input["select2_campaign_status"]) && !empty($input["select2_campaign_status"])) 
        {
            $select2_campaign_status= explode(',',ltrim($input["select2_campaign_status"],','));
            if ( sizeof($select2_campaign_status) > 0  )
            {
                $query->where_in('leads.status',$select2_campaign_status);
            }
        }

        if (isset($input["select_job_level"]) && !empty($input["select_job_level"]))
        {
            $select_job_level = explode(',',ltrim($this->input->post("select_job_level"),','));   
            if (sizeof($select_job_level) > 0 )
            {
                $query->where_in('prospects.job_level_id',$select_job_level);   
            } 
        }
        
        if (isset($input["select_job_function"]) && !empty($input["select_job_function"])) 
        {
            $select_job_function = explode(',',ltrim($this->input->post("select_job_function"),','));
            if (sizeof($select_job_function) > 0 )
            {
                $query->where_in('prospects.job_functions_id',$select_job_function);   
            }
        }

        if (isset($input["select_industry"]) && !empty($input["select_industry"])) 
        {
            $select_industry = explode(',',ltrim($this->input->post("select_industry"),','));
            if (sizeof($select_industry) > 0 )
            {
                $query->where_in('companies.Industry_Type_id',$select_industry);   
            }
        }

        if (isset($input["select_employee"]) && !empty($input["select_employee"])) {
            $select_employee = explode(',',ltrim($this->input->post("select_employee"),','));
            if (sizeof($select_employee) > 0 )
            {
                $query->where_in('companies.Employee_Size_id',$select_employee);   
            }
        }

        if (isset($input["select2_revenue"]) && !empty($input["select2_revenue"])) {
            $select2_revenue = explode(',',ltrim($this->input->post("select2_revenue"),','));
            if (sizeof($select2_revenue) > 0 )
            {
                $query->where_in('companies.Revenue_id',$select2_revenue);   
            }
        }
        
 
        if (isset($input["select_country"]) && !empty($input["select_country"])) 
        {
            $select_country = explode(',',ltrim($this->input->post("select_country"),','));
            if (sizeof($select_country) > 0 )
            {
                $query->where_in('prospects.country',$select_country);   
            }
        }

        if (isset($input["txt_Search_number_ctps"]) && !empty($input["txt_Search_number_ctps"])) 
        {
            $txt_Search_number_ctps= explode(',',ltrim($this->input->post("txt_Search_number_ctps"),','));
            if ( sizeof($txt_Search_number_ctps) > 0  )
            {
                $query->group_start();
                foreach($txt_Search_number_ctps as $cat) {
                     $query->or_like('prospects.title',$cat,'both'); 
                }
                $query->group_end();
            }
        }

        if (isset($input["company"]) && !empty($input["company"])) 
        {
            $company= explode(',',ltrim($this->input->post("company"),','));
            if ( sizeof($company) > 0  )
            {
                $query->group_start();
                foreach($company as $cat) {
                     $query->or_like('prospects.company_id',$cat,'both'); 
                }
                $query->group_end();
            }

        }
        if (isset($input["txt_Search_number_ctps"]) && !empty($input["txt_Search_number_ctps"])) 
        {
            $txt_Search_number_ctps= explode(',',ltrim($this->input->post("txt_Search_number_ctps"),','));
            if ( sizeof($txt_Search_number_ctps) > 0  )
            {
                $query->group_start();
                foreach($txt_Search_number_ctps as $cat) {
                     $query->or_like('prospects.title',$cat,'both'); 
                }
                $query->group_end();
            }

        }

        if (isset($input["txt_company_tech"]) && !empty($input["txt_company_tech"])) 
        {
            $txt_company_tech= explode(',',ltrim($this->input->post("txt_company_tech"),','));
            if ( sizeof($txt_company_tech) > 0  )
            {
                $query->group_start();
                foreach($txt_company_tech as $cat) {
                     $query->or_like('company_technology',$cat,'both'); 
                }
                $query->group_end();
            }
        }
        if (isset($input["txt_Prospect_tech"]) && !empty($input["txt_Prospect_tech"])) 
        {
            $txt_Prospect_tech= explode(',',ltrim($this->input->post("txt_Prospect_tech"),','));
            if ( sizeof($txt_Prospect_tech) > 0  )
            {
                $query->group_start();
                foreach($txt_Prospect_tech as $cat) {
                     $query->or_like('prospect_technology',$cat,'both'); 
                }
                $query->group_end();
            }
        }


        if (isset($input["agent_sub_disposition"]) && !empty($input["agent_sub_disposition"])) 
        {
            $agent_sub_disposition = explode(',',ltrim($this->input->post("agent_sub_disposition"),','));
            if (sizeof($agent_sub_disposition) > 0 )
            {
                $query->where_in('leads.agent_sub_disposition',$agent_sub_disposition);   
            }
        }

        if (isset($input["agent_disposition"]) && !empty($input["agent_disposition"])) 
        {
            $agent_disposition = explode(',',ltrim($this->input->post("agent_disposition"),','));
            if (sizeof($agent_disposition) > 0 )
            {
                $query->where_in('leads.agent_disposition',$agent_disposition);   
            }
        }

        if (isset($input["quality_sub_disposition"]) && !empty($input["quality_sub_disposition"])) 
        {
            $quality_sub_disposition = explode(',',ltrim($this->input->post("quality_sub_disposition"),','));
            if (sizeof($quality_sub_disposition) > 0 )
            {
                $query->where_in('leads.quality_sub_disposition',$quality_sub_disposition);   
            }
        }

        if (isset($input["quality_disposition"]) && !empty($input["quality_disposition"])) 
        {
            $quality_disposition = explode(',',ltrim($this->input->post("quality_disposition"),','));
            if (sizeof($quality_disposition) > 0 )
            {
                $query->where_in('leads.quality_disposition',$quality_disposition);   
            }
        }

        if (isset($input["agent_web_verified"]) && !empty($input["agent_web_verified"])) 
        {
            $agent_web_verified = explode(',',ltrim($this->input->post("agent_web_verified"),','));
            if (sizeof($agent_web_verified) > 0 )
            {
                $query->where('leads.isWebVerified',$agent_web_verified);   
            }
        }

        if (isset($input["agent_consent"]) && !empty($input["agent_consent"])) 
        {
            $agent_consent = explode(',',ltrim($this->input->post("agent_consent"),','));
            if (sizeof($agent_consent) > 0 )
            {
                $query->where('leads.isConsent',$agent_consent);   
            }
        }

         if (isset($input["select_agent_username"]) && !empty($input["select_agent_username"])) 
        {
            $select_agent_username = explode(',',ltrim($this->input->post("select_agent_username"),','));
            if (sizeof($select_agent_username) > 0 )
            {
                $query->where_in('leads.agent',$select_agent_username);   
            }
        }

        if (isset($input["select_quality_username"]) && !empty($input["select_quality_username"])) 
        {
            $select_quality_username = explode(',',ltrim($this->input->post("select_quality_username"),','));
            if (sizeof($select_quality_username) > 0 )
            {
                $query->where_in('leads.agent',$select_quality_username);   
            }
        }

        if ( (isset($input["dnc_prospect"]) && !empty($input["dnc_prospect"])) ||
        	 (isset($input["dnc_number"]) && !empty($input["dnc_number"])) ||
        	 (isset($input["dnc_company"]) && !empty($input["dnc_company"])) 
         ) 
        {
            $query->group_start();
            if ($input["dnc_prospect"] == 1) {
            	$query->or_where('leads.dnc',1); 
            }
            if ($input["dnc_number"] == 1) {
            	$query->or_where('leads.dnc',2); 
            }
            if ($input["dnc_company"] == 1) {
            	$query->or_where('leads.dnc',3); 
            }
            $query->group_end();
        }

        if ( isset($input["txt_first_name"]) && !empty($input["txt_first_name"]))
        {
        	$query->where('prospects.first_name',$input["txt_first_name"]); 
        }

        if ( isset($input["txt_last_name"]) && !empty($input["txt_last_name"]))
        {
        	$query->where('prospects.first_name',$input["txt_last_name"]); 
        }


        if (isset($input["prospect_date_start_time"]) && !empty($input["prospect_date_start_time"]) && isset($input["prospect_date_end_time"]) && !empty($input["prospect_date_end_time"])) 
        {
            $prospect_date_start_time = $this->input->post("prospect_date_start_time");
            $prospect_date_end_time = $this->input->post("prospect_date_end_time");
            $query->group_start();
            	$query->where('leads.agent_date_time >=',$prospect_date_start_time); 
            	$query->where('prospects.created_on <=',$prospect_date_end_time); 
            $query->group_end();
        }
        else if (isset($input["prospect_date_end_time"]) && !empty($input["prospect_date_end_time"])) 
        {
        	$prospect_date_end_time = $this->input->post("prospect_date_end_time");
        	$query->where('prospects.created_on <=',$prospect_date_end_time); 
        }
        else if (isset($input["prospect_date_start_time"]) && !empty($input["prospect_date_start_time"])) 
        {
        	$prospect_date_start_time = $this->input->post("prospect_date_start_time");
        	$query->where('prospects.created_on >=',$prospect_date_start_time); 
        }

        if (isset($input["agent_date_start_time"]) && !empty($input["agent_date_start_time"]) && isset($input["agent_date_end_time"]) && !empty($input["agent_date_end_time"])) 
        {
            $agent_date_start_time = $this->input->post("agent_date_start_time");
            $agent_date_end_time = $this->input->post("agent_date_end_time");
            $query->group_start();
            	$query->where('leads.agent_date_time >=',$agent_date_start_time); 
            	$query->where('leads.agent_date_time <=',$agent_date_end_time); 
            $query->group_end();
        }
        else if (isset($input["agent_date_end_time"]) && !empty($input["agent_date_end_time"])) 
        {
        	$agent_date_end_time = $this->input->post("agent_date_end_time");
        	$query->where('leads.agent_date_time <=',$agent_date_end_time); 
        }
        else if (isset($input["agent_date_start_time"]) && !empty($input["agent_date_start_time"])) 
        {
        	$agent_date_start_time = $this->input->post("agent_date_start_time");
        	$query->where('leads.agent_date_time >=',$agent_date_start_time); 
        }

        if (isset($input["quality_date_start_time"]) && !empty($input["quality_date_start_time"]) && isset($input["quality_date_end_time"]) && !empty($input["quality_date_end_time"])) 
        {
            $quality_date_start_time = $this->input->post("quality_date_start_time");
            $quality_date_end_time = $this->input->post("quality_date_end_time");
            $query->group_start();
            	$query->where('quality_date_time >=',$quality_date_start_time); 
            	$query->where('quality_date_time <=',$quality_date_end_time); 
            $query->group_end();
        }
        else if (isset($input["quality_date_end_time"]) && !empty($input["quality_date_end_time"])) 
        {
        	$quality_date_end_time = $this->input->post("quality_date_end_time");
        	$query->where('quality_date_time <=',$quality_date_end_time); 
        }
        else if (isset($input["quality_date_start_time"]) && !empty($input["quality_date_start_time"])) 
        {
        	$quality_date_start_time = $this->input->post("quality_date_start_time");
        	$query->where('quality_date_time >=',$agent_date_start_time); 
        }

        if ( isset($input["agent_auto_dialer_include"]) && !empty($input["agent_auto_dialer_include"]))
        {
        	$query->where('leads_others_details.lead_id is not null',null); 
        }

        if ( isset($input["agent_callback"]) && !empty($input["agent_callback"]))
        {
        	$query->where('leads_others_details.lead_id is not null',null); 
        }

        

        $query->select("leads.id ,leads.prospect_id,
							campaigns.campaign_name,
							leads_status.status,
							case when bf_leads_others_details.lead_id  is NULL then 'Manual' else 'List' end as datasource,
							prospects.first_name,
							prospects.last_name,
							
							case when bf_leads.dnc = 1 then 'Prospect' when bf_leads.dnc = 2 then 'Company' when bf_leads.dnc = 3 then 'Number' else 'No' end as DNC,
							case when bf_leads.isConsent = 1 then 'No' when bf_leads.dnc = 0 then 'Yes' else '' end as Consent, 
							case when bf_leads.isWebVerified = 1 then 'No' when bf_leads.dnc = 0 then 'Yes' else '' end as Consent, 
							leads_others_details.callback,
							companies.Name as company_name ,
							udc_country.name as Country	,
							udc_job_level.name as level,
							udc_job_function.name as function,
							udc_industry.name as industry,
							udc_employee_size.name as Employee,
							udc_revenue.name as Revenue
							"); 
        //,domains.domain_name  domain_name
        
		$query->join('udc_revenue','companies.Revenue_id =udc_revenue.id','left');
      	//$query->join('domains','companies.id=domains.company_id','left');
      	$query->join('campaigns', 'campaigns.id = leads.campaign_id','left');
      	$query->join('leads_status', 'leads_status.id = leads.status','left');
      	$query->join('leads_others_details', 'leads_others_details.lead_id = leads.id','left');
		return $query->where('leads.customer_id', $this->customer_id);
		

	}
	public function viewCampaignLeadList($id, $status = 9)
	{
		$query = $this->leadSelectQuery();
		$query->select('leads.id ,
							leads.campaign_id,
							leads.prospect_id,
							leads.dnc,
							leads.isConsent,
							leads.isWebVerified,
							prospects.first_name,
							prospects.last_name,
							udc_country.name as Country	,
							companies.Name as company_name ,
							udc_job_level.name as level,
							udc_job_function.name as function,
							udc_industry.name as industry,
							udc_employee_size.name as Employee
							');
		return $query->where('leads.customer_id', $this->customer_id)->where('leads.campaign_id', $id)->where('leads.status',$status);
	}/*
	public function viewCampaignLeadCount($id)
	{
		return $this->leadSelectQuery()->where('leads.customer_id', $this->customer_id)->where('leads.campaign_id', $id)->count_all_results();
	}*/

	public function addLead($campaign_id, $prospect_id,$cdqa=false, $client_id="",$asset_id="", $agent = "")
	{
		
			$agent_lead = array();
			$agent_lead["prospect_id"] = $prospect_id;
			$agent_lead["campaign_id"] = $campaign_id;
			$agent_lead["customer_id"] = $this->customer_id;
			$agent_lead["created_by"] = $this->user_id;
			$agent_lead["client_alias_id"] = $client_id;
			$agent_lead["asset_id"] = $asset_id;
			$agent_lead["agent"] = $agent;
			

			if ($cdqa==false) {
				$agent_lead["status"] = 1;
				$agent_lead["agent"] = $this->user_id;
			}
			else
			{
				$agent_lead["status"] = 0;
			}

			if ($agent != "") {
				$agent_lead["status"] = 1;
				$agent_lead["agent"] = $agent;
			}
			$lead_chk = $this->db->insert('leads',$agent_lead );
			if ($lead_chk) {
				$lead_id = $this->db->insert_id();
				$this->load->model("campaign_model");
				$camp=$campaign_id;
				$this->campaign_model->update_data_churned_count($camp);
				return [$prospect_id,$lead_id];
			}
			else
			{
				return ( $this->db->error()["message"]);
			}
	}

/*
   public function addLeadData($campaign_id,$input)
   {
   	   $insert_data = array();
		$insert_data["salutation_id"] = $input["p_salutation"];
		$insert_data["first_name"] = $input["p_f_name"];
		$insert_data["middle_name"] = $input["p_m_name"];
		$insert_data["last_name"] = $input["p_l_name"];
		$insert_data["job_level_id"] = $input["p_job_level"];
		$insert_data["job_functions_id"] = $input["p_job_function"];
		$insert_data["title"] = $input["p_title"];
		$insert_data["email_id"] = $input["p_email_id"];
		$insert_data["direct_number"] = $input["p_office_ext"];
		$insert_data["mobile_number"] = $input["p_mobile"];
		$insert_data["office_number"] = $input["p_office_number"];
		$insert_data["country"] = $input["p_country"];
		$insert_data["state"] = $input["p_state"];
		$insert_data["city"] = $input["p_city"];
		$insert_data["address_1"] = $input["address"];
		$insert_data["address_2"] = $input["address2"];
		$insert_data["src"] = $input["p_hob_title_link"];
		$insert_data["zip"] = $input["p_zip"];
		$insert_data["created_by"] = $this->user_id;
		$C_insert_data["name"] = $input["c_company"];
		$C_insert_data["Industry_Type_id"] = $input["c_industry"];
		$C_insert_data["Employee_Size_id"] = $input["c_emp_size"];
		$C_insert_data["country"] = $input["p_country"];
		$C_insert_data["state"] = $input["p_state"];
		$C_insert_data["zip"] = $input["p_zip"];
		$company_count = $this->db->get_where('companies', $C_insert_data, 1);
		//echo $this->db->last_query();
		//print_r($company_count->result_id->num_rows); die;
		if ($company_count->result_id->num_rows == 0) {
			$C_insert_data["city"] = $input["p_city"];
			$C_insert_data["Revenue_id"] = $input["c_revenue"];
			$C_insert_data["created_on"] = date("Y-m-d H:i:s");
			$C_insert_data["created_by"] = $this->user_id;
			$C_insert_data["customer_id"] = $this->customer_id;
			$C_insert_data["NIC_Code_id"] = $input["c_nic"];
			$C_insert_data["sic_code_id"] = $input["c_sic"];
			$C_insert_data["company_src"] = $input["c_company_link"];
			
			$c_chk = $this->db->insert('companies',$C_insert_data );
			if ($c_chk) {
				$d_data["company_id"] = $this->db->insert_id();
				$d_data["created_on"] = date("Y-m-d H:i:s");
				$d_data["created_by"] = $this->user_id;
				$d_data["customer_id"] = $this->customer_id;
				$d_data["domain_name"] = $input["c_domain"];
				$d_chk = $this->db->insert('domains',$d_data );
				if ($d_chk) {
					$insert_data["domain_id"] = $this->db->insert_id();
					$insert_data["company_id"] = $d_data["company_id"];
					$insert_data["customer_id"] = $this->customer_id;
				}
				else
				{
					return  $this->db->error()["message"];
				}
			}
			else 
			{
				return  $this->db->error()["message"];
			}
		}
		else
		{
			$insert_data["company_id"] = $company_count->result()[0]->id;
			$search_domain = array("domain_name"=> $input["c_domain"],
									 "customer_id" =>  $this->customer_id, 
									 "company_id" => $insert_data["company_id"]
									);
			$domain_count = $this->db->get_where('domains', $search_domain, 1);
			if ($domain_count->result_id->num_rows == 0) {
				$search_domain["created_on"] = date("Y-m-d H:i:s");
				$search_domain["created_by"] = $this->user_id;
				$d_chk = $this->db->insert('domains',$search_domain );
				if ($d_chk) {
					$insert_data["domain_id"] = $this->db->insert_id();
				}
				else
				{
					return ( $this->db->error()["message"]);
				}
			}
			else
			{
				$insert_data["domain_id"] = $domain_count->result()[0]->id;
			}
		}
		
		//print_r($query);die;
		$p_chk = $this->db->insert('prospects',$insert_data );
		if ($p_chk == true ) {
			if ($campaign_id != "") {
				$agent_lead = array();
				$agent_lead["prospect_id"] = $this->db->insert_id();
				$agent_lead["agent"] = $this->user_id;
				$agent_lead["campaign_id"] = $campaign_id;
				$agent_lead["customer_id"] = $this->customer_id;
				//$agent_lead["client_alias_id"] = $client_alias_id;
				
				$agent_lead["created_on"] = date("Y-m-d H:i:s");
				$agent_lead["created_by"] = $this->user_id;
				$lead_chk = $this->db->insert('leads',$agent_lead );
				if ($lead_chk) {
					$agent_lead["lead_id"] = $this->db->insert_id();
					$this->load->model("campaign_model");
					$camp=$campaign_id;
					$this->campaign_model->update_data_churned_count($camp);
					return $agent_lead;
				}
				else
				{
					return $this->db->insert_id();
				}
			}
			else
			{
				return ( $this->db->error()["message"]);
			}
		}
		else
		{
			return ( $this->db->error()["message"]);
		}
   }

*/

	public function addLeadToCampaign($campaign_id, $input, $cdqa=false, $client_id = "", $asset_id="")
	{
		$this->load->model("Prospects_model");
		$this->load->model("Dnc_model");
		$this->load->model("campaign_model");
/// DNC 
		$check_dnc_prospect = $this->Dnc_model->search_dnc($input["p_email_id"],"Prospect");
		if ( $check_dnc_prospect > 0 ) {return $input["p_email_id"] . " Email is in DNC";}

		$check_dnc_number1 = $this->Dnc_model->search_dnc($input["p_mobile"],"Number");
		if ( $check_dnc_number1 > 0 ) {return $input["p_mobile"]. " Mobile is in DNC";}

		$check_dnc_number2 = $this->Dnc_model->search_dnc($input["p_office_number"],"Number");
		if ( $check_dnc_number2 > 0 ) {return $input["p_office_number"]. " Office Number is in DNC";}

		$check_dnc_company = $this->Dnc_model->search_dnc($input["c_company"],"Company");
		if ( $check_dnc_company > 0 ) {return $input["c_company"]. " Company is in DNC";}
/// CTPS 
		if(isset($input["p_mobile"])  && isset($input["p_office_number"])  && !empty($input["p_mobile"]) && !empty($input["p_office_number"]))
		{
			$q = $this->db->select("contactno")
				->from("emea_gdpr_optout_contactno")
				->like("contactno",$input["p_mobile"])
				->or_like('contactno', $input["p_office_number"])
				->get()
				->num_rows();
			if ($q > 0 ) {return 'Number is in CTPS';}
		}
	
/// get prospect
		$prospect_id = $this->Prospects_model->isEmailExists($input["p_email_id"]);
		if ($prospect_id != false) {
			$lead_id = $this->isProspectExists($prospect_id,$campaign_id);
			if ($lead_id != false) {
				return  "Email already in campaign";
			}			
// campaign suprression
			//SELECT * FROM bf_leads a join bf_campaign_suppression b on a.campaign_id = b.campaign_id_to_suppressed;
			
			$campaign_suppression_chk = $this->db->from('leads a')->join('campaign_suppression b','a.campaign_id = b.campaign_id_to_suppressed and a.prospect_id ='. $prospect_id)->get()->num_rows();
			if ($campaign_suppression_chk > 0) {
				return "In Campaign Suppression";
			}
/// internal suppression
			$internal_suppression = $this->campaign_model->getSuppression($campaign_id);
			$suppression_type = $internal_suppression->suppression_type;
			$suppression_days = $internal_suppression->suppression_days;
			//$client_alias_id = $internal_suppression->client_alias_id;
			// internal suppression :   client
			if ($suppression_type == "2" && $this->checkClientLevelSuppression($prospect_id, $client_id, $suppression_days) == true) {
				return "In Client Suppression";
			}
			// internal suppression : organization
			if ($suppression_type == "1" && $this->checkOrgLevelSuppression($prospect_id, $suppression_days)) {
				return  "In Org Suppression";
			}
		}
		else
		{
			return  "Email id not found in database";
		}
		// Email and domain does not already exists in External Suppression
		$this->load->model("Suppression_model");
		$external_suppression = $this->campaign_model->getCampaignExternalSupp($campaign_id);
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
			//return $encryption_str;
			if ($chk != 0) {
				return  $external_suppression_type.  ": Already in Client External Suppression";
			}
		}
		$input_agent = "";
		if (isset($input['agent']) && !empty($input['agent'])) {
			$input_agent = $input['agent'];
		}
		return $this->addLead($campaign_id, $prospect_id,$cdqa,$client_id,$asset_id,$input_agent);
	}

	public function getDNCPendingList()
    {
        $this->db->select('leads.id,agent_disposition.name as Agent Disposition, agent_sub_disposition.name as Agent Sub Disposition, users.username As Username,dnc_type.name as Agent DNC, quality_disposition.name as Quality Disposition ,quality_sub_disposition.name as Quality Sub Disposition, dnc2.name as Quality DNC  ');
        $this->db->from("leads");
        $this->db->join('agent_disposition', 'agent_disposition.id = leads.agent_disposition',"left");
		$this->db->join('agent_sub_disposition', 'agent_sub_disposition.id = leads.agent_sub_disposition',"left");

		$this->db->join('quality_disposition', 'quality_disposition.id = leads.quality_disposition',"left");
		$this->db->join('quality_sub_disposition', 'quality_sub_disposition.id = leads.quality_sub_disposition',"left");

		$this->db->join('dnc_type', 'dnc_type.id = leads.dnc',"left");
		$this->db->join('dnc_type as dnc2', 'dnc2.id = leads.quality_dnc',"left");
		
		$this->db->join('users', 'users.id = leads.agent');

        $this->db->where("leads.customer_id", $this->customer_id);
        $this->db->where("leads.dnc = 1");
        $this->db->where("leads.quality_dnc != 0");
        return $this->db->order_by('leads.created_on', 'DESC');
        
    }


    public function getProspectCount()
    {
    	$query = $this->db->where('dnc_type', 1)->get('bf_dnc');
           return $query->num_rows();
    }

    public function getCompanyCount()
    {
    	$query = $this->db->where('dnc_type', 2)->get('bf_dnc');
           return $query->num_rows();

    }

    public function getNumberCount()
    {
    	$query = $this->db->where('dnc_type', 3)->get('bf_dnc');
           return $query->num_rows();
    }

    public function getPendingCount()
    {
    	$query = $this->db->where('dnc', 1)->get('bf_leads');
           return $query->num_rows();

    }
 
	 public function updateLeadStatus($leadID)
	 {
	    $qs=  $this->db->set('status', 1)
	                        ->where('id',$leadID)
	                         ->update('bf_leads');
	 }
	 
	public function getLeadStatus($leadid,$status)
	{
	     $query = $this->db->where('status', $status)->where('id', $leadid)->where('customer_id', $this->customer_id)->get('bf_leads');
	           return $query->num_rows();
	}

	public function get_form_lead_data($leadid) {
      
        $query =  $this->db->select("b.label, a.value")
        ->from("form_data a")
        ->join('form_inputs b','a.id= b.uuid and a.lead_id = '.$leadid )
        ->where("a.lead_id", $leadid)
        ->where("b.isdeleted", "0")
        ->get();
        $data = $query->result_array();
        if (sizeof($data) > 0) {
            return $data;
        } else {
            return 0;
        }
    }

    public function similar_company_contacts($campaign_id, $company_id)
    {
    	$this->db->select("leads.id,lead_skipped.id as Queue, prospects.first_name,prospects.last_name,companies.name Company");
    	$this->db->from("leads");
	    $this->db->join('prospects', 'prospects.id = leads.prospect_id and prospects.company_id = '. $company_id );
	    $this->db->join('companies', 'companies.id = prospects.company_id','left');
	    $this->db->join('lead_skipped', 'leads.id = lead_skipped.lead_id','left');
		$this->db->where('leads.agent',$this->user_id);
		$this->db->where('leads.campaign_id',$campaign_id);
		$query = $this->db->where('leads.status',1);
	    return $query;
    }


    public function assigned_leads($campaign_id="")
    {
    	$this->db->select("leads.id,lead_skipped.id as Queue, campaigns.id as campaign_id, campaigns.campaign_name, prospects.first_name,prospects.last_name,companies.name Company, case when bf_leads.asset_id is null  or bf_leads.asset_id = 0 then 'Manual' else 'List' end as data_source,leads_others_details.callback",false);
    	$this->db->from("leads");
	    $this->db->join('prospects', 'prospects.id = leads.prospect_id');
	    $this->db->join('companies', 'companies.id = prospects.company_id','left');
	    $this->db->join('lead_skipped', 'leads.id = lead_skipped.lead_id','left');
	    $this->db->join('campaigns', 'campaigns.id = leads.campaign_id','left');
	    $this->db->join('leads_others_details', 'leads.id = leads_others_details.lead_id','left');
		$this->db->where('leads.agent',$this->user_id);
		if ($campaign_id != "") {
			$this->db->where('leads.campaign_id',$campaign_id);
		}
		return $this->db->where('leads.status',1);
    }

    public function unassign_user_lead($campaign_id,$lead_id)
    {

    	$this->db->set('agent',NULL);
    	$this->db->set('leads.status',0);
		$this->db->where('leads.agent',$this->user_id);
		$this->db->where('leads.campaign_id',$campaign_id);
		$this->db->where('leads.id',$lead_id);
		$this->db->where('leads.status',1);
		return $this->db->update('leads');
	    
    }

   
}