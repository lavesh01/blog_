<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UDC_model extends CI_Model {

    public function __construct()
    {
            parent::__construct();
            // Your own constructor code
    }

    public function udc($table_name='', $search_term="")
    {
        $select_str ="";
    	 switch ($table_name) {
            case 'level':
                $table_name = "bf_udc_job_level";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'group':
                $table_name = "bf_users";
                $select_str = "id, email as text";
                $where = "email";
                break;
            case 'contentdiscoverygroup':
                $table_name = "bf_users";
                $select_str = "id, email as text";
                $where = "email";
                break;    
            case 'campaign':
                $table_name = "bf_campaigns";
                $select_str = "id, campaign_name as text";
                $where = "campaign_name";
                break;
            case 'nic':
                $table_name = "bf_udc_nic_code";
                $select_str = "id, code as text";
                $where = "code";
                break;
            case 'sic':
                $table_name = "bf_udc_sic_code";
                $select_str = "id, code as text";
                $where = "code";
                break;
            case 'function':
                $table_name = "bf_udc_job_function";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'industry':
                $table_name = "bf_udc_industry";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'revenue':
                $table_name = "bf_udc_revenue";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'country':
                $table_name = "bf_udc_country";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'salutation':
                $table_name = "bf_udc_salutation";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'technologies':
                $table_name = "udc_technologies";
                $select_str = "id, code as text";
                $where = "code";
                break;
            case 'employee':
            	$table_name = "bf_udc_employee_size";
            	$select_str = "id, name as text";
            	$where = "name";
                break;
            case 'BusinessSecretName':
                $table_name = "bf_sale_secret_name";
                $select_str = "id, title as text";
                $where = "title";
                break;
            case 'quality_disposition':
                $table_name = "bf_quality_disposition";
                $select_str = "id, name as text";
                $where = "name";
                break;
             case 'quality_sub_disposition':
                $table_name = "bf_quality_sub_disposition";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'agent_disposition':
                $table_name = "bf_agent_disposition";
                $select_str = "id, name as text";
                $where = "name";
                break;
             case 'agent_sub_disposition':
                $table_name = "bf_agent_sub_disposition";
                $select_str = "id, name as text";
                $where = "name";
                break;
            case 'datasource':
                $table_name = "bf_datasource";
                $select_str = "id, datasource as text";
                $where = "datasource";
                break;
            case 'email_list':
                $table_name = "bf_email_list";
                $select_str = "id, list_name as text";
                $where = "list_name";
                break;
            default:
                //redirect( Route::named('404_override'));
                break;
        }

        $this->db->select($select_str);
        $this->db->where("customer_id", $this->customer_id);
        if ($search_term != "") {
        	$this->db->like($where, $search_term);
        }
        $this->db->from($table_name);
        $udc_arr = $this->db->get();
        if ($udc_arr) {
           return $udc_arr->result();

        }
        else
            print_r($this->db->error()); die;

        //echo json_encode( $this->db->error());
        
    }

    public function udcText($table_name='', $search_term="")
    {
        $select_str = "";
         switch ($table_name) {
            case 'level':
                $table_name = "bf_udc_job_level";
                $select_str = "name as id, name as text";
                $where = "name";
                break;
            case 'group':
                $table_name = "bf_users";
                $select_str = "id, email as text";
                $where = "email";
                break;
            case 'contentdiscoverygroup':
                $table_name = "bf_users";
                $select_str = "id, email as text";
                $where = "email";
                break;    
            case 'campaign':
                $table_name = "bf_campaigns";
                $select_str = "id, campaign_name as text";
                $where = "campaign_name";
                break;
            case 'nic':
                $table_name = "bf_udc_nic_code";
                $select_str = "code as id, code as text";
                $where = "code";
                break;
            case 'sic':
                $table_name = "bf_udc_sic_code";
                $select_str = "code as id, code as text";
                $where = "code";
                break;
            case 'function':
                $table_name = "bf_udc_job_function";
                $select_str = "name as id, name as text";
                $where = "name";
                break;
            case 'industry':
                $table_name = "bf_udc_industry";
                $select_str = "name as id, name as text";
                $where = "name";
                break;
            case 'revenue':
                $table_name = "bf_udc_revenue";
                $select_str = "name as id, name as text";
                $where = "name";
                break;
            case 'country':
                $table_name = "bf_udc_country";
                $select_str = "name as id, name as text";
                $where = "name";
                break;
            case 'salutation':
                $table_name = "bf_udc_salutation";
                $select_str = "name as id, name as text";
                $where = "name";
                break;
            case 'technologies':
                $table_name = "udc_technologies";
                $select_str = "code as id, code as text";
                $where = "code";
                break;
            case 'employee':
                $table_name = "bf_udc_employee_size";
                $select_str = "name as id, name as text";
                $where = "name";
                break;
            case 'BusinessSecretName':
                $table_name = "bf_sale_secret_name";
                $select_str = "title as id, title as text";
                $where = "title";
                break;
            case 'datasource':
                $table_name = "bf_datasource";
                $select_str = "title as id, datasource as text";
                $where = "datasource";
                break;
            default:
                //redirect( Route::named('404_override'));
                break;
        }

        $this->db->select($select_str);
        $this->db->where("customer_id", $this->customer_id);
        if ($search_term != "") {
            $this->db->like($where, $search_term);
        }
        $this->db->from($table_name);
        $udc_arr = $this->db->get();
        if ($udc_arr) {
           return $udc_arr->result();

        }
        else
            print_r($this->db->error()); die;

        //echo json_encode( $this->db->error());
        
    }

    public function getID($table_name='', $search_term="")
    {
       $id = $this->udc($table_name, $search_term);
       if (sizeof($id) > 1 ) {
           return  $id[0]->id;
       }
       else
       {
          return false;
       }
    }


    public function getAgentDispositions()
    {
         $query =  $this->db->select('id,name')
                            ->from('bf_agent_disposition')
                            ->where('deleted', 0)
                            ->where('customer_id', $this->customer_id)
                            ->get();
        return $query->result();
    }


    public function udcgettable($table_name="")
    {
        $table = "";
        $title = "";
        $decription = "";
        switch ($table_name) {
            case 'level':
                $table = "udc_job_level";
                $title = "Job Level";
                $decription = "";
                break;
            case 'nic':
                $table = "udc_nic_code";
                $title = "NIC Code";
                $decription = "";
                break;
            case 'sic':
                $table = "udc_sic_code";
                $title = "SIC Code";
                $decription = "";
                break;
            case 'function':
                $table = "udc_job_function";
                $title = "Job Function";
                $decription = "";
                break;
            case 'industry':
                $table = "udc_industry";
                $title = "Industry";
                $decription = "";
                break;
            case 'revenue':
                $table = "udc_revenue";
                $title = "Revenue";
                $decription = "";
                break;
            case 'country':
                $table = "udc_country";
                $title = "Country";
                $decription = "";
                break;
            case 'salutation':
                $table = "udc_salutation";
                $title = "Salutation";
                $decription = "";
                break;
            case 'technologies':
                $table = "udc_technologies";
                $title = "Technologies";
                $decription = "";
                break;
            case 'employee':
                 $table = "udc_employee_size";
                $title = "Employee Size";
                $decription = "";
                break;
            case 'BusinessSecretName':
                 $table = "sale_secret_name";
                $title = "Business Secret Name";
                $decription = "";
                break;
            case 'datasource':
                $table = "datasource";
                $title = "Data Source";
                $decription = "";
                break;
            default:
                //redirect( Route::named('404_override'));
                break;
        }
        return array($table,$title,$decription);
    }

     public function udcColname($table_name='')
    {
         switch ($table_name) {
            case 'level':
                return "name";
            
                break;
            case 'group':
                return "email";
                break;
            case 'contentdiscoverygroup':
                return "email";
                break;    
            case 'campaign':
                return "campaign_name";
                break;
            case 'nic':
                return "code";
                break;
            case 'sic':
                return "code";
                break;
            case 'function':
                return "name";
                break;
            case 'industry':
                return "name";
                break;
            case 'revenue':
                return "name";
                break;
            case 'country':
                return "name";
                break;
            case 'salutation':
                return "name";
                break;
            case 'technologies':
                return "code";
                break;
            case 'employee':
                return "name";
            case 'BusinessSecretName':
                return "title";
            case 'datasource':
                return "datasource";
            default:
                //redirect( Route::named('404_override'));
                break;
        }
        
    }

    public function cd_common($id, $udc_type="All")
    {
        $this->load->model("Campaign_model");
        $data["campaign_id"]= $id;

        $campaign_data = $this->Campaign_model->getCampaign($id);

        if ($campaign_data != false) 
        {       
            $data['campaign_data'] = $campaign_data[0];
            //$this->load->model("Assets_model");
            $this->load->model("Udc_model");
            $data_level= $this->Campaign_model->get_campaign_udc("level", $id);

            if (empty($data_level)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_level = [$array];
                }
                else
                {
                    $data_level = $this->udc("level");
                }
            }

            $data_function= $this->Campaign_model->get_campaign_udc("function", $id);
            if (empty($data_function)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_function = [$array];
                }
                else
                {
                    $data_function = $this->udc("function");
                }
            }

            $data_industry= $this->Campaign_model->get_campaign_udc("industry", $id);
            if (empty($data_industry)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_industry = [$array];
                }
                else
                {
                    $data_industry = $this->udc("industry");
                }
            }

            $data_revenue= $this->Campaign_model->get_campaign_udc("revenue", $id);
            if (empty($data_revenue)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_revenue = [$array];
                }
                else
                {
                    $data_revenue = $this->udc("revenue");
                }
            }

            $data_employee = $this->Campaign_model->get_campaign_udc("employee", $id);
            if (empty($data_employee)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_employee = [$array];
                }
                else
                {
                    $data_employee = $this->udc("employee"); 
                }
            }

            $data_country= $this->Campaign_model->get_campaign_udc("country", $id);
            if (empty($data_country)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_country = [$array];
                }
                else
                {
                    $data_country = $this->udc("country");   
                }
            }

            $data_nic= $this->Campaign_model->get_campaign_udc("nic", $id);
            if (empty($data_nic)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_nic = [$array];
                }
                else
                {
                    $data_nic = $this->udc("nic");   
                }
            }

            $data_sic= $this->Campaign_model->get_campaign_udc("sic", $id);
            if (empty($data_sic)) {
                if ( $udc_type =="All") {
                    $array = new stdClass();$array->text ='All';$data_sic = [$array];
                }
                else
                {
                    $data_sic = $this->udc("sic");   
                }
            }

            $data["data_country"] = $data_country;
            $data["salutation"] = $this->udc("salutation");
            $data["data_level"] = $data_level;
            $data["data_function"] = $data_function;
            $data["data_industry"] = $data_industry;
            $data["data_revenue"] = $data_revenue;
            $data["data_employee"] = $data_employee;
            $data["data_sic"] = $data_sic;
            $data["data_nic"] = $data_nic;

            return $data;
        }
        else{
            return false;
        }
    }

}
