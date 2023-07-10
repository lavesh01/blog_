<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company_model extends CI_Model {

    public function __construct()
    {
            parent::__construct();
            // Your own constructor code
    }

    public function search( $search_term="")
    {
        	$table_name = "bf_companies";
            $select_str = "id, name as text";
            $where = "name";
            $this->db->select($select_str);
            $this->db->like($where, $search_term);
            $this->db->from($table_name);
            $udc_arr = $this->db->get();
            if ($udc_arr) {
               return $udc_arr->result();

            }
            else
                print_r($this->db->error()); die;
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

    public function isCompanyNameExists($CompanyName) {
        $q = $this->db->select("*")
            ->from("companies")
            ->where("name",$CompanyName)
            ->where("customer_id",$this->customer_id)
            ->get();
        if ($q->num_rows() > 0 ) {
            return $q->result()[0]->id;
        }
        else {
            return 0;
        }
    }


    public function getData( $limit = 100)
    {
        $input = $this->input->post();
        if (isset($input["select_nic"]) && !empty($input["select_nic"]))
        {
            $select_nic = explode(',',ltrim($this->input->post("select_nic"),','));   
            if (sizeof($select_nic) > 0 )
            {
                $this->db->where_in('t1.job_level_id',$select_nic);   
            } 
        }
        
        if (isset($input["select_sic"]) && !empty($input["select_sic"])) 
        {
            $select_sic = explode(',',ltrim($this->input->post("select_sic"),','));
            if (sizeof($select_sic) > 0 )
            {
                $this->db->where_in('t1.job_functions_id',$select_sic);   
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
        
        return $this->db->select('t2.id,t2.name as Company,t12.name Industry,t13.name Employee , t14.name Revenue, company_technology')
                            ->from('bf_companies t2')
                            ->join('bf_domains t3','t2.id=t3.company_id','left')
                            ->join('bf_udc_industry t12','t2.Industry_Type_id=t12.id','left')
                            ->join('bf_udc_employee_size t13','t2.Employee_Size_id=t13.id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->join('company_technology', 't2.id = company_technology.company_id','left')
                            ->where('t2.customer_id', $this->customer_id)
                            //->where('t1.deleted', 0) 
                            ->limit($limit);
         
        }

    public function companyByIds($campaign_id)
    {
        return $this->db->select('t2.id, t2.name as Company,Revenue_id , sic_code_id , NIC_Code_id ,Employee_Size_id  ,Industry_Type_id ,company_src,zip,city,state, country, t2.revenue_link, company_technology,linkedin,facebook,twitter,tiktok,instagram,snapchat,t20.domain_name')
                            
                            ->from('bf_companies t2')
                            ->join('bf_company_technology t17','t17.company_id=t2.id','left')
                            ->join('bf_companies_social_links t16','t2.id=t16.company_id','left')
                            ->join('domains t20','t2.Primary_Domain=t20.company_id','left')
                            ->join('bf_udc_revenue t14','t2.Revenue_id=t14.id','left')
                            ->where("t2.customer_id",$this->customer_id)
                            ->where_in("t2.id",$campaign_id);

    }   

}