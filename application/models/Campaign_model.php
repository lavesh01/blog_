<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Campaign_model extends CI_Model {


    public function __construct()
    {
            parent::__construct();
            // Your own constructor code
    }

    public function get_form($campaign_id) {
      
        $query =  $this->db->select("uuid as name, label, type, CONCAT(htmlClass, ' ', 'campaigns_questions')  as class, id ,  default_value as 'default' , placeholder , case when required = 1 then 'required' else '' end as required , length")
        ->from("form_inputs")
        ->where("campaign_id", $campaign_id)
        ->where("isdeleted", "0")
        ->get();
        $data = $query->result_array();
        if (sizeof($data) > 0) {
            return $data;
        } else {
            return array();
        }
    }

    public function save_specification($campaign_id)
    {

        $level = $this->input->post("select2_level");
        if (isset($level)) {
            $insert_data = [];
            $data = [];
            foreach ($level as $key => $value) {
                $data["job_level_id"] = $value;
                $data["campaign_id"] = $this->campaign_id;
                $insert_data[] =  $data;
            }
            $this->db->insert_batch("campaign_joblevel",$insert_data);
        }

        $function = $this->input->post("select2_function");
        if (isset($function)) {
            $insert_data = [];
            $data = [];
            foreach ($function as $key => $value) {
                $data["job_function_id"] = $value;
                $data["campaign_id"] = $campaign_id;
                $data["campaign_id"] = $this->campaign_id;
                $insert_data[] =  $data;
            }
            $this->db->insert_batch("campaign_jobfunction",$insert_data);
        } 

        $employee = $this->input->post("select2_employee");
        if (isset($employee)) {
            $insert_data = [];
            $data = [];
            foreach ($employee as $key => $value) {
                $data["employee_id"] = $value;
                $data["campaign_id"] = $campaign_id;
                $insert_data[] =  $data;
            }
            $this->db->insert_batch("campaign_employee",$insert_data);
        }

        $industry = $this->input->post("select2_industry");
        if (isset($industry)) {
            $insert_data = [];$data = [];
            foreach ($industry as $key => $value) {
                $data["industry_id"] = $value;
                $data["campaign_id"] = $campaign_id;
                $insert_data[] =  $data;
            }
            $this->db->insert_batch("campaign_industry",$insert_data);
        }

        $revenue = $this->input->post("select2_revenue");
        if (isset($revenue)) {
            $insert_data = [];$data = [];
            foreach ($revenue as $key => $value) {
                $data["revenue_id"] = $value;
                $data["campaign_id"] = $campaign_id;
                $insert_data[] =  $data;
            }
            $this->db->insert_batch("campaign_revenue",$insert_data);
        }

        $country = $this->input->post("select2_country");
        if (isset($country)) {
            $insert_data = [];$data = [];
            foreach ($country as $key => $value) {
                $data["country_id"] = $value;
                $data["campaign_id"] = $campaign_id;
                $insert_data[] =  $data;
            }
            $this->db->insert_batch("campaign_country",$insert_data);
        }
    }

    public function save_script($campaign_id)
    {
        $script = $this->input->post("campaign_script");
        $this->db->set('script', $script);
        $this->db->where('id', $campaign_id);
        $chk = $this->db->update("campaigns");
        if (!$chk) {
            return $this->db->error();
        }
    }

    public function save_pacing($campaign_id='')
    {
        $data = $this->input->post();
        $lead_count = $data["pacing_leads"];
        $pacing_date = $data["pacing_date"];
        $type = $data["type"];
        $dates = explode(" - ",$pacing_date);
        if (isset($dates[0]) && isset($dates[1]) && isset($lead_count) ) {
            $pacing_data = [];
            $pacing_data["start_date"] = date("Y-m-d H:i:s", strtotime($dates[0])); ;
            $pacing_data["end_date"] = date("Y-m-d H:i:s", strtotime($dates[1])); ;
            $pacing_data["lead_count"] = $lead_count;
            $pacing_data["campaign_id"] = $campaign_id;
            
            if ($type=="insert") {
                if ($pacing_data["lead_count"] == "") {
                    return 4;
                }
                $target_lead = $this->getCampaign($campaign_id)[0]["total_lead"];
                $total_leads = $this->getCampaignTotalPacingLeadCount($campaign_id);
                if ($total_leads+$lead_count > $target_lead)
                {
                    return 3;
                }
                $pacing_data["created_by"] = $this->user_id;
                $pacing_data["created_on"] =  date("Y-m-d H:i:s", time());
                $chk = $this->db->insert("campaign_pacing", $pacing_data);
                if (!$chk) {
                    return $this->db->error();
                }
                else
                {
                    return $this->db->insert_id();
                }
            }
            else  if ($type=="update") {
                if ($pacing_data["lead_count"] == "") {
                    return 4;
                }
                $target_lead = $this->getCampaign($campaign_id)[0]["total_lead"];
                $total_leads = $this->getCampaignTotalPacingLeadCount($campaign_id);
                if ($total_leads+$lead_count > $target_lead)
                {
                    return 3;
                }
                $pacing_data["modified_by"] = $this->user_id;
                $pacing_data["modified_on"] =  date("Y-m-d H:i:s", time());
                $id = $this->input->post("id");
                $this->db->where("id",$id);
                $this->db->where("campaign_id",$campaign_id);
                $chk = $this->db->update("campaign_pacing", $pacing_data);
                if (!$chk) {
                    return $this->db->error();
                }
                else
                {
                    return $this->db->insert_id();
                }
            }
            else  if ($type=="delete") {
                $id = $this->input->post("id");
                $this->db->where("id",$id);
                $this->db->where("campaign_id",$campaign_id);
                $chk = $this->db->delete("campaign_pacing");
                if (!$chk) {
                    return $this->db->error();
                }
                else
                {
                    return 1;
                }
            }
        }
        else
        {
            return 0;
        }
    }

    public function save_suppression($campaign_id)
    {
        $suppression = $this->input->post("suppression_select");
        if (isset($suppression) && !empty($suppression) ) {
            $suppression_type = "";
            if ($suppression == "none") {
                $suppression_type = "0";
            }
            else
            {   
                $suppression_days = $this->input->post("suppression_selected");
                if (isset($suppression_days) && !empty($suppression_days))
                {
                    if ($suppression == "suppress_org_level") {
                        $suppression_type = "1";
                    }
                    else if ($suppression == "suppress_client_level") {
                        $suppression_type = "2";
                    }
                    $this->db->set('suppression_days', $suppression_days);
                }
            }
            $this->db->set('suppression_type', $suppression_type);
            $this->db->where('id', $campaign_id);
            $chk = $this->db->update("campaigns");
            if (!$chk) {
                return $this->db->error();
            }
        }
    }


    public function getUDCInfo($table_name='')
    {
       switch ($table_name) {
            case 'level':
                $table_name = "campaign_joblevel";
                $col = "job_level_id";
                $joining_col = "name";
                $joining_table = "bf_udc_job_level";
                break;
            case 'sic':
                $table_name = "campaign_sic";
                $col = "sic_id";
                $joining_col = "code";
                $joining_table = "bf_udc_SIC_Code";
                break;
            case 'nic':
                $table_name = "campaign_nic";
                $col = "nic_id";
                $joining_col = "code";
                $joining_table = "bf_udc_nic_code";
                break;
            case 'function':
                $table_name = "campaign_jobfunction";
                $col = "job_function_id";
                $joining_col = "name";
                $joining_table = "bf_udc_job_function";
                break;
            case 'industry':
                $table_name = "campaign_industry";
                $col = "industry_id";
                $joining_col = "name";
                $joining_table = "bf_udc_industry";
                break;
            case 'revenue':
                $table_name = "campaign_revenue";
                $col = "revenue_id";
                $joining_col = "name";
                $joining_table = "bf_udc_revenue";
                break;
            case 'country':
                $table_name = "campaign_country";
                $col = "country_id";
                $joining_col = "name";
                $joining_table = "bf_udc_country";
                break;
            case 'employee':
                $table_name = "campaign_employee";
                $col = "employee_id";
                $joining_col = "name";
                $joining_table = "bf_udc_employee_size";
                break;
            case 'campaign_sup':
                $table_name = "campaign_suppression";
                $col = "campaign_id_to_suppressed";
                $joining_col = "campaign_name";
                $joining_table = "bf_campaigns";
                break;
            case '':
                //redirect( Route::named('404_override'));
                return false;
                break;
            default:
                //redirect( Route::named('404_override'));
                return false;
                break;
        }
        return [$table_name,$col,$joining_col , $joining_table];
    }

    public function udc($table_name)
    {

        $table_info =  $this->getUDCInfo($table_name);
        if ($table_info != false) {
            $table_name = $table_info[0];
            $col = $table_info[1];
        }
        else
        {
            return false;
        }

        if ($this->input->post()) {
            $input = $this->input->post();
            $id = $input["id"];

            $campaign_id = $input["campaign_id"];
            $select = $input["select"];

            if (isset($id) && !empty($id) && isset($campaign_id) && !empty($campaign_id) && isset($select) && !empty($select)) {
               
                if ($select == "yes") {
                    $insert_data = array("campaign_id" =>$campaign_id, $col => $id);
                    $chk = $this->db->insert($table_name, $insert_data);
                    if ($chk) {
                       return 1;
                    }
                    else
                    {
                        return $this->db->error();
                    }
                }
                else if ($select == "no") {
                    //echo $col .'  '. $id; die;
                    $this->db->where("campaign_id", $campaign_id);
                    $this->db->where($col, $id);
                    $chk =$this->db->delete($table_name);
                    if ($chk) {
                       return $this->db->error();
                    }
                    else
                    {
                        return $this->db->error();
                    }
                }
            }
            else
            {
                return "inputs required";
            }
        }
    }

    public function get_campaign_udc($table, $campaign_id)
    {
        $table_info =  $this->getUDCInfo($table);
        if ($table_info != false) {
            $table_name = $table_info[0];
            $col = strtolower($table_info[1]);
            $joining_col = strtolower($table_info[2]);
            $joining_table = strtolower($table_info[3]);
        }
        else
        {
            return false;
        }

        if (isset($table_name) && !empty($table_name) && isset($campaign_id) && !empty($campaign_id)) {
            $this->db->select('b.id, b.'.$joining_col.' as text');
            $this->db->from($table_name . " a");
            $this->db->join($joining_table . ' b', 'a.'.$col.' = b.id');
            $this->db->where("b.customer_id", $this->customer_id);
            return $this->db->where("campaign_id", $campaign_id)->get()->result();

        }
    }
/*
    public function getCampaignInfo($campaign_id='')
    {
        $this->db->select('script,suppression_type, suppression_days');
        $this->db->from("campaigns");
        $this->db->where("id", $campaign_id);
        return $this->db->where("customer_id", $this->customer_id)->get()->result()[0];
    }
*/
    public function getCampaignTotalPacingLeadCount($campaign_id='')
    {
        $this->db->select('sum(lead_count) as total');
        $this->db->from("bf_campaign_pacing");
        return $this->db->where("campaign_id", $campaign_id)->get()->result_array()[0]["total"];
    }
    public function getCampaignPacing($campaign_id='')
    {
        $this->db->select('id, start_date, end_date, lead_count');
        $this->db->from("bf_campaign_pacing");
        return $this->db->where("campaign_id", $campaign_id)->get()->result();
    }

    public function changeStatus($campaign_id, $status)
    {
        $status_data["status"] = $status;

        $status_data["modified_by"] = $this->user_id;
        $status_data["modified_on"] =  date("Y-m-d H:i:s", time());
        $this->db->where("customer_id", $this->customer_id);
        $this->db->where("id", $campaign_id);

        $chk = $this->db->update("campaigns",$status_data);
        if ($chk) {
           return 1;
        }
        else
        {
            return $this->db->error();
        }
    }

    public function getCampaignExternalSupp($campaign_id)
    {
        $this->db->select('encryption_type, field_type, batch, rowcount, file_name, table_name');
        $this->db->from("campaign_external_supp");
        $this->db->where("campaign_id", $campaign_id);
        return  $this->db->where("customer_id", $this->customer_id)->order_by('id','desc')->get()->result();
    }

    public function getBatchTableCampaignExternalSupp($campaign_id,$batch="")
    {
        $this->db->select('table_name');
        $this->db->from("campaign_external_supp");
        $this->db->where("campaign_id", $campaign_id);
        return $this->db->where("customer_id", $this->customer_id)->get()->result()[0]->table_name;
    }

    public function deleteCampaignExternalSupp($campaign_id, $batch)
    {
        
        $this->db->where("campaign_id", $campaign_id);
        $this->db->where("batch", $batch);
        $this->db->where("customer_id", $this->customer_id);
        $this->db->delete("campaign_external_supp");

        $this->db->where("id", $batch);
        $this->db->where("customer_id", $this->customer_id);
        $this->db->delete("assets");
    }

    public function getSuppression($campaign_id='')
    {
        $this->db->select("client_id as client_alias_id,suppression_type, suppression_days");
        $this->db->where('id', $campaign_id);
        $this->db->where("customer_id", $this->customer_id);
        $chk = $this->db->from("campaigns")->get();
        if ($chk->num_rows() > 0 ) {
            return $chk->result()[0];
        }
        else
        {
            return false;
        }
    }

    public function getCampaign($id)
    {
       $this->db->select('campaigns.id , campaigns.client_alias_id,
       campaigns.client_id,
                                campaigns.campaign_name ,
                                campaign_grade.name as compaign_grade,
                                campaign_type.name as campaign_type,
                                campaigns.start_date ,
                                campaigns.end_date ,
                                campaigns.total_lead,
                                extended_end_date,
                                campaigns.status ,
                                campaigns.script,
                                campaigns.lead_per_company
                                ',FALSE); 
        $this->db->from("campaigns");
        $this->db->join('campaign_grade', 'campaign_grade.id = campaigns.campaign_grade_id','left');
        $this->db->join('campaign_type', 'campaign_type.id = campaigns.campaign_type_id','left');
        $this->db->where('campaigns.customer_id', $this->customer_id);
        $this->db->where('campaigns.id', $id);
        $campaign_data =$this->db->get();   
        if ($campaign_data->num_rows() > 0) 
        {
            return $campaign_data->result_array();
        }
        else
        {
            return false;
        }
    }
    public function update_data_churned_count($camp)
    {
        $this->db->set("data_churned","data_churned+1", false);
        $this->db->where('campaigns.customer_id', $this->customer_id);
        $this->db->where('campaigns.id', $camp);
        $this->db->update("campaigns");
    }

    public function addSearchResultToCampaign($ids)
    {
       

        $this->db->select('t1.id ,
            t1.job_level_id p_job_level,
            t1.job_functions_id p_job_function,
            t1.salutation_id  p_salutation,
            t1.middle_name p_m_name,
            t1.country p_country,
            t1.first_name p_f_name,
            t1.last_name p_l_name,
            t1.email_id p_email_id,
            t1.mobile_number p_mobile,
            t1.office_number p_office_number,
            t3.domain_name c_domain,
            t2.sic_code_id c_sic,
            t2.nic_code_id c_nic,
            t2.Revenue_id c_revenue,
            t2.Employee_Size_id c_emp_size,
            t2.Industry_Type_id c_industry,
            t2.name c_company')

            ->from('bf_prospects t1')
            ->join('bf_companies t2','t1.company_id=t2.id','left')
            ->join('bf_domains t3','t1.company_id=t3.company_id','left')
            ->where_in('t1.id', $ids) 
            ->where('t1.deleted', 0) 
            ->order_by('t1.id','DESC');
        $dialer_data =$this->db->get();   
        if ($dialer_data->num_rows() > 0) 
        {
            return $dialer_data->result_array();
        }
        else
        {
            return false;
        }                             

    }


    public function getCampaignMandateColumn($id='')
    {
        $q = $this->db->select("b.id,a.col_name,a.lebel,a.key_name,b.status,b.display_status")
            ->from("mandate_col a")
            ->join("campaign_mandate_col b","a.id = b.mc_id")
            ->where("a.customer_id",$this->customer_id)
            ->where("b.campaign_id",$id)
            ->order_by("a.ordering","asc")
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result_array();
        }
        else {
            return false;
        }
    }

    public function getCampaignMandateColumnlive($id='')
    {
        $q = $this->db->select("a.key_name, b.status")
            ->from("mandate_col a")
            ->join("campaign_mandate_col b","a.id = b.mc_id")
            ->where("a.customer_id",$this->customer_id)
            ->where("b.campaign_id",$id)
            ->where("b.display_status",1)
            ->order_by("a.ordering","asc")
            ->get();
        if ($q->num_rows() > 0 ) {
            $v = array();
            foreach ($q->result_array() as $key => $value) {
                $v[$value["key_name"]] = 1;
                if ($value["status"] == 1) {
                    $v[$value["key_name"].'_mandate'] = 1;
                }
            }
            return $v;
        }
        else {
            return false;
        }
    }

    public function update_CampaignmandateColumn()
    {
        $input = $this->input->post();
        //$column = strtolower($data["name"]);
        $column = strtolower($input["name"]);
        $col_type = strtolower($input["col_type"]);
        if ($col_type== "status" || $col_type == "display_status") {
            if ($input["select"] == 0 || $input["select"] == 1) {
                $data = array($col_type => $input["select"], 'modified_by' => $this->user_id);
                //$this->db->where('customer_id', $this->customer_id);
                $this->db->where('id', $input["id"]);
                $this->db->where('campaign_id', $input["campaign_id"]);
                return $this->db->update('campaign_mandate_col', $data);
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
        
    }
    public function getGrades()
    {
            $query =  $this->db->select('id,name as grade')
                            ->from('bf_campaign_grade')
                            ->where('deleted', 0)
                            ->where('customer_id', $this->customer_id)
                            ->get();
           return $query->result();
    }

    public function getBusinessClientList()
    {
         $query =  $this->db->select('id,title')
                            ->from('sale_secret_name')
                            ->where('customer_id', $this->customer_id)
                            ->get();
           return $query->result();
    }

    public function getProspectID($email)
    {
        $this->db->where('email_id', $email);
         $query = $this->db->get('bf_prospects');
      foreach($query->result() as $row)
      {
          $output = $row->id ;
      }
        return $output;
    }


    public function insertClientRejection($array)
    {  
        return $this->db->insert("bf_client_rejection",$array);
    }

    public function getDialerData($id)
    {
       
        $this->db->select('t4.id As lead_id,t1.id As prospect_id,t1.job_level_id,t1.job_functions_id,t1.salutation_id,t1.middle_name,t1.src,t1.zip,t1.state,t1.city,t1.country,t1.address_1,t1.address_2,
            t2.Name As Company,t1.first_name,t1.last_name,t5.name As job_level,
            t6.name AS Job_function_name,
            t10.name AS disposition_name,
            t11.name AS sub_disposition_name,
            t9.campaign_name As campaign_name,
            t1.title,t1.email_id,t1.mobile_number As mobile,
            t1.office_number As Office_Contact,
            t3.domain_name,t4.status As lead_status,
            t7.country_name,t8.state_name,t2.company_src,t2.sic_code_id,t2.nic_code_id,t2.Revenue_id,t2.Employee_Size_id,t2.Industry_Type_id,t12.name AS industry_name,t13.name As employee_size,t14.name As revenue_name,t15.name As salutation_name,t4.agent_disposition,t4.agent_sub_disposition,
            t4.isConsent,t4.isWebVerified,t4.agent_notes,t4.dnc')
            
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
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('bf_udc_salutation t15','t1.salutation_id=t15.id','left')
                            ->where('t1.customer_id', $this->customer_id)
                            ->where('t9.id', $id)
                            ->where('t4.status',0)
                            ->where('t1.deleted', 0) 
                            ->order_by('t1.id','DESC')
                            ->limit(1);
        $dialer_data =$this->db->get();   
        if ($dialer_data->num_rows() > 0) 
        {
            return $dialer_data->result_array();
        }
        else
        {
            return false;
        }                             

    }

    public function getDialerCheckingData($id)
    {
       
        $this->db->select('t4.id As lead_id,t1.id As prospect_id,t1.job_level_id,t1.job_functions_id,t1.salutation_id,t1.middle_name,t1.src,t1.zip,t1.state,t1.city,t1.country,t1.address_1,t1.address_2,
            t2.Name As Company,t1.first_name,t1.last_name,t5.name As job_level,
            t6.name AS Job_function_name,
            t10.name AS disposition_name,
            t11.name AS sub_disposition_name,
            t9.campaign_name As campaign_name,
            t1.title,t1.email_id,t1.mobile_number As mobile,
            t1.office_number As Office_Contact,
            t3.domain_name,t4.status As lead_status,
            t7.country_name,t8.state_name,t2.company_src,t2.sic_code_id,t2.nic_code_id,t2.Revenue_id,t2.Employee_Size_id,t2.Industry_Type_id,t12.name AS industry_name,t13.name As employee_size,t14.name As revenue_name,t15.name As salutation_name,t4.agent_disposition,t4.agent_sub_disposition,
            t4.isConsent,t4.isWebVerified,t4.agent_notes,t4.dnc,
            t16.file_name,t16.full_path')
            
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
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('bf_udc_salutation t15','t1.salutation_id=t15.id','left')
                            ->join('bf_assets t16','t4.id=t16.reference_id','left')
                            ->where('t1.customer_id', $this->customer_id)
                            ->where('t9.id', $id)
                            ->where('t4.status',1)
                            ->where('t1.deleted', 0) 
                            ->order_by('t1.id','DESC')
                            ->limit(1);
        $dialer_data =$this->db->get();   
        if ($dialer_data->num_rows() > 0) 
        {
            return $dialer_data->result_array();
        }
        else
        {
            return false;
        }                             

    }



public function getSequenceCount($campaign_id)
{
     $query = $this->db->where('campaign_id', $campaign_id)->get('bf_tbl_delivery_column_sequence');
           return $query->num_rows();
}


public function getCampCount()
 {
    $query = $this->db->get('bf_campaigns')->where('customer_id', $this->customer_id);
           return $query->num_rows();
 }

public function getLiveCampCount()
{
    $query = $this->db->where('status', 1)->where('customer_id', $this->customer_id)->get('bf_campaigns');
           return $query->num_rows();
}
public function getComplatedCampCount()
{
    $query = $this->db->where('status', 2)->get('bf_campaigns');
           return $query->num_rows();
}
public function getDraftCampCount()
{
    $query = $this->db->where('status', 0)->get('bf_campaigns');
           return $query->num_rows();
}

public function getContractSignedClientsCount()
{
    $query = $this->db->where('status', 4)->get('bf_sale_client_details');
           return $query->num_rows();
}

public function getOnboardClientsCount()
{
    $query = $this->db->where('status', 5)->get('bf_sale_client_details');
           return $query->num_rows();
}

public function getProposalClientsCount()
{
    $query = $this->db->where('status', 2)->get('bf_sale_client_details');
           return $query->num_rows();
}
public function getProposalApprovedClientsCount()
{
    $query = $this->db->where('status', 3)->get('bf_sale_client_details');
           return $query->num_rows();
}

 public function getUserCount()
 {
    $query = $this->db->get('bf_users');
           return $query->num_rows();
 }
 public function getQualityTeamCount()
 {
    $customer_id=$this->customer_id;
    $query = $this->db->where('deleted', 0)->get('bf_quality_group');
           return $query->num_rows();
 }
 
 public function getQualityUserCount()
 {
    $query = $this->db->where('deleted', 0)->get('bf_quality_group');
           return $query->num_rows();
 }

 public function getCdqTeamCount()
 {
    $customer_id=$this->customer_id;
    $query = $this->db->where('deleted', 0)->get('bf_contentdiscovery_group');
           return $query->num_rows();
 }

 public function getCdqUsersCount()
 {
      $query = $this->db->where('deleted', 0)->get('bf_contentdiscovery_user');
           return $query->num_rows();
 }

public function getQualifiedLeadCount()
 {
    $query = $this->db->where('status', 3)->get('bf_leads');
           return $query->num_rows();
 }

public function getAgentDispositions()
{
    $query = $this->db->where('deleted', 0)->get('bf_agent_disposition');
           return $query->num_rows();
}
public function getAgentSubDispositions()
{
    $query = $this->db->where('deleted', 0)->get('bf_agent_sub_disposition');
           return $query->num_rows();
}
public function getQualityDispositions()
{
     $query = $this->db->where('deleted', 0)->get('bf_quality_sub_disposition');
           return $query->num_rows();
}

public function getQualitySubDispositions()
{
     $query = $this->db->where('deleted', 0)->get('bf_quality_disposition');
           return $query->num_rows();
}

public function getPendingLeads()
{
     $query = $this->db->where('status', 0)->get('bf_leads');
           return $query->num_rows();
}

public function getTotalDisqualifiedLeadsCount($current_year)
{
   $query = $this->db->where('year(`created_on`)', $current_year)->where('status',2)->get('bf_leads');
           return $query->num_rows();
}

public function getTotalClientsCount($current_year)
{
   $query = $this->db->where('year(`created_on`)', $current_year)->get('bf_sale_client_details');
           return $query->num_rows();
}

public function getTotalQualifiedLeadsCount($current_year)
{
$query = $this->db->where('year(`created_on`)', $current_year)->where('status',3)->get('bf_leads');
           return $query->num_rows();
}

public function getTotalCampLeadsCount($current_year)
{
    $query = $this->db->where('year(`created_on`)', $current_year)->get('bf_campaigns');
           return $query->num_rows();
}



public function getCallingLeads()
{
     $query = $this->db->where('status', 1)->get('bf_leads');
           return $query->num_rows();
}
public function getQualifiedsLeads()
{
     $query = $this->db->where('status', 3)->get('bf_leads');
           return $query->num_rows();
}
public function getdisqualifiedLeads()
{
     $query = $this->db->where('status', 2)->get('bf_leads');
           return $query->num_rows();
}
public function getDeliveredLeadCount()
 {
    $query = $this->db->where('status', 7)->get('bf_leads');
           return $query->num_rows();
 }

public function getDncLeads()
{
    $query = $this->db->where('status', 4)->get('bf_leads');
           return $query->num_rows();
}

public function getCdqLeads()
{
    $query = $this->db->where('status', 6)->get('bf_leads');
           return $query->num_rows();
} 

public function getRejectedLeads()
{
    $query = $this->db->where('status', 8)->get('bf_leads');
           return $query->num_rows();
}  

public function getRejectLeadCount()
 {
    $query = $this->db->where('status', 8)->get('bf_leads');
           return $query->num_rows();
 }

public function getCampLeads()
{
    $query = $this->db->get('bf_leads');
           return $query->num_rows();
}

 public function getTotalLeadsCount($id)
 {
    $query = $this->db->where('campaign_id', $id)->get('bf_leads');
           return $query->num_rows();
 }

 public function getTotalCampRequiredLeadsCount($campaign_id)
 {
    $query = $this->db->where('id', $campaign_id)->get('bf_campaigns');
           return $query->num_rows();
 }

 public function getTotalCampQualifiedLeadsCount($campaign_id)
 {
    $query = $this->db->where('campaign_id', $campaign_id)
                      ->where('status',3) 
                      ->get('bf_leads');
           return $query->num_rows();

 }

 public function getTotalCampDeliveredLeadsCount($campaign_id)
 {
    $query = $this->db->where('campaign_id', $campaign_id)
                      ->where('status',7) 
                      ->get('bf_leads');
           return $query->num_rows();
 }

 public function getTotalRejectedLeadsCount($campaign_id)
 {
    $query = $this->db->where('campaign_id', $campaign_id)
                      ->where('status',8) 
                      ->get('bf_leads');
           return $query->num_rows();
 }

 public function getAvailabletocall($id)
 {
    return $this->db->where('campaign_id', $id)->where_in('status',[0,1])->get('bf_leads')->num_rows();
          
 }

public function getTotalDisposedLeadsCount($id)
{ 
     $query = $this->db->where('campaign_id', $id)->where_not_in('status', [1,0])->get('bf_leads');
           return $query->num_rows();

}

public function getCompleteLeadData($id)
{
   $this->db->select('t4.id As lead_id,t1.id As prospect_id,t1.job_level_id,t1.job_functions_id,t1.salutation_id,t1.middle_name,t1.src,t1.zip,t1.state,t1.city,t1.country,t1.address_1,t1.address_2,
            t2.Name As Company,t1.first_name,t1.last_name,t5.name As job_level,
            t6.name AS Job_function_name,
            t10.name AS disposition_name,
            t11.name AS sub_disposition_name,
            t9.campaign_name As campaign_name,
            t1.title,t1.email_id,t1.mobile_number As mobile,
            t1.office_number As Office_Contact,
            t3.domain_name,t4.status As lead_status,
            t7.country_name,t8.state_name,t2.company_src,t2.sic_code_id,t2.nic_code_id,t2.Revenue_id,t2.Employee_Size_id,t2.Industry_Type_id,t12.name AS industry_name,t13.name As employee_size,t14.name As revenue_name,t15.name As salutation_name,t4.agent_disposition,t4.agent_sub_disposition,
            t4.isConsent,t4.isWebVerified,t4.agent_notes,t4.dnc,t16.file_name,t16.file_path')
            
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
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('bf_udc_salutation t15','t1.salutation_id=t15.id','left')
                            ->join('bf_assets t16','t4.id=t16.reference_id','left')
                            ->where('t1.customer_id', $this->customer_id)
                            ->where('t4.id', $id)
                            ->where('t1.deleted', 0);

        $dialer_data =$this->db->get();   
        if ($dialer_data->num_rows() > 0) 
        {
            return $dialer_data->result_array();
        }
        else
        {
            return false;
        }                             

}


public function getContentDiscoveryLeadData($id)
{
   $this->db->select('t4.id As lead_id,t1.id As prospect_id,t1.job_level_id,t1.job_functions_id,t1.salutation_id,t1.middle_name,t1.src,t1.zip,t1.state,t1.city,t1.country,t1.address_1,t1.address_2,
            t2.Name As Company,t1.first_name,t1.last_name,t5.name As job_level,
            t6.name AS Job_function_name,
            t10.name AS disposition_name,
            t11.name AS sub_disposition_name,
            t9.campaign_name As campaign_name,
            t1.title,t1.email_id,t1.mobile_number As mobile,
            t1.office_number As Office_Contact,
            t3.domain_name,t4.status As lead_status,
            t7.country_name,t8.state_name,t2.company_src,t2.sic_code_id,t2.nic_code_id,t2.Revenue_id,t2.Employee_Size_id,t2.Industry_Type_id,t12.name AS industry_name,t13.name As employee_size,t14.name As revenue_name,t15.name As salutation_name,t4.agent_disposition,t4.agent_sub_disposition,
            t4.isConsent,t4.isWebVerified,t4.agent_notes,t4.dnc')
            
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
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('bf_udc_salutation t15','t1.salutation_id=t15.id','left')
                            ->where('t1.customer_id', 2)
                            ->where('t9.id', $id)
                            ->where('t4.status',6)
                            ->where('t1.deleted', 0) 
                            ->order_by('t1.id','DESC')
                            ->limit(1);
    $dialer_data =$this->db->get();   
        if ($dialer_data->num_rows() > 0) 
        {
            return $dialer_data->result_array();
        }
        else
        {
            return false;
        }                             

}

public function fetchcolumns($campaign_id)
{
  $this->db->select("bf_tbl_delivery_column_sequence.id,
                                    bf_tbl_delivery_column_sequence.value_name")
                                ->from('bf_tbl_delivery_column_sequence')
                                ->where('bf_tbl_delivery_column_sequence.customer_id', $this->customer_id)
                                ->where('bf_tbl_delivery_column_sequence.campaign_id',$campaign_id)
                                ->order_by('bf_tbl_delivery_column_sequence.sequence_no','ASC');
                                $query = $this->db->get();   
                                 return $query->result(); 
}

public function fetch_columnkey($campaign_id)
{

      $this->db->select("bf_tbl_delivery_column_sequence.id,
                                    bf_tbl_delivery_column_sequence.key_name")
                                ->from('bf_tbl_delivery_column_sequence')
                                ->where('bf_tbl_delivery_column_sequence.customer_id', 2)
                                ->where('bf_tbl_delivery_column_sequence.campaign_id', $campaign_id)
                                ->order_by('bf_tbl_delivery_column_sequence.sequence_no','ASC');
                                $query = $this->db->get();   
                                 return $query->result(); 
}


public function fetch_data($campaign_id)
{
    
    //get Order sequence loop
   $order_sequence = $this->fetchcolumns($campaign_id);
    
       $tmp = '';
    foreach($order_sequence as $row)
     {

         $tmp .= $row->value_name . ','; 
         
     } 
     $tmp = trim($tmp, ',');

      $this->db->select("bf_leads.id as Action,
                                 $tmp")
                                ->from('bf_leads')
                                ->join('bf_campaigns', 'bf_campaigns.id = bf_leads.campaign_id','left')
                                ->join('bf_prospects', 'bf_prospects.id = bf_leads.prospect_id','left')
                                ->join('bf_companies', 'bf_companies.id = bf_prospects.company_id','left')
                                ->join('bf_users', 'bf_users.id = bf_prospects.content_d_user_id','left')
                                 ->join('bf_quality_group', 'bf_quality_group.id = bf_prospects.content_d_group_id','left')
                                ->where('bf_leads.customer_id', $this->customer_id)
                                ->where('bf_leads.campaign_id', $campaign_id)
                                ->where('bf_leads.status',7)
                                ->order_by('bf_leads.id','DESC');
                    $query = $this->db->get();         
 return $query->result();       
}

public function getTotalAgentDispositionsOnDates($start_dt,$end_dt)
{
   $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('customer_id',$this->customer_id)->get('bf_agent_disposition');
           return $query->num_rows();
}

public function getTotalQualityDispositionsOnDates($start_dt,$end_dt)
{
     $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('customer_id',$this->customer_id)->get('bf_quality_disposition');
           return $query->num_rows();
}


public function getTotalDraftCampaignsOnDates($start_dt,$end_dt)
{

     $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('status',0)->where('customer_id',$this->customer_id)->get('bf_campaigns');
           return $query->num_rows();
}
public function getTotalLiveCampaignsOnDates($start_dt,$end_dt)
{

     $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('status',1)->where('customer_id',$this->customer_id)->get('bf_campaigns');
           return $query->num_rows();
}
public function getTotalCompletedCampaignsOnDates($start_dt,$end_dt)
{

     $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('status',2)->get('bf_campaigns');
           return $query->num_rows();
}

public function getTotalOnboardOnDates($start_dt,$end_dt)
{
    $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('status',5)->where('customer_id',$this->customer_id)->get('bf_sale_client_details');
           return $query->num_rows();
}

public function getTotalContractSignedOnDates($start_dt,$end_dt)
{
    $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('status',4)->where('customer_id',$this->customer_id)->get('bf_sale_client_details');
           return $query->num_rows();
}
public function getTotalProposalClientsOnDates($start_dt,$end_dt)
{
    $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('status',2)->where('customer_id',$this->customer_id)->get('bf_sale_client_details');
           return $query->num_rows();
}
public function getTotalProposalApprovedClientsOnDates($start_dt,$end_dt)
{
    $query = $this->db->where("created_on BETWEEN '$start_dt' AND '$end_dt' ")->where('status',3)->where('customer_id',$this->customer_id)->get('bf_sale_client_details');
           return $query->num_rows();
}

}