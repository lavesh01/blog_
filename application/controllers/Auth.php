<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Auth extends CI_Controller   {

	public function __construct() {
	       parent::__construct();
	       if ($this->session->userdata("isloggedin") ) {
	           // redirect(base_url(), 'auto');
	        }
	       $this->load->helper('global_helper');
	}
	

	public function logout() {
    	
    	if ($this->session->userdata("isloggedin") ) {
	        $this->load->model('Timetracker_model');
	        $this->Timetracker_model->new_task("");
	}
    	$this->session->sess_destroy();
    	redirect(base_url()."auth/index/". str_replace( "/","_", $_SERVER['HTTP_REFERER']), 'auto');
    }

	public function index($value='')
	{
		$data["redirecturl"] = $value;
		$this->load->view('login',$data);
	}

	public function login($value='')
	{
		if($this->input->is_ajax_request())
		{
			$salt = generateSalt();
			$input = $this->input->post();
			if ( isset($input["username"] ) && !empty($input["username"])) {
				$username = $input["username"];
				$password  = md5($salt.$input["password"]);
				$this->db->select('users.username, users.password_hash, roles.login_destination,users.email,users.id,users.role_id,users.designation,users.description,users.profile_url,users.customer_id,users.display_name, active, users.banned,users.json,users.theme_selected_template');
				$this->db->where('users.email',$username);
				$this->db->where('password_hash',$password);
				$data = $this->db->from("users")->join("roles","roles.role_id=users.role_id","left")
				->join('customers',"(customers.domain = '".$_SERVER['HTTP_HOST']."' or customers.internal_sub_domain = '".$_SERVER['HTTP_HOST']."') and customers.Customer_id = users.customer_id  and customers.deleted = 0")
				->get()->result();
				if (sizeof($data) > 0) {
					$data = $data[0];
					if ($data->active == "0") {
						$arr["type"] = "inactive";
					}
					elseif ($data->banned != "0") {
						$arr["type"] = "banned";
					}
					else{
						$this->session->set_userdata("isloggedin",true);
						$this->session->set_userdata("username",$data->username);
						$this->session->set_userdata("email ",$data->email );
						$this->session->set_userdata("id",$data->id);
						$this->session->set_userdata("role_id",$data->role_id);
						$this->session->set_userdata("designation",$data->designation);
						$this->session->set_userdata("description",$data->description);
						$this->session->set_userdata("profile_url",$data->profile_url);
						$this->session->set_userdata("customer_id",$data->customer_id);
						$this->session->set_userdata("display_name",$data->display_name);
						$this->session->set_userdata("theme_selected_template",$data->theme_selected_template);
						
						//$this->session->sess_expiration = '14400';
						$this->session->set_userdata("json",$data->json);
						$this->session->set_userdata("last_visited",time());
						$arr["type"] = "success";
						$inputt = $this->input->post();
						if (isset($inputt["redirecturl"]) !== false) {
							$arr["redirect_url"] =  str_replace( "_","/", $this->input->post("redirecturl")) ;
						}
						else
						{
						 $arr["redirect_url"] = site_url(). $data->login_destination;
						}
					}
				}
				else
				{
					$arr["type"] = "error";
				}
				$arr["data"] = $data;
			}
			else
			{
				$arr["type"] = "error";
			}
			$arr["csrf_value"] = $this->security->get_csrf_hash();
			echo json_encode($arr);
		}
		
	}
	
   
  public function recover()
  {
  	 $this->load->view('recover');
  }
 
  
  public function generatepassword($value='')
  {
  	$salt = generateSalt();
  	echo md5($salt.$value);
  }

  public function generatepassword1($value='')
  {
  	echo md5('prisav'.$_SERVER['HTTP_HOST']);
  }

  public function session_check()
  {
  	if ($this->session->userdata("isloggedin") ) {
       return true;
    }
    else{
    	return false;
    }
  }

  public function signup($value='')
  {
	$this->load->view('signup');
  }

  public function createnewacount()
  {
  	if($this->input->is_ajax_request())
	{
		$arr["type"] = "warning";
		$salt = generateSalt();
		$input = $this->input->post();
		if ( !isset($input["CompanyName"] ) && empty($input["CompanyName"])) {
			$arr["message"] = "Company Name Required!!"; echo json_encode($arr);die();
		}
		if ( !isset($input["BusinessEmail"] ) && empty($input["BusinessEmail"])) {
			$arr["message"] = "Business Email Required!!"; echo json_encode($arr);die();
		}
		if ( !isset($input["adminname"] ) && empty($input["adminname"])) {
			$arr["message"] = "Name Required!!"; echo json_encode($arr);die();
		}
		if ( !isset($input["password"] ) && empty($input["password"])) {
			$arr["message"] = "Password!!"; echo json_encode($arr);die();
		}
		if ($input["passwordrep"] != $input["password"]) {
			$arr["message"] = "Company Name Required!!"; echo json_encode($arr);die();
		}

		

		$CompanyName = trim($input["CompanyName"]);
		$BusinessEmail = trim($input["BusinessEmail"]);
		$adminname = trim($input["adminname"]);
		$password  = trim($input["password"]);
		$domain = substr(strrchr($BusinessEmail, "@"), 1);

		if (!filter_var($BusinessEmail, FILTER_VALIDATE_EMAIL)) {
		     $arr["message"] = "Invalid email format"; echo json_encode($arr);die();
		}

		// check company name
		$chk_cmp = $this->db->from("customers")->where("company_name",$CompanyName)->get()->num_rows();
		if ($chk_cmp > 0) {
			$arr["message"] = "Company Name Already Exists!!"; echo json_encode($arr);die();
		}

		$chk_dom = $this->db->from("customers")->where("domain",$domain)->get()->num_rows();
		if ($chk_dom > 0) {
			$arr["message"] = "Company domain Already Exists!!"; echo json_encode($arr);die();
		}

		$chk_pub_dom = $this->db->from("free_email_providers")->where("domains",$domain)->get()->num_rows();
		if ($chk_pub_dom > 0) {
			$arr["message"] = "Please use Business Email!!"; echo json_encode($arr);die();
		}

		$chk_usr = $this->db->from("users")->where("email",$BusinessEmail)->get()->num_rows();
		if ($chk_usr > 0) {
			$arr["message"] = "Email Already Exists!!"; echo json_encode($arr);die();
		}

		$this->load->library('encryption');
		$password = base64_encode( $this->encryption->encrypt($input["password"]));
		$company_data = array(
			"company_name"=>$CompanyName,
			"email"=>$BusinessEmail,
			"domain"=>$domain,
			"internal_sub_domain"=>"app",
			"encryption_key"=>$password,
			"deleted" => 1
		);

		if ($this->db->insert('customers',$company_data))
		{
			$cust_id = $this->db->insert_id() ;
			$subject = "Verify Email";
			$dataemail = array(
		        'blog_title'   => $subject,
		        'blog_heading' => "We're excited to have you get started. First, you need to confirm your account. Just press the button below.</br></br> <a href='".base_url().'auth/newaccountemailconfirm/'.$password.'/'.$cust_id."'>Confirm Account</a> </br></br>If that doesn't work, copy and paste the following link in your browser:"
		        );
			$this->load->library('parser');
			$email_message = $this->parser->parse('themes/email-templates/newaccount', $dataemail, true);

			$c_id =  $this->db->insert_id() ;
			$this->load->model("Settings_model");
      		$email_config = $this->Settings_model->keyvalue("email");
      		$this->load->library('email');
		     $this->email->initialize($email_config);
		     $this->email->set_newline("\r\n");
		     $this->email->from($email_config["smtp_user"] , $email_config["Identification"]);
		     $this->email->to($BusinessEmail);
		     $this->email->subject($subject);
		     $this->email->message($email_message);
		     if(!$this->email->send())
		     {
		        $arr["message"] = "Something went wrong. Please contact us!!!"; echo json_encode($arr);die();
		     }
		     else
		     {
		     	$arr["type"] = "info";
		     	 $arr["message"] = "Check your email and Verify. ";
		     }
		}
		
		echo json_encode($arr);die();
	}
  }

  public function newaccountemailconfirm($token="",$id="")
  {
  	$arr = [];
  	if($token==""){
  		die();
  	}
  	if($id==""){
  		die();
  	}
  	$chk = $this->db->from("customers")->where("encryption_key",$token)->where("customer_id",$id)->get();
  	if($chk->num_rows() > 0)
  	{
  		$r = $chk->result_array()[0];
  		if($r["deleted"] == 0)
  		{
  			$arr["type"]="info";
  			$arr["message"] = "Already Activated Account.";
  		}
  		else
  		{
  		
			$command =  $this->config->item('php_path') ." ". FCPATH."index.php auth setupaccount ". $r['Customer_id'] ."  > /dev/null &";

        		exec($command);
        		

        		//$this->setupaccount($id);
        		$arr["message"] = "Thanks for cofirming your email. We are in process of creating your account. Will send you credentials in next email.";
        		/*
        		$subject = "Email Verified.";
			$dataemail = array(
		        'blog_title'   => $subject,
		        'blog_heading' => "Thanks for cofirming your email. We are in process of creating your account. Will send you credentials in next email."
		        );
			$this->load->library('parser');
			$email_message = $this->parser->parse('themes/email-templates/newaccount', $dataemail, true);

			$c_id =  $this->db->insert_id() ;
			$this->load->model("Settings_model");
      		$email_config = $this->Settings_model->keyvalue("email");
      		$this->load->library('email');
		     $this->email->initialize($email_config);
		     $this->email->set_newline("\r\n");
		     $this->email->from($email_config["smtp_user"] , $email_config["Identification"]);
		     $this->email->to($r["email"]);
		     $this->email->subject($subject);
		     $this->email->message($email_message);
		     if(!$this->email->send())
		     {
		        $arr["message"] = "Something went wrong. Please contact us!!!";
		     }
		     else
		     {
		     	 $arr["message"] = "Thanks for cofirming your email. We are in process of creating your account. Will send you credentials in next email.";
		     }
		     */
  		}
  	}
  	else{
  		$arr["message"] = "Contact Support";
  	}

  	$this->load->view('emailconfirmation',$arr);
  }

  public function setupaccount($id)
  {
  	//$this->db->query('update bf_customers set setup_status = setup_status + 1, deleted = 0 where Customer_id = '. $id);
  	$chk = $this->db->from("customers")->where("customer_id",$id)->where("deleted",1)->get();
  	if($chk->num_rows() > 0)
  	{	
  		$salt = generateSalt();
  		$r = $chk->result_array()[0];
	  	$email = $r["email"];
		$username =  explode("@", $r["email"])[0];
		$this->load->library('encryption');
		$password = $this->encryption->decrypt(base64_decode($r["encryption_key"]));
		$password_hash = md5($salt.$password);

		$data["role_id"] = 2;
		$data["email"] = $email;
		$data["username"] = $username;
		$data["password_hash"] = $password_hash;
		$data["display_name"] = $username;
		$data["active"] = 1;
		$data["customer_id"] = $id;
		$data["description"] = "Admin";
		
		
		if($this->db->insert('users',$data))
		{
			$this->load->model('Users_model');
		  	$this->Users_model->new_customer_setup($id);
		  	$subject = "YOUR ACCOUNT IS NOW ACTIVE";
			$dataemail = array(
		        'blog_title'   => $subject,
		        'blog_heading' => "We're excited to have you get started. </br> 
		        				Username : " . $username . " </br> Password : " . $password
		        );
		}
		else
		{
			$subject = "Something went wrong while creating your account.";
			$dataemail = array(
		        'blog_title'   => $subject,
		        'blog_heading' => "Contact Support."
		        );
		}
	  	
		$this->load->library('parser');
		$email_message = $this->parser->parse('themes/email-templates/newaccount', $dataemail, true);
		$c_id =  $this->db->insert_id() ;
		$this->load->model("Settings_model");
		$email_config = $this->Settings_model->keyvalue("email");
		$this->load->library('email');
	     $this->email->initialize($email_config);
	     $this->email->set_newline("\r\n");
	     $this->email->from($email_config["smtp_user"] , $email_config["Identification"]);
	     $this->email->to($r["email"]);
	     $this->email->subject($subject);
	     $this->email->message($email_message);
	     if(!$this->email->send())
	     {
	        $arr["message"] = "Something went wrong. Please contact us!!!";
	     }
	}
  }
}


