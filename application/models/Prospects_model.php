<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Prospects_model extends CI_Model {

	public function isEmailExists($emailid) {

		$q = $this->db->select("id")
			->from("prospects")
			->where("email_id",$emailid)
			->where("customer_id",$this->customer_id)
			->order_by("id", 'DESC')
			->limit(1)
			->get();
			
			
		if ($q->num_rows() > 0 ) {
			return $q->result()[0]->id;
		}
		else {
			return false;
		}
	}

    public function isProspectExistsFl($first_name,$last_name) {
        $q = $this->db->select("*")
            ->from("prospects")
            ->where("first_name",$first_name)
            ->where("last_name",$last_name)
            ->where("customer_id",$this->customer_id)
            ->limit(1)
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result()[0]->id;
        }
        else {
            return false;
        }
    }

    public function isProspectExistsFlC($first_name,$last_name,$Company) {
        $q = $this->db->select("t1.id")
            ->from('bf_prospects t1')
            ->join('bf_companies t2','t1.company_id=t2.id','left')
            ->where("t1.first_name",$first_name)
            ->where("t1.last_name",$last_name)
            ->where("t2.name",$Company)
            ->where("t1.customer_id",$this->customer_id)
            ->limit(1)
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result()[0]->id;
        }
        else {
            return false;
        }
    }

    public function isProspectExistsFlCWithLeftCharlenght($first_name,$last_name,$Company,$firstCharLenght) {
        $q = $this->db->select("t1.id")
            ->from('bf_prospects t1')
            ->join('bf_companies t2','t1.company_id=t2.id','left')
            ->where("left(t1.first_name,".$firstCharLenght.")",mb_substr($first_name , 0, $firstCharLenght) )
            ->where("left(t1.last_name,".$firstCharLenght.")",mb_substr($last_name , 0, $firstCharLenght) )
            ->where("left(t2.name,".$firstCharLenght.")",mb_substr($Company , 0, $firstCharLenght) )
            ->where("t1.customer_id",$this->customer_id)
            ->limit(1)
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result()[0]->id;
        }
        else {
            return false;
        }
    }
    
    public function isProspectExistsFlD($first_name,$last_name,$domain_name) {
        $q = $this->db->select("t1.id")
            ->from('bf_prospects t1')
            ->join('bf_companies t2','t1.company_id=t2.id','left')
           ->join('bf_domains t3','t2.id=t3.company_id','left')
            ->where("t1.first_name",$first_name)
            ->where("t1.last_name",$last_name)
            ->where("t3.domain_name",$domain_name)
            ->where("t1.customer_id",$this->customer_id)
            ->limit(1)
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result()[0]->id;
        }
        else {
            return false;
        }
    }

    public function isProspectExistsFlDWithLeftCharlenght($first_name,$last_name,$domain_name,$firstCharLenght) {
        $q = $this->db->select("t1.id")
            ->from('bf_prospects t1')
            ->join('bf_companies t2','t1.company_id=t2.id','left')
            ->join('bf_domains t3','t2.id=t3.company_id','left')
            ->where("left(t1.first_name,".$firstCharLenght.")",mb_substr($first_name , 0, $firstCharLenght) )
            ->where("left(t1.last_name,".$firstCharLenght.")",mb_substr($last_name , 0, $firstCharLenght) )
            ->where("left(t3.domain_name,".$firstCharLenght.")",mb_substr($domain_name , 0, $firstCharLenght) )
            ->where("t1.customer_id",$this->customer_id)
            ->limit(1)
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result()[0]->id;
        }
        else {
            return false;
        }
    }

    public function dedup($input,$dedup_settings)
    {
        $error_message ="";
        
        if($dedup_settings["email"])
        {
            if($input["p_email_id"] == "" || $input["p_email_id"] == "" )
            {
                return $error_message .= " Email Required";
            }
            
            if ( $this->isEmailExists($input["p_email_id"]) !== false)
            {
                return $error_message .= " Duplicate By Email";
            }
        }
        if($dedup_settings["fl"])
        {
            if($input["p_f_name"] == "" || $input["p_l_name"] == "" )
            {
                return $error_message .= " Duplicate By fl - First & Last Name Required";
            }
            if ($this->isProspectExistsFl($input["p_f_name"],$input["p_l_name"]) !== false)
            {
                return $error_message .= " Duplicate By fl";
            }
        }
        if($dedup_settings["flc"])
        {
            if($input["p_f_name"] == "" || $input["p_l_name"] == "" || $input["c_company"] == "" )
            {
                return $error_message .= " Duplicate By flC - Company, First & Last Name Required";
            }

            if ($this->isProspectExistsFlC($input["p_f_name"],$input["p_l_name"],$input["c_company"]) !== false)
            {
                return $error_message .= " Duplicate By flc";
            }
        }
        if($dedup_settings["f5l5c5"])
        {
            if($input["p_f_name"] == "" || $input["p_l_name"] == "" || $input["c_company"] == "" )
            {
                return $error_message .= " Duplicate By flC - Company, First & Last Name Required";
            }
            if ($this->isProspectExistsFlC($input["p_f_name"],$input["p_l_name"],$input["c_company"],5) !== false)
            {
                return $error_message .= " Duplicate By f5l5c5";
            }
        }
        if($dedup_settings["f3l3c3"])
        {
            if($input["p_f_name"] == "" || $input["p_l_name"] == "" || $input["c_company"] == "" )
            {
                return $error_message .= " Duplicate By flC - Company, First & Last Name Required";
            }
            if ($this->isProspectExistsFlC($input["p_f_name"],$input["p_l_name"],$input["c_company"],3) !== false)
            {
                return $error_message .= " Duplicate By f3l3c3";
            }
        }
        
        if($dedup_settings["fld"])
        {
            if($input["p_f_name"] == "" || $input["p_l_name"] == "" || $input["c_domain"] == "" )
            {
                return $error_message .= " Duplicate By fld - Domain, First & Last Name Required";
            }

            if ($this->isProspectExistsFlD($input["p_f_name"],$input["p_l_name"],$input["c_domain"]) !== false)
            {
                return $error_message .= " Duplicate By fld";
            }
        }
        if($dedup_settings["f5l5d5"])
        {
            if($input["p_f_name"] == "" || $input["p_l_name"] == "" || $input["c_domain"] == "" )
            {
                return $error_message .= " Duplicate By fld - Domain, First & Last Name Required";
            }
            if ($this->isProspectExistsFlDWithLeftCharlenght($input["p_f_name"],$input["p_l_name"],$input["c_domain"],5) !== false)
            {
                return $error_message .= " Duplicate By f5l5d5";
            }
        }
        if($dedup_settings["f3l3d3"])
        {
            if($input["p_f_name"] == "" || $input["p_l_name"] == "" || $input["c_domain"] == "" )
            {
                return $error_message .= " Duplicate By fld - Domain, First & Last Name Required";
            }
            
            if ($this->isProspectExistsFlDWithLeftCharlenght($input["p_f_name"],$input["p_l_name"],$input["c_domain"],3) !== false)
            {
                return $error_message .= " Duplicate By f3l3d3";
            }
        }
        return $error_message;
    }

    function validateUDC($arr, $str)
    {
        foreach ($arr as $key => $value) {
            if ( trim(strtolower($value->text)) == trim(strtolower($str))) {
                     return $value->id;
            }    
        }
        return false;
    }

    function validateUDCByID($arr, $str)
    {
        foreach ($arr as $key => $value) {
            if ( trim(strtolower($value->id)) == trim(strtolower($str))) {
                     return $value->id;
            }    
        }
        return false;
    }


    
    public function udc_validation($data,$input, $manula="")
    {
        $error_message = "";
        $arr_udc_col = [];
        $arr_udc_col["c_nic"] = "NIC";
        $arr_udc_col["c_sic"] = "SIC";
        $arr_udc_col["p_salutation"] = "Salutation";
        $arr_udc_col["c_country"] = "Company Country";
        $arr_udc_col["p_country"] = "Prospect Country";
        $arr_udc_col["c_emp_size"] = "Employee Size";
        $arr_udc_col["c_revenue"] = "Revenue";
        $arr_udc_col["p_job_function"] = "Job Function";
        $arr_udc_col["c_industry"] = "Industry";
        $arr_udc_col["p_job_level"] = "Job Level";
        
        foreach($arr_udc_col as $key => $value)
        {
            if (empty($input[$key]) || $input[$key] == "") {
               $input[$key] = '';
            }
            else
            {  
                $chk = "";
                if ($manula != "") {
                    $chk = $this->validateUDCByID($data[$key], $input[$key]);
                }
                else
                {
                     $chk = $this->validateUDC($data[$key], $input[$key]);
                }
               
                if ($chk == false)
                {
                    $error_message .= $input[$key] . " :  ". $value ." is not per UDC;";
                }
                else
                {
                    $input[$key] = $chk;
                }
            }
        }

        if ($error_message == "")
        {
            return $input;
        }
        else{
            return $error_message;
        }
    }
	public function getData( $limit = 100)
    {
        $input = $this->input->post();
        if (isset($input["select_job_level"]) && !empty($input["select_job_level"]))
        {
            $select_job_level = explode(',',ltrim($this->input->post("select_job_level"),','));   
            if (sizeof($select_job_level) > 0 )
            {
                $this->db->where_in('t1.job_level_id',$select_job_level);   
            } 
        }
        
        if (isset($input["select_job_function"]) && !empty($input["select_job_function"])) 
        {
            $select_job_function = explode(',',ltrim($this->input->post("select_job_function"),','));
            if (sizeof($select_job_function) > 0 )
            {
                $this->db->where_in('t1.job_functions_id',$select_job_function);   
            }
        }

        if (isset($input["select_industry"]) && !empty($input["select_industry"])) 
        {
            $select_industry = explode(',',ltrim($this->input->post("select_industry"),','));
            if (sizeof($select_industry) > 0 )
            {
                $this->db->where_in('t2.Industry_Type_id',$select_industry);   
            }
        }

        if (isset($input["select_employee"]) && !empty($input["select_employee"])) {
            $select_employee = explode(',',ltrim($this->input->post("select_employee"),','));
            if (sizeof($select_employee) > 0 )
            {
                $this->db->where_in('t2.Employee_Size_id',$select_employee);   
            }
        }
        
 
        if (isset($input["select_country"]) && !empty($input["select_country"])) 
        {
            $select_country = explode(',',ltrim($this->input->post("select_country"),','));
            if (sizeof($select_country) > 0 )
            {
                $this->db->where_in('t1.country',$select_country);   
            }
        }

        if (isset($input["txt_Search_number_ctps"]) && !empty($input["txt_Search_number_ctps"])) 
        {
            $txt_Search_number_ctps= explode(',',ltrim($this->input->post("txt_Search_number_ctps"),','));
            if ( sizeof($txt_Search_number_ctps) > 0  )
            {
                $this->db->group_start();
                foreach($txt_Search_number_ctps as $cat) {
                     $this->db->or_like('t1.title',$cat,'both'); 
                }
                $this->db->group_end();
            }

        }
        if (isset($input["company"]) && !empty($input["company"])) 
        {
            $company= explode(',',ltrim($this->input->post("company"),','));
            if ( sizeof($company) > 0  )
            {
                $this->db->group_start();
                foreach($company as $cat) {
                     $this->db->or_like('t1.company_id',$cat,'both'); 
                }
                $this->db->group_end();
            }

        }
        if (isset($input["txt_Prospect_tech"]) && !empty($input["txt_Prospect_tech"])) 
        {
            $txt_Prospect_tech= explode(',',ltrim($this->input->post("txt_Prospect_tech"),','));
            if ( sizeof($txt_Prospect_tech) > 0  )
            {
                $this->db->group_start();
                foreach($txt_Prospect_tech as $cat) {
                     $this->db->or_like('prospect_technology',$cat,'both'); 
                }
                $this->db->group_end();
            }
        }
        if (isset($input["txt_company_tech"]) && !empty($input["txt_company_tech"])) 
        {
            $txt_company_tech= explode(',',ltrim($this->input->post("txt_company_tech"),','));
            if ( sizeof($txt_company_tech) > 0  )
            {
                $this->db->group_start();
                foreach($txt_company_tech as $cat) {
                     $this->db->or_like('company_technology',$cat,'both'); 
                }
                $this->db->group_end();
            }
        }

        if (isset($input["prospect_date_start_time"]) && !empty($input["prospect_date_start_time"]) && isset($input["prospect_date_end_time"]) && !empty($input["prospect_date_end_time"])) 
        {
            $prospect_date_start_time = $this->input->post("prospect_date_start_time");
            $prospect_date_end_time = $this->input->post("prospect_date_end_time");
            $this->db->group_start();
                $this->db->where('t1.created_on >=',$prospect_date_start_time); 
                $this->db->where('t1.created_on <=',$prospect_date_end_time); 
            $this->db->group_end();
        }
        else if (isset($input["prospect_date_end_time"]) && !empty($input["prospect_date_end_time"])) 
        {
            $prospect_date_end_time = $this->input->post("prospect_date_end_time");
            $this->db->where('t1.created_on <=',$prospect_date_end_time); 
        }
        else if (isset($input["prospect_date_start_time"]) && !empty($input["prospect_date_start_time"])) 
        {
            $prospect_date_start_time = $this->input->post("prospect_date_start_time");
            $this->db->where('t1.created_on >=',$prospect_date_start_time); 
        }
        
        return $this->db->select('  t1.id,t2.id as company_id ,t1.first_name,t1.last_name,t1.middle_name,t2.name as Company,direct_number,mobile_number,office_number,title,t5.name job_level, t6.name job_function,t12.name Industry,t13.name Employee , t14.name Revenue,t7.name country, t1.state , t1.city,t1.zip, job_info, prospect_technology, company_technology')
                            ->from('bf_prospects t1')
                            ->join('bf_companies t2','t1.company_id=t2.id and t2.customer_id = '.$this->customer_id,'left')
                            ->join('bf_domains t3','t2.id=t3.company_id','left')
                            ->join('bf_udc_job_level t5','t1.job_level_id=t5.id','left')
                            ->join('bf_udc_job_function t6','t1.job_functions_id=t6.id','left')
                            ->join('bf_udc_country t7','t1.country=t7.id','left')
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('prospects_technology', 't1.id = prospects_technology.prospect_id','left')
                            ->join('company_technology', 't1.company_id = company_technology.company_id','left')
                            ->where('t1.customer_id', $this->customer_id);
                            //->where('t1.deleted', 0) 
                            //->limit($limit);
         
        }

   
    public function prospectsByIds($prospects,$type="prospects")
    {
         $this->db->select('t1.id,t2.id as company_id ,t1.email_id,t1.first_name,t1.last_name,t1.middle_name,t2.name as Company,company_src,direct_number,mobile_number,office_number,title,t5.name job_level, t6.name job_function,t12.name Industry,t13.name Employee , t14.name Revenue,t14.revenuelink,t7.name country, t1.state , t1.city,t1.zip, t1.address_1, t1.address_2, job_info, t1.src,prospect_technology, t19.code  nic, t18.code  sic, company_technology,linkedin,facebook,twitter,tiktok,instagram,snapchat,t20.domain_name');
                            $this->db->from('bf_prospects t1')
                            ->join('bf_companies t2','t1.company_id=t2.id','left')
                            //->join('bf_domains t3','t2.id=t3.company_id','left')
                            ->join('bf_udc_job_level t5','t1.job_level_id=t5.id','left')
                            ->join('bf_udc_job_function t6','t1.job_functions_id=t6.id','left')
                            ->join('bf_udc_country t7','t1.country=t7.id','left')
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('bf_prospects_technology t15','t1.id=t15.prospect_id','left')
                            ->join('bf_company_technology t17','t17.company_id=t2.id','left')
                            ->join('bf_prospect_social_links t16','t1.id=t16.prospect_id','left')
                            ->join('udc_sic_code t18','t18.id=t2.sic_code_id','left')
                            ->join('udc_nic_code t19','t19.id=t2.NIC_Code_id','left')
                            ->join('domains t20','t2.Primary_Domain=t20.company_id','left')
                            ->where("t1.customer_id",$this->customer_id);
        //return   $this->db->where("t2.id",1390791);                    
        return   $this->db->where_in("t1.id",$prospects);
    } 

    public function prospectsByIdsExportToEcs($prospects, $lebel="")
    {
        
        $cols = array(
        "p_salutation"=>"t23.name as Salutation",
        "p_f_name"=>"t1.first_name",
        "p_m_name"=>"t1.middle_name",
        "p_l_name"=>"t1.last_name",
        "p_email_id"=>"t1.email_id",
        "p_title"=>"title",
        "p_job_level"=>"t5.name job_level",
        "p_job_function"=>"t6.name job_function",
        "c_company"=>"t2.name as Company",
        "c_domain"=>"t20.domain_name",
        "c_industry"=>"t12.name Industry",
        "p_office_ext"=>"direct_number",
        "p_office_number"=>"office_number",
        "p_mobile"=>"mobile_number",
        "address"=>"t1.address_1",
        "address2"=>"t1.address_2",
        "p_state"=>"t1.state",
        "p_city"=>"t1.city",
        "p_zip"=>"t1.zip",
        "p_country"=>"t7.name country",
        "p_hob_title_link"=>"t1.src",
        "c_company_link"=>"company_src",
        "c_emp_size"=>"t13.name Employee",
        "c_revenue"=>"t14.name Revenue",
        "c_revenue_link"=>"t14.revenuelink",
        "c_nic"=>"t19.code nic",
        "c_sic"=>"t18.code sic",
        "c_country"=>"t22.name Company_country",
        "c_state"=>"t2.state as Company_State",
        "c_city"=>"t2.city Company_city",
        "c_zip"=>"t2.zip Company_zip",
        "c_address"=>"t2.address Company_address",
        "p_technology"=>"prospect_technology",
        "c_technology"=>"company_technology"
        );

        $data = $this->getMandateColumn("prospect");
        $rows = $this->getallenabledotherColumn();
        $header = [];
        $col_order = [];
        $select = "";
        foreach ($data as $key => $value) {
            foreach ($cols as $key1 => $value1) {
               if($value["key_name"] == $key1)
               {
                $header[] = $value["lebel"];
                $select .= $value1.',';
               }
            }
        }
        if ($rows != false) {
            foreach ($rows as $key => $value) {
                $header[] = $value["lebel"];
                $select .= 't24.'.$value["attribue_name"].',';
            }
        }
        
        if ($lebel != "") {
           return $header;
        }
        $select = trim($select,",");
        $this->db->select($select, false);

                            $this->db->from('bf_prospects t1')
                            ->join('bf_companies t2','t1.company_id=t2.id','left')
                            ->join('bf_udc_job_level t5','t1.job_level_id=t5.id','left')
                            ->join('bf_udc_job_function t6','t1.job_functions_id=t6.id','left')
                            ->join('bf_udc_country t7','t1.country=t7.id','left')
                             ->join('bf_udc_country t22','t2.country=t22.id','left')
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('bf_prospects_technology t15','t1.id=t15.prospect_id','left')
                            ->join('bf_company_technology t17','t17.company_id=t2.id','left')
                            ->join('bf_prospect_social_links t16','t1.id=t16.prospect_id','left')
                            ->join('udc_sic_code t18','t18.id=t2.sic_code_id','left')
                            ->join('udc_nic_code t19','t19.id=t2.NIC_Code_id','left')
                            ->join('domains t20','t2.Primary_Domain=t20.company_id','left')
                            ->join('udc_salutation t23',"t1.salutation_id = t23.id",'left')
                            ->join('prospect_other_info t24',"t1.id = t24.id", "left")
                            ->join('datasource','datasource.id = t1.datasource','left')
                            ->where("t1.customer_id",$this->customer_id);
         return   $this->db->where_in("t1.id",$prospects);

    } 

        public function details($prospects,$type="prospects")
    {
         $this->db->select('t1.id,t2.id as company_id ,t1.email_id,t1.first_name,t1.last_name,t1.middle_name,t2.name as Company,company_src,direct_number,mobile_number,office_number,title,t12.name Industry,t13.name Employee , t14.name Revenue,t14.revenuelink, t1.state , t1.city,t1.zip, t1.address_1, t1.address_2, job_info, t1.src,prospect_technology, t19.code  nic, t18.code  sic, t2.address as company_address,company_technology,linkedin,facebook,twitter,tiktok,instagram,snapchat,t20.domain_name, t1.job_functions_id, t1.job_level_id,t1.country,iswebverified,isemailverified,iscallverified, t2.state as company_state, t2.city as company_city,t2.zip as company_zip,t22.name as company_country,t16.prospect_id as social_id')
                            ->from('bf_prospects t1')
                            ->join('bf_companies t2','t1.company_id=t2.id and  t1.customer_id = ' . $this->customer_id,'left')
                            //->join('bf_domains t3','t2.id=t3.company_id','left')
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('bf_prospects_technology t15','t1.id=t15.prospect_id','left')
                            ->join('bf_company_technology t17','t17.company_id=t2.id','left')
                            ->join('bf_prospect_social_links t16','t1.id=t16.prospect_id','left')
                            ->join('udc_sic_code t18','t18.id=t2.sic_code_id','left')
                            ->join('udc_nic_code t19','t19.id=t2.NIC_Code_id','left')
                            ->join('domains t20','t2.id=t20.company_id','left')
                            ->join('bf_udc_country t22','t2.country=t22.id','left');
                            //->where(");
        //return   $this->db->where("t2.id",1390791);                    
        if ($type=="company") {
         return   $this->db->where("t2.id",$prospects);
        }
        else{
         return   $this->db->where("t1.id",$prospects);
        }
    }    
/*
    public function assignNextleadToAgentAuto( $campaign_id, $direct_landed_lead_id="") {
        if ($direct_landed_lead_id=="") {
            $this->db->where("id not in (select lead_id from bf_lead_skipped where user_id=".$this->user_id." and campaign_id = ".$campaign_id. " and customer_id=".$this->customer_id.")",null)->limit(1);
        }
        else
        {
            $this->db->where('id',$direct_landed_lead_id);
        }
        $a = $this->db->select("leads.id, leads.prospect_id, leads.campaign_id,leads_others_details.callback")
            ->from("leads")
            ->join('leads_others_details','leads.id = leads_others_details.lead_id','left')
            ->where("agent",$this->user_id)
            ->where("status",'1')
            ->where('((auto_dial = 0 and (bf_leads.asset_id is NULL or bf_leads.asset_id  = 0)) or auto_dial = 2 )',null,false)
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
                $q = $this->db->select("leads.id, leads.prospect_id, leads.campaign_id,leads_others_details.callback")
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
            }
            else
            {
                return 2;
            }
        }
        else
        {
            return  $a->result_array();
        }
        
    }    
*/
    public function getMandateColumn($name='')
    {
        $q = $this->db->select("*")
            ->from("mandate_col")
            ->where("customer_id",$this->customer_id)
            ->where("name",$name)
            ->order_by("ordering","asc")
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result_array();
        }
        else {
            return false;
        }
    }

    public function update_mandateColumn()
    {
        $data = $this->input->post();
        $column = strtolower($data["name"]);
        $col_type = strtolower($data["col_type"]);
        if ($col_type== "status" || $col_type == "display_status") {
            if ($data["select"] == 0 || $data["select"] == 1) {
                $data = array($col_type => $data["select"], 'modified_by' => $this->user_id);
                $this->db->where('customer_id', $this->customer_id);
                $this->db->where('col_name', $column);
                return $this->db->update('mandate_col', $data);
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
    public function update_order_mandateColumn()
    {
        $data = $this->input->post();
        $column = strtolower($data["order"]);
        if (isset($column)) {
            $items = explode(",",$column);
            for ($i=0; $i < sizeof($items) ; $i++) { 
                $data = array('ordering' => $i, 'modified_by' => $this->user_id);
                $this->db->where('customer_id', $this->customer_id);
                $this->db->where('id', $items[$i]);
                $this->db->update('mandate_col', $data);
            }
        }
        else
        {
            return false;
        }
        
    }
    
     public function getallenabledotherColumn($id='')
    {
        $this->db->select("*")->from("prospects_other_info_level");
        $this->db->where("customer_id",$this->customer_id);
        $this->db->where("enabled",1);
        $q = $this->db->get();
        if ($q->num_rows() > 0 ) {
            return $q->result_array();
        }
        else {
            return 0;
        }
    }

    public function getallotherColumn($id='')
    {
        $this->db->select("*")->from("prospects_other_info_level");
        $this->db->where("customer_id",$this->customer_id);
        if($id != ""){$this->db->where("prospect_id",$id);}
        $q = $this->db->get();
        if ($q->num_rows() > 0 ) {
            return $q->result_array();
        }
        else {
            return 0;
        }
    }

    public function getallotherColumnEnabledWithoutValue($id='')
    {
        $this->db->select("lebel,attribue_name")->from("prospects_other_info_level");
        $this->db->where("customer_id",$this->customer_id);
        $this->db->where("enabled","1");
        $q = $this->db->get();
        if ($q->num_rows() > 0 ) {
            return $q->result_array();
        }
        else {
            return 0;
        }
    }
    public function getallotherColumnEnabled($id='')
    {
        $this->db->select("lebel,attribue_name")->from("prospects_other_info_level");
        $this->db->where("customer_id",$this->customer_id);
        $this->db->where("enabled","1");
        $q = $this->db->get();
        if ($q->num_rows() > 0 ) {
            $arr = array();
            $oce =  $q->result_array();
            $this->db->select("*")->from("prospect_other_info");
            $this->db->where("customer_id",$this->customer_id); 
            $this->db->where("id",$id);
            $qq = $this->db->get();
            if ($qq->num_rows() > 0 ) {
                $oc =  $qq->result_array();
                foreach ($oce as $key => $value) {
                    foreach ($oc as $key1 => $value1) {
                        if ($value["attribue_name"] == $key1) {
                           $arr [] = array("name"=>$this->encrypt->encode($value["lebel"]),
                                        "cssname" => $value["lebel"],
                                        "text" => $value1[$value["attribue_name"]],
                                        "value" => $value1[$value["attribue_name"]],
                                        "lebel"=>$value["lebel"],
                                        "attribue_name" => $value["attribue_name"],
                                    );
                        }
                    }
                }
            }
            else{
                foreach ($oce as $key1 => $value) {
                       $arr [] = array("name"=>$this->encrypt->encode($value["lebel"]),
                                        "cssname" => $value["lebel"],
                                        "text" => "",
                                        "value" => "",
                                        "lebel"=>$value["lebel"],
                                        "attribue_name" => $value["attribue_name"],
                                );
                    }
            }
            return $arr;
            
        }
        else {
            return 0;
        }
    }
    public function update_otherColumn()
    {
        $data = $this->input->post();
        $type = strtolower($data["type"]);
        $id = $data["name"];
        if($type == "mandate"){
            $data1 = array('is_mandate' => $data["select"], 'modified_by' => $this->user_id);
        }
        if($type == "enable"){
            $data1 = array('enabled' => $data["select"], 'modified_by' => $this->user_id);
        }
        if ($data["select"] == 0 || $data["select"] == 1) {
            $this->db->where('id', $id);
            $this->db->where('customer_id', $this->customer_id);
             return $this->db->update('prospects_other_info_level', $data1);
             echo $this->db->last_query();
             return;
        }
        else
        {
            return false;
        }
        
    }

    public function getDedupSuppMethod($value='')
    {
        $q = $this->db->select("*")
            ->from("suppression")
            ->where("customer_id",$this->customer_id)
            ->limit(1)
            ->get();
            
        if ($q->num_rows() > 0 ) {
            return $q->result_array()[0];
        }
        else {
            return 0;
        }
    }

    public function update_dedup()
    {
        $data = $this->input->post();
        $column = strtolower($data["name"]);
        if ($data["select"] == 0 or $data["select"] == 1) {
            $data = array($data["name"] => $data["select"]);
            $this->db->where('customer_id', $this->customer_id);
            return $this->db->update('suppression', $data);
        }
        else
        {
            return false;
        }
    }

    public function addNewProspect($input='',$enabledOtherCol="",$datasource="")
    {
        $error_message ="";
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
        $insert_data["datasource"] = $datasource;
        $C_insert_data["name"] = $input["c_company"];
        
        $company_count = $this->db->get_where('companies', $C_insert_data, 1);
        
        $C_insert_data["name"] = $input["c_company"];
        $C_insert_data["Industry_Type_id"] = $input["c_industry"];
        $C_insert_data["Employee_Size_id"] = $input["c_emp_size"];
        $C_insert_data["state"] = $input["c_state"];
        $C_insert_data["zip"] = $input["c_zip"];
        $C_insert_data["city"] = $input["c_city"];
        $C_insert_data["country"] = $input["c_country"];
        $C_insert_data["address"] = $input["c_address"];
        $C_insert_data["Revenue_id"] = $input["c_revenue"];

        $search_domain = array("domain_name"=> $input["c_domain"],
                                     "customer_id" =>  $this->customer_id
                                     
                                    );
        $domain_count = $this->db->get_where('domains', $search_domain, 1);
        //return $input["c_domain"];
        if ($company_count->result_id->num_rows == 0) {
            $C_insert_data["city"] = $input["c_city"];
            $C_insert_data["Revenue_id"] = $input["c_revenue"];
            $C_insert_data["created_on"] = date("Y-m-d H:i:s");
            $C_insert_data["created_by"] = $this->user_id;
            $C_insert_data["customer_id"] = $this->customer_id;
            $C_insert_data["NIC_Code_id"] = $input["c_nic"];
            $C_insert_data["sic_code_id"] = $input["c_sic"];
            $C_insert_data["company_src"] = $input["c_company_link"];
            $C_insert_data["country"] = $input["c_country"];
            $C_insert_data["address"] = $input["c_address"];
            //$C_insert_data["Primary_Domain"] =  $insert_data["domain_id"]; 
            $insert_data["customer_id"] = $this->customer_id;
            $C_insert_data["created_on"] = date("Y-m-d H:i:s");
            $C_insert_data["created_by"] = $this->user_id;
            $C_insert_data["customer_id"] = $this->customer_id;
            $c_chk = $this->db->insert('companies',$C_insert_data );
            if ($c_chk) {
                $new_cid =  $this->db->insert_id();

                if ($domain_count->result_id->num_rows == 0) {
                    $d_data["created_on"] = date("Y-m-d H:i:s");
                    $d_data["created_by"] = $this->user_id;
                    $d_data["customer_id"] = $this->customer_id;
                    $d_data["domain_name"] = $input["c_domain"];
                    $d_data["company_id"] = $new_cid;
                    $this->db->insert('domains',$d_data);
                    $insert_data["domain_id"] = $this->db->insert_id();
                }
                else{
                    $insert_data["domain_id"] = $domain_count->result()[0]->id;
                }
                $insert_data["company_id"] =$new_cid;
                $company_technology = [];
                $company_technology["company_id"] = $new_cid;
                $company_technology["created_on"] = date("Y-m-d H:i:s");
                $company_technology["created_by"] = $this->user_id;
                $company_technology["customer_id"] = $this->customer_id;
                $company_technology["company_technology"] = $input["c_technology"];
                $this->db->insert('company_technology',$company_technology );
            }
            else 
            {
               $error_message .= "Company not added".$this->db->error()["message"];
            }
        }
        else
        {
            $insert_data["company_id"] = $company_count->result()[0]->id;
        }
        $insert_data["created_on"] = date("Y-m-d H:i:s");
        $insert_data["created_by"] = $this->user_id;
        $insert_data["customer_id"] = $this->customer_id;
        $pchk =$this->db->insert('prospects',$insert_data );
        if ($pchk) {
            $new_pid =  $this->db->insert_id();
            $data_prospect_insert_enry = array('prospect_id' =>$new_pid,
                'md5' => md5( $insert_data["email_id"]),
                'sha' => sha1( $insert_data["email_id"]),
                'sha2' => hash('sha256', $insert_data["email_id"])
            );
            $this->db->insert('prospect_encrypted',$data_prospect_insert_enry );
            if($enabledOtherCol != false)
            {
                $additionalAttribute = [];

                foreach ($enabledOtherCol as $key => $value) { // additional cols
                    $additionalAttribute[$value["attribue_name"]] =  $input[$value["attribue_name"]];
                }
                $additionalAttribute["created_on"] = date("Y-m-d H:i:s");
                $additionalAttribute["created_by"] = $this->user_id;
                $additionalAttribute["customer_id"] = $this->customer_id;
                $additionalAttribute["id"] = $new_pid;
                $this->db->insert('prospect_other_info',$additionalAttribute );
            }
            
            $prospects_technology = [];
            $prospects_technology["prospect_id"] = $new_pid;
            $prospects_technology["created_on"] = date("Y-m-d H:i:s");
            $prospects_technology["created_by"] = $this->user_id;
            $prospects_technology["customer_id"] = $this->customer_id;
            $prospects_technology["prospect_technology"] = $input["p_technology"];
            $this->db->insert('prospects_technology',$prospects_technology );
            return $new_pid;
        }
        else
        {
            $error_message .=  "prospect not added".( $this->db->error()["message"]);
            return $error_message;
        }
    }
}