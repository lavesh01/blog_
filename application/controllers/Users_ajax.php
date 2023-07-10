<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Users_ajax extends admin_Controller   {

	public function __construct() {
	       parent::__construct();
		  if (!$this->check_permission('setting','',true)) {
				echo $this->ajax__response_data_preperation("Access Required","setting","error");
				return false;
			}

			 if(!$this->input->is_ajax_request())
		   {
				 echo $this->ajax__response_data_preperation("ssdsd","asas","error");
				 die;
		   }
	}

	public function add_new_user()
	{
		
		if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			if (!isset($input["role"]) || empty($input["role"])) {
				echo $this->ajax__response_data_preperation("Role Required","Please provide input","info");
				return false;
			}
			
			if (!isset($input["email"]) || empty($input["email"])) {
				echo $this->ajax__response_data_preperation("Email Required","Please provide input","info");
				return false;
			}
			if (!isset($input["Username"]) || empty($input["Username"])) {
				echo $this->ajax__response_data_preperation("Username Required","Please provide input","info");
				return false;
			}
			if (!isset($input["password"]) || empty($input["password"])) {
				echo $this->ajax__response_data_preperation("Password Required","Please provide input","info");
				return false;
			}
			$count =  $this->db->select('1' )
                 				->from('bf_users')
                 				->where('customer_id', $this->customer_id)
                 				->where('username', $input["Username"])
                 				->count_all_results();
            if ( (int)$count > 1) {
            	echo $this->ajax__response_data_preperation("Username Preserved","Please try with other username","repeat");
				return false;
            }
            
            $countemail =  $this->db->select('1' )
                 				->from('bf_users')
                 				->where('customer_id', $this->customer_id)
                 				->where('email', $input["email"])
                 				->count_all_results();
            if ( (int)$countemail > 1) {
            	echo $this->ajax__response_data_preperation("Email Preserved","Please try with other email","email_reserve");
				return false;
            } 

			$data["password_hash"] = md5(generateSalt().$input["password"]);
			$data["email"] = $input["email"];
			$data["username"] = $input["Username"];
			$data["role_id"] = $input["role"];
			$data["customer_id"] = $this->customer_id;
			$data["active"] = 1;
			$data['created_by']=$this->user_id;
			$data["designation_id"] = $input["designation"];

			$id = $this->db->insert("bf_users",$data);
			if ($id) {

               //Email Template
			   $names=	$input["Username"];
			   $email_user=	$input["email"];
			   $passwords=	$input["password"];
               $users=$this->customer_id;
               $this->load->model('Settings_model');
               $email=$this->Settings_model->getLoginEmail($users);	
                $emails=implode(" , ",$email);

				 //Email content
               $subject = 'Added New User';
               $message = '<p><b>User Name: </b>  '.$names.' <br><b>Email ID: </b>  '.$email_user.' </p>';
               $email_config = $this->email_config();
               $dataemail = array(
		        'blog_title'   => $subject,
		        'blog_heading' => $message
		        );
               $email_message = $this->parser->parse('themes/email-templates/settings', $dataemail, true);
		       $this->send_email($email_config, $emails,$subject,$email_message);
               
               //Insert Email Notification entry for agent dispositions

		        $datanotification["subject"] = $subject;
			    $datanotification["message"]= $message;
			    $datanotification["user_id"] = $this->user_id;
                $this->load->model('Settings_model');
                $email_notification=$this->Settings_model->insertemailnotification($datanotification);
              

				$data["id"] = $this->db->insert_id() ;
				echo $this->ajax__response_data_preperation("User Added","New User Added Successfully","success",$data);
			}
			else
			{
				echo $this->ajax__response_data_preperation("Try Again!!!","Something went wrong please try again","warning");
			}
			
		}
		else
		{
			echo $this->ajax__response_data_preperation("ssdsd","asas","error");
		}
	}

	public function delete_users()
	{
		
		if($this->input->is_ajax_request())
		{
			
			$input = $this->input->post();
			$delete_id= $input["ajax_id"];
			
			    $id=  $this->db->set('deleted', 1)
				            ->set('deleted_by', $this->user_id)
                           ->where('id',$delete_id)
                           ->update('bf_users');

               //delete user extensions
              $ids=  $this->db->set('deleted', 1)
				             ->set('deleted_by', $this->user_id)
                             ->where('user_id',$delete_id)
                             ->update('bf_users_extension'); 
                      

			if ($id) {
				echo $this->ajax__response_data_preperation("User Deleted","User Deleted Successfully","success", [$delete_id]);
			}
			else
			{
				echo $this->ajax__response_data_preperation("Try Again!!!","Something went wrong please try again","warning");
			}
			
		}
		else
		{
			echo $this->ajax__response_data_preperation("ssdsd","asas","error");
		}
	}


	public function addpremission()
	{
		

		if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			
			if (isset($input["role"]) && isset($input["permission"]) && isset($input["activate"])) {
				$role_id= $input["role"];
				$permission_id= $input["permission"];
				$activate= $input["activate"];
				$count =1;
				
        if ($this->customer_id != 9999999) {
        	$this->db->select('1' )
                 				->from('role_permissions')
                 				->where('role_permissions.role_id', $this->role_id)
                 				->where('role_permissions.permission_id', $permission_id);
					$this->db->where('role_permissions.customer_id', $this->customer_id) ;
					$count =  $this->db->count_all_results();
				}
        
                if ((int)$count != 0 ) {
                	if ($activate == "0") {
                		$this->db->where('role_id',$role_id)
                				 ->where('permission_id',$permission_id);
                		if ($this->customer_id != 9999999) {
											$this->db->where('customer_id', $this->customer_id) ;
										}
										else
										{
											$this->db->where('customer_id', $input["cid"]) ;	
										}
										$this->db->delete('role_permissions');
                		echo $this->ajax__response_data_preperation("Permission Revoked!!!","Permission removed from the role","success");
                			return false;
                	}
                	else
                	{
                		if ($this->customer_id == 9999999) {
											$data["customer_id"] = $input["cid"] ;
										}
										else
										{
											$data["customer_id"] = $this->customer_id ;
										}
                		$data["permission_id"] = $permission_id ;
                		$data["role_id"] = $role_id ;
                		if ($this->db->insert('role_permissions', $data)) {
                			echo $this->ajax__response_data_preperation("Permission Added!!!","Permission granted to the role","success");
                			return false;
                		}
                		else
                		{
                			echo $this->ajax__response_data_preperation("Some went wrong!!!","Please try again.","info");
                			return false;
                		}
                	}
                }
                else{
                	echo $this->ajax__response_data_preperation("Permission Denied!!!","You do not access for this action.","warning");
                	return false;
                }
			}
			else
			{
				echo $this->ajax__response_data_preperation("Information Missing!!!","Some information are Missing, Try gain.","error");
				return false;
			}
		}
	}

//////////////////////////////////////////////////////Super User///////////////////////////////////////////////////////////////////////

	public function add_new_customer()
	{
		if (!$this->check_permission('superuser','',true)) {
				echo $this->ajax__response_data_preperation("Access Required","superuser","error");
				return false;
			}
		
		if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			$data["company_name"] = $input["first_name"];
			$data["email"] = $input["email"];
			$id = $this->db->insert("customers",$data);
			if ($id) {
				$data["id"] = $this->db->insert_id() ;
				$this->db->query("insert into bf_prospects_other_info_level (lebel, attribue_name,customer_id,created_by) select lebel, attribue_name,".$data["id"].",".$this->customer_id."   from bf_prospects_other_info_level where customer_id = 9999999 ");
				$this->db->query("insert into bf_mandate_col ( name,col_name	,status,customer_id	,key_name	,ordering	,lebel) select name,col_name	,status,".$data["id"]."	,key_name	,ordering	,lebel  from bf_mandate_col  where customer_id = 9999999 ");
			  $this->db->query("insert into bf_suppression ( customer_id, email) value (".$data["id"].", 1)  ") ;
				$this->db->query("insert into bf_udc_job_level ( name,customer_id) select name,".$data["id"]."	 from bf_udc_job_level  where customer_id = 9999999 ");
				$this->db->query("insert into bf_udc_job_function ( name,customer_id) select name,".$data["id"]."	 from bf_udc_job_function  where customer_id = 9999999 ");
				$this->db->query("insert into bf_udc_industry ( name,customer_id) select name,".$data["id"]."	 from bf_udc_industry  where customer_id = 9999999 ");
				$this->db->query("insert	into bf_udc_revenue ( name,customer_id) select name,".$data["id"]." from bf_udc_revenue  where customer_id = 9999999 ");
				$this->db->query("insert	into bf_udc_country( name,customer_id)  select name,".$data["id"]." from bf_udc_country  where customer_id = 9999999 ");
				$this->db->query("insert 	into bf_udc_salutation ( name,customer_id) select name,".$data["id"]." from bf_udc_salutation  where customer_id = 9999999 ");
				$this->db->query("insert 	into bf_udc_employee_size ( name,customer_id) select name,".$data["id"]." from bf_udc_employee_size  where customer_id = 9999999 ");
				$this->db->query("insert	into bf_udc_nic_code ( code,customer_id) select code,".$data["id"]." from bf_udc_nic_code  where customer_id = 9999999 ");
				$this->db->query("insert 	into bf_udc_sic_code ( code,customer_id)  select code,".$data["id"]." from bf_udc_sic_code  where customer_id = 9999999 ");
				$this->db->query("insert 	into bf_datasource ( datasource,customer_id)  select datasource,".$data["id"]." from bf_datasource  where customer_id = 9999999 ");
				$this->db->query("insert 	into bf_user_designation_points ( designation,points,customer_id) values ('Agent',100,".$data["id"]."),('Team Lead',100,".$data["id"]."),('Manager',100,".$data["id"]."),('Director',100,".$data["id"]."),('Management',100,".$data["id"].") ,('Sales Executive',100,".$data["id"].")  ");
				$this->db->query("insert 	into bf_agent_disposition ( name,customer_id) values ('Verified',".$data["id"].") ");
				$this->db->query("insert 	into bf_agent_sub_disposition ( name,customer_id,agent_disposition_id)  select 'Verified',".$data["id"].", id from bf_agent_disposition  where customer_id = ".$data["id"]." and name ='Verified' ");
				$this->db->query("insert 	into bf_quality_disposition ( name,customer_id) values ('Verified',".$data["id"].") ");
				$this->db->query("insert 	into bf_quality_sub_disposition ( name,customer_id,quality_disposition_id)  select 'Verified',".$data["id"].", id from bf_quality_disposition  where customer_id = ".$data["id"]." and name ='Verified' ");
				$this->db->query("insert 	into bf_campaign_grade ( name,customer_id,grade,qualityGrade,cdqaGrade) values ('Demo Campaign Grade',".$data["id"].",100,100,100) ");
				$this->db->query("insert 	into bf_campaign_type ( name,customer_id) values ('BANT',".$data["id"]."),('HQL',".$data["id"]."),('Normal',".$data["id"]."),('SQL',".$data["id"]."),('Content Syndication',".$data["id"]."),('Email',".$data["id"].") ");
				$this->db->query("insert 	into bf_kanbanboards_category ( name,customer_id) values ('CRMDevelopment',".$data["id"].") ");
				$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_issue','issue', id ,".$data["id"]." from bf_kanbanboards_category  where customer_id = ".$data["id"]." and name ='CRMDevelopment' ");
				$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_inpipeline','inpipeline', id ,".$data["id"]." from bf_kanbanboards_category  where customer_id = ".$data["id"]." and name ='CRMDevelopment' ");
				$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_wip','wip', id ,".$data["id"]." from bf_kanbanboards_category  where customer_id = ".$data["id"]." and name ='CRMDevelopment' ");
				$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_uat','uat', id ,".$data["id"]." from bf_kanbanboards_category  where customer_id = ".$data["id"]." and name ='CRMDevelopment' ");
				$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_done','_done', id ,".$data["id"]." from bf_kanbanboards_category  where customer_id = ".$data["id"]." and name ='CRMDevelopment' ");

				$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('CRMDevelopment',".$data["id"].",'kanban') ");
				$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$data["id"]."  ,".$data["id"]." from bf_campaign_user_group  where customer_id = ".$data["id"]." and group_name ='CRMDevelopment' and module='kanban' ");

				$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('Agent Team 1',".$data["id"].",'agent') ");
				$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$data["id"]."  ,".$data["id"]." from bf_campaign_user_group  where customer_id = ".$data["id"]." and group_name ='Agent Team 1' and module='agent' ");

				$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('quality Team 1',".$data["id"].",'quality') ");
				$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$data["id"]."  ,".$data["id"]." from bf_campaign_user_group  where customer_id = ".$data["id"]." and group_name ='quality Team 1' and module='quality' ");

				$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('cdqa Team 1',".$data["id"].",'cdqa') ");
				$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$data["id"]."  ,".$data["id"]." from bf_campaign_user_group  where customer_id = ".$data["id"]." and group_name ='cdqa Team 1' and module='cdqa' ");

				echo $this->ajax__response_data_preperation("Company Added","New Company Profile Added Successfully","success",$data);
			}
			else
			{
				echo $this->ajax__response_data_preperation("Try Again!!!","Something went wrong please try again","warning");
			}
		}
		else
		{
			echo $this->ajax__response_data_preperation("ssdsd","asas","error");
		}
	}

public function add_new_admin()
	{
		if (!$this->check_permission('superuser','',true)) {
				echo $this->ajax__response_data_preperation("Access Required","superuser","error");
				return false;
			}
		if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			$data["display_name"] = $input["display_name"];
			$data["email"] = $input["email"];
			$data["Username"] = $input["Username"];

			$is_email_exists = $this->db->select("1")->from("users")->where("email",$data["email"] )->count_all_results();
			if ($is_email_exists != 0) {
				echo $this->ajax__response_data_preperation("User Exits","Email id already exits","error",$data);
				return ;
			}

			if (!isset($input["customer"])) {
				echo $this->ajax__response_data_preperation("Select Company","Select Company Name","error",$data);
				return ;
			}
			else
			{
				$is_customer_id_exists = $this->db->select("1")->from("customers")->where("customer_id",$input["customer"] )->count_all_results();
				if ($is_customer_id_exists == 0) {
					echo $this->ajax__response_data_preperation("Not Found","Company Not Found","error",$data);
					return;
				}
				
			}


			if (isset($input["activate"]) ) {
				$data["active"]=1;
			}
			else
			{
				$data["active"]=0;
			}
			$data["force_password_reset"] = 1;
			$data["customer_id"] = $input["customer"];
			$data["password_hash"] = md5(generateSalt().$input["password_hash"]);
			$data["role_id"]="2";
			$id = $this->db->insert("users",$data);
			if ($id) {
				$data["id"] = $this->db->insert_id() ;
				echo $this->ajax__response_data_preperation("User Added","New User Added Successfully","success",$data);
			}
			else
			{
				echo $this->ajax__response_data_preperation("Try Again!!!","Something went wrong please try again","warning");
			}
			
		}
		else
		{
			echo $this->ajax__response_data_preperation("ssdsd","asas","error");
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




 


public function users($value='data')
{

		
		$table_name = 'bf_users';
		
		if ($this->customer_id != 9999999) {
         	
				$this->db->where('bf_users.customer_id', $this->customer_id) ;
		}
		
		$query =  $this->db->select('bf_users.id  as Actions,
		                             bf_users.email as Email ID,
									 bf_users.username as Username,
									 bf_roles.role_name,
      								 bf_users.banned as Banned,
									 bf_users.active as Active,
									 bf_users.deleted as Deleted')
							->from('bf_users')
							->join('bf_roles','bf_users.role_id = bf_roles.role_id','left')
							->where_not_in('bf_users.role_id', [1,2])
							//->where('bf_users.customer_id', $this->customer_id)
							 ->where('bf_users.deleted', 0) 
							->order_by('bf_users.id','DESC');
		

		echo $this->ajax__response_data_preperation("ssdsd","asas","success",$this->datatable_data($query,"" ,$value,'bf_users.id  ,
		                             bf_users.email ,
									 bf_users.username'));

}	

public function updateUserDetails()
{
	if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			
			

			if (!isset($input["email_u"]) || empty($input["email_u"])) {
				echo $this->ajax__response_data_preperation("Email Required","Please provide input","info");
				return false;
			}

			if (!isset($input["Username_u"]) || empty($input["Username_u"])) {
				echo $this->ajax__response_data_preperation("Username Required","Please provide input","info");
				return false;
			}

			if (!isset($input["password_u"]) || empty($input["password_u"])) {
				echo $this->ajax__response_data_preperation("Password Required","Please provide input","info");
				return false;
			}
			
            $active_yes=$input["active_r"];
            $banned=$input["banned_r"];
			

			$user_id= $input["user_id"];
			$role_id= $input["role_u"];
			$email= $input["email_u"];
			$username= $input["Username_u"];
			$password_hash=$input["password_u"];
			$data["designation_id"] = $input["designation"];
			
			$modified_on=date('Y-m-d H:i:s');

           $new_password = md5(generateSalt().$input["password_u"]);
			
            
			    $qs=  $this->db->set('role_id', $role_id)
						   ->set('email', $email)
						   ->set('username', $username)
						   ->set('password_hash',$new_password)
						   ->set('modified_on',$modified_on)
						   ->set('modified_by',$this->user_id)
						    ->set('active',$active_yes)
						     ->set('banned',$banned)
						   ->set('reset_by',$this->user_id)
                           ->where('email',$email)
                           ->where('customer_id',$this->customer_id)
                           ->update('bf_users');
              
        if($active_yes=="1")
          {

               $active_msg="profle activated.";
          }
         if($active_yes=="0")
          {
                $active_msg="profle Deactivated.";
          }	
         if($banned=="1")
          {
                $banned_msg="Profile Banned"; 

          }
          if($banned=="0")
          {
              $banned_msg="Profile Banned"; 

          }
           

			if ($qs) {
    

            //Email Template
			   $names=	$input["Username_u"];
			   $email_user=	$input["email_u"];
			   $passwords=	$input["password_u"];
			   $active_status=$active_msg;
			   $banned_status=$banned_msg;
               $users=$this->customer_id;
               $this->load->model('Settings_model');
               $email=$this->Settings_model->getLoginEmail($users);	
                $emails=implode(" , ",$email);

				 //Email content
               $subject = 'Update User Details And Profile Acivation Status';
               $message = '<p><b>User Name: </b>  '.$names.' <br><b>Email ID: </b>  '.$email_user.' <br><b>Active Status: </b>  '.$active_status.' <br><b>Banned Status: </b>  '.$banned_status.' <br></p>';
               $email_config = $this->email_config();
               $dataemail = array(
		        'blog_title'   => $subject,
		        'blog_heading' => $message
		        );
               $email_message = $this->parser->parse('themes/email-templates/settings', $dataemail, true);
		       $this->send_email($email_config, $emails,$subject,$email_message);
               
               //Insert Email Notification entry for agent dispositions

		        $datanotification["subject"] = $subject;
			    $datanotification["message"]= $message;
			    $datanotification["user_id"] = $this->user_id;
                $this->load->model('Settings_model');
                $email_notification=$this->Settings_model->insertemailnotification($datanotification);

				echo $this->ajax__response_data_preperation("User Updated","Details Updated Successfully","success", $this->db->error());
			}
			else
			{
				echo $this->ajax__response_data_preperation("Try Again!!!","Something went wrong please try again","warning");
			}
			
		}
		else
		{
			echo $this->ajax__response_data_preperation("ssdsd","asas","error");
		}
}


public function add_user_extension()
{  

   if($this->input->is_ajax_request())
		{
			$input = $this->input->post();

			if (!isset($input["name"]) || empty($input["name"])) {
				echo $this->ajax__response_data_preperation("Name Required","Please provide input","info");
				return false;
			}

			if (isset($input["provider"]) && !empty($input["provider"])  && $input["provider"] != 1) {
				if (!isset($input["ip_address"]) || empty($input["ip_address"])) {
					echo $this->ajax__response_data_preperation("IP Address Required","Please provide input","info");
					return false;
				}
				
				if (!isset($input["port"]) || empty($input["port"])) {
					echo $this->ajax__response_data_preperation("Web Socket Port Required","Please provide input","info");
					return false;
				}
				if (!isset($input["path"]) || empty($input["path"])) {
					echo $this->ajax__response_data_preperation("Web Socket Path Required","Please provide input","info");
					return false;
				}
				if (!isset($input["extension"]) || empty($input["extension"])) {
					echo $this->ajax__response_data_preperation("Extension Required","Please provide input","info");
					return false;
				}
	      
				if (!isset($input["password"]) || empty($input["password"])) {
					echo $this->ajax__response_data_preperation("Password Required","Please provide input","info");
					return false;
				}
			}
      
      date_default_timezone_set('Asia/Kolkata');
			
            
      $data["user_id"]=$input["extension_id"];
			$data["name"] =$input["name"];
			$data["password"]=$input["password"];
			$data["ip_address"] = $input["ip_address"];
			$data["extension"] = $input["extension"];
			$data["port"] = $input["port"];
			$data["path"] = $input["path"];
			$data["created_by"]=$this->user_id;
			$data["customer_id"]=$this->customer_id;
			$data["provider"] = $input["provider"];
			$id = $this->db->insert("bf_users_extension",$data);
			if ($id) {
				$data["id"] = $this->db->insert_id() ;	
				echo $this->ajax__response_data_preperation("User Extension Added","New User Extension Details Added Successfully","success",$data);
			}
			else
			{
				echo $this->ajax__response_data_preperation("Try Again!!!","Something went wrong please try again","warning");
			}
		}
		else
		{
			echo $this->ajax__response_data_preperation("ssdsd","asas","error");
		}


}


public function fetch_userExtensionData()
{
	    $this->load->model('Settings_model'); 
	    $extension_id = $this->input->post('extension_id');
        $data = $this->Settings_model->getUserExtensionDetails($extension_id);
        $arr = array('success' => false, 'data' => '');
        if($data){
        $arr = array('success' => true, 'data' => $data);
        }
        echo json_encode($arr);
}

public function fetch_usersData()
{
	 $this->load->model('Settings_model'); 
	    $disposition_id = $this->input->post('disposition_id');
        $data = $this->Settings_model->getUsersDetails($disposition_id);
        $arr = array('success' => false, 'data' => '');
        if($data){
        $arr = array('success' => true, 'data' => $data);
        }
        echo json_encode($arr);
}


public function user_extensions($value="")
{
    $table_name = 'bf_users_extension';
    $user_id = $this->input->post('user_id');
    if ($user_id != "") {
    	$this->db->where('user_id', $user_id);
    }
	
		if ($user_id != "") {
    	$this->db->where('user_id', $user_id);
    }
		$query =  $this->db->select('bf_users_extension.id  as Actions,
		                             bf_users.username as User Name,
		                             bf_sip_provider.name as Provider,
									 bf_users_extension.name as Name,
      								 bf_users_extension.extension as Extension,
									 bf_users_extension.ip_address as IP Address,
									 bf_users_extension.port as Port,
									 bf_users_extension.path as Path')
							->from('bf_users_extension')
							->join('bf_users', 'bf_users.id= bf_users_extension.user_id','left')
							->join('bf_sip_provider', 'bf_sip_provider.id= bf_users_extension.provider','left')
							->where('bf_users_extension.customer_id', $this->customer_id)
							 ->where('bf_users_extension.deleted', 0) 
							->order_by('bf_users_extension.id','DESC');
		
		//$query =  $this->db->from('users_extension');
		echo $this->ajax__response_data_preperation("ssdsd","asas","success",$this->datatable_data($query,"" ,$value,'bf_users_extension.id ,
		                             bf_users.username ,
		                             bf_sip_provider.name ,
									 bf_users_extension.name ,
      								 bf_users_extension.extension ,
									 bf_users_extension.ip_address ,
									 bf_users_extension.port,
									 bf_users_extension.path'));
}


public function delete_user_extensions()
{
	 $input = $this->input->post();
			$delete_id= $input["ajax_id"];
			
			    $id=  $this->db->set('deleted', 1)
				            ->set('deleted_by', $this->user_id)
                           ->where('id',$delete_id)
                           ->update('bf_users_extension');

			if ($id) {
				echo $this->ajax__response_data_preperation("Extension Deleted","User Extension Deleted Successfully","success", [$delete_id]);
			}
			else
			{
				echo $this->ajax__response_data_preperation("Try Again!!!","Something went wrong please try again","warning");
			}
			
		}
		
	public function ajax_rolelist($value="")
	{
		  if ($this->customer_id != 9999999) {
				$this->db->where('customer_id', $this->customer_id) ;
			}
			
			$this->db->select('role_id,role_name, description ,login_destination ');
							
			if ($this->customer_id != 9999999) {
				$this->db->where('customer_id', $this->customer_id) ;
			}
			
			$query =  $this->db->from('roles');

			echo $this->ajax__response_data_preperation("","asas","success",$this->datatable_data($query,"" ,$value,"role_name"));
	}

	public function ajax_add_role()
	{
		$input = $this->input->post();
		if (isset($input["role_name"]) && isset($input["Description"])) {
			$data["role_name"] =$input["role_name"] ;
			$data["description"] =$input["Description"] ;
			$data["login_destination"] =$input["redirecturl"] ;
			
			if($input["action"] == "edit"){
				$data["modified_by"] = $this->user_id ;
				//$data["modified_on"] =date('Y-m-d H:i:s') ;
			   $this->db->where("role_id",$input["role_id"]);
			   $this->db->where("customer_id",$this->customer_id );
         $id = $this->db->update("roles",$data);
			}
			else{
				$data["customer_id"] =$this->customer_id ;
			  $data["created_by"] =$this->user_id ;
				$id = $this->db->insert("roles",$data);	
			}
			
			if ($id) {
				echo $this->ajax__response_data_preperation("Successfull","Role Added/Updated Successfully","success", [$id]);
			}else
			{
				echo $this->ajax__response_data_preperation("Not Added/Updated","Plase try again","warning", [$id]);
			}
		}
		else
		{
			echo $this->ajax__response_data_preperation("Input Required","Plase provide Role Name & Description","warning", [$id]);
		}
	}

	public function ajax_getrole($id="")
	{
		  if ($id == "") {
		  	return 0;
		  }
		  if ($this->customer_id != 9999999) {
				$this->db->where('customer_id', $this->customer_id) ;
			}
			$this->db->select('role_id,role_name, description ,login_destination ');
			$this->db->where('role_id', $id) ;
			$query = $this->db->from('roles')->get()->row_array();	
			if (sizeof($query)>0) {
				 echo $this->ajax__response_data_preperation("Input Required","Plase provide Role Name & Description","success", $query);
				 die;
			}
			else
			{
				return 0;
			}
	}

		public function ajax_deleterole($id="")
	{
		  if ($id == "") {
		  	echo $this->ajax__response_data_preperation("Input Required","Plase provide Role Name & Description","success", $query);
				 die;
		  }
		  if ($this->customer_id != 9999999) {
				$this->db->where('customer_id', $this->customer_id) ;
			}
			$this->db->where('role_id', $id) ;
			$query = $this->db->delete('roles');	
			if ($query) {
				 if ($this->customer_id != 9999999) {
						$this->db->where('customer_id', $this->customer_id) ;
					}
					$this->db->where('role_id', $id) ;
					$query = $this->db->delete('role_permissions');	
				 echo $this->ajax__response_data_preperation("Deleted","","success");
				 die;
			}
			else
			{
				echo $this->ajax__response_data_preperation("Something went wrong","","danger", $this->db->error());
				 die;
			}
	}


}