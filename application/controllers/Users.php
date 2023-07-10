<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Users extends Admin_Controller   {

	public function __construct() {
	       parent::__construct();
	       $this->mybreadcrumb->add('Settings', site_url().'settings/index' );
	       $this->mybreadcrumb->add('User List', base_url().'Users/index');
      	 $this->mybreadcrumb->add('Roles', base_url().'Users/roles');
      	 $this->templatedata["topheader"] = "settings/topsubmenu";
      	 $this->templatedata["leftsubmenu"] = "settings/leftsubmenu";
	}

   public function index()
   {

      if (!$this->check_permission('setting','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","setting","error");
			return false;
		}  

	    $data["js"] =  [
		                  site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/users/userssetting.js",
						  site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/users/users.view.js"
					   ];
        
        $query =  $this->db->select('role_id,role_name')
							->from('bf_roles')
							->where_not_in('role_id', [1,2])
							->where('customer_id', $this->customer_id)
							->get();
        $roles  = $query->result();
        $this->load->model('SipProvider_model');
        $data["SipProvider"] = $this->SipProvider_model->get_all_functional();
        $data["roles"] =$roles;
       $data["designation"] = $this->db->select('id,designation,points')
							->from('user_designation_points')
							->where('customer_id', $this->customer_id)
							->get()->result();
	    $data["title"] = 'Users List';
	    $data["decription"] = '';
	    $data['datatable_html'] = "";
	    $this->load_view("users/list", $data,'users/sidebar/sidebar');
   }

	
	

	public function roles($value='')
	{
		if (!$this->check_permission('setting','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","setting","error");
			return false;
		}
		
	    $data["js"] = [ site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/users/roles.js"];
	    $data["title"] = 'Roles';
	    $data["decription"] = 'decription';
	    //$data['datatable_html'] = $datatable_html;
	    $this->load_view("users/roles", $data,'users/sidebar/sidebar');
	}

	public function permission($role_id='',$customersid="")
	{
		if (!$this->check_permission('setting','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","setting","error");
			return false;
		}
		  
		$this->db->select('permissions.Permission_id,permissions.Name, permissions.Description' )
                 ->from('permissions');
                 
               
      if ($this->customer_id != 9999999) {
      	$this->db->join('role_permissions',' permissions.permission_id =role_permissions.permission_id ','left');
      	$this->db->where('role_permissions.role_id', $this->role_id);
			$this->db->where('role_permissions.customer_id', $this->customer_id) ;
		}
		
     $query =  $this->db->get();

      $data_arr  = $query->result();
		$datatable	= array();
		
		foreach ($data_arr as $key => $value) {
			$role_exists = "checked";
			$this->db->select('1' )
                 				->from('role_permissions')
                 				->where('role_permissions.permission_id', $value->Permission_id);
         $this->db->where('role_permissions.role_id', $role_id);
         if ($this->customer_id != 9999999) {
         	
				$this->db->where('role_permissions.customer_id', $this->customer_id) ;
			}
			else
			{
				$this->db->where('role_permissions.customer_id', $customersid) ;
			}
         $count =  $this->db->count_all_results();
            if ((int)$count == 0) {
            	$role_exists = "";
            }
			$datatable[] = [$value->Permission_id,$value->Name,$value->Description,$role_exists,$role_id ];
	    }
		 if ($this->customer_id == 9999999) {
		 	$customers =  $this->db->select('Customer_id as id, CONCAT(company_name , email) as value ')
							->from('customers')
							->get()->result_array();
			$data["customers"] = $customers;
			}
	    $data["js"] = [ site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/users/permission.js"];
	    $data["title"] = 'Permission';
	    $data["decription"] = 'decription';
	    $data['datatable'] = $datatable;
	    $data['customerid'] = $customersid;
	    $this->load_view("users/permission", $data,'users/sidebar/sidebar');
	}
	

 public function edit($id)
 {
 	if (!$this->check_permission('setting','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","setting","error");
			return false;
		}
        $data["user_id"]= $id;

        $data["js"] =  [
		                  site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/users/userssetting.js",
						  site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/users/users.view.js"
					   ];

                  $this->db->select('bf_users.role_id,
		                             bf_users.email,
									 bf_users.username,
      								 bf_users.password_hash,
									 bf_roles.role_name')
							->from('bf_users')
							->join('bf_roles',' bf_roles.role_id =bf_users.role_id ','left')
		                     ->where('bf_users.id', $id);
		$users_data =$this->db->get()->result_array(); 
		
		if (sizeof($users_data) > 0) 
		{
			
			
	      $data['users_data'] =$users_data[0];
          $this->load_view("users/edit_users", $data,'operation/sidebar/sidebar');

        }
 }



 public function extensions()
 {
 	 if (!$this->check_permission('setting','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","setting","error");
			return false;
		}
	    $data["js"] =  [
						  site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/users/users.extensions.js"
					   ];

	    $data["title"] = 'Users Extension List';
	    $data["decription"] = '';
	    $data['datatable_html'] = "";
	    $this->load_view("users/extensions", $data,'users/sidebar/sidebar');
 }
/*
public function extensionList()
{
	if (!$this->check_permission('setting','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","setting","error");
			return false;
		}
	 $data["title"] = 'Users Extensions ';
	 $data["decription"] = '';

      $query =  $this->db->select('name,extension')
							->from('bf_users_extension')
							->where('deleted', 0)
							->where('customer_id', $this->customer_id)
							->get();
        $extensions  = $query->result();
        $data["extensions"] =$extensions;

	 $this->load_view("users/extension_list", $data,'users/sidebar/sidebar');
}
*/
  public function noaccess()
  {
  	 $this->load_view('themes/default/permission_denied',$data,$sidebar);
  }
}