<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Auth_ajax extends admin_Controller   {

	public function __construct() {
	       parent::__construct();
	}

	
	public function updateUserDetails()
	{
		 if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			$file = $this->input->post("file");
	       
			if (isset( $_FILES["file"] ) && !empty( $_FILES["file"]["name"] )) {
	    		//echo $this->ajax__response_data_preperation("Upload Profile","Image not uploaded","success");
	    		$data = $this->_do_upload('file',"Profile", $this->user_id, $max_size='50000',$allowed_types='png|jpg|jpeg|gif');
	            $profile_url=$data["url"];
	            $this->db->set('profile_url',$profile_url);
    	    }

			$user_id= $this->user_id;
			$display_name= $input["display_name"];
			$language=$input["language"];
			$description=$input["description"];
			date_default_timezone_set('Asia/Kolkata');
			$modified_on=date('Y-m-d H:i:s');
			$qs= $this->db->set('display_name',$display_name)
						   ->set('language',$language)
						   ->set('description',$description)
						   ->set('modified_on',$modified_on)
						   ->set('modified_by',$this->user_id)
						   ->set('reset_by',$this->user_id)
                           ->where('id',$user_id)
                           ->update('bf_users');
			if ($qs) {

              $this->load->model('Settings_model');
               $users=$this->session->userdata('id');
               $emails=$this->Settings_model->getLoginParticularEmail($users);	 
              //Email content
               $subject = 'Your Profile Updated';
               $message = '<p><b>Display Name: </b> '.$display_name.' <br><b>Language: </b> '.$language.'  <br><b>Description: </b> '.$description.' <br></p>';
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
				echo $this->ajax__response_data_preperation("Profile Updated","Details Updated Successfully.Logout and login again.","success", [$user_id]);
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

public function updateUserDetailsUser()
{
	 if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			$file = $this->input->post("file");
	       $display_name = $this->input->post("display_name");

		   if (!isset($display_name ) || empty($display_name)) {

				echo $this->ajax__response_data_preperation("Display Name Required","Please provide input","success");
				return false;
			}
			if (!isset( $_FILES["file"] ) || empty( $_FILES["file"]["name"] )) {
    		echo $this->ajax__response_data_preperation("Upload Profile","Image not uploaded","success");
    		return false;
    	   }
	
	
			$user_id= $this->user_id;
			$description=$input["description"];
			date_default_timezone_set('Asia/Kolkata');
			$modified_on=date('Y-m-d H:i:s');
			
			 $data = $this->_do_upload('file',"Profile", $user_id, $max_size='50000',$allowed_types='png|jpg|jpeg|gif');

            $profile_url=$data["url"];

		$qs=  $this->db ->set('display_name',$display_name)
						   ->set('description',$description)
						   ->set('modified_on',$modified_on)
						   ->set('profile_url',$profile_url)
						   ->set('modified_by',$this->user_id)
						   ->set('reset_by',$this->user_id)
                           ->where('id',$user_id)
                           ->update('bf_users');
              
           

			if ($qs) {
				echo $this->ajax__response_data_preperation("Profile Updated","Details Updated Successfully. Logout and login again.","success", [$user_id]);
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

public function changeUserPassword()
{
	 if($this->input->is_ajax_request())
		{
			$input = $this->input->post();
			
			if (!isset($input["new_password"]) || empty($input["new_password"])) {
				echo $this->ajax__response_data_preperation("Password Required","Please provide input","success");
				return false;
			}

			if (!isset($input["confirm_password"]) || empty($input["confirm_password"])) {
				echo $this->ajax__response_data_preperation("Confirm Password Required","Please provide input","success");
				return false;
			}

		    $pwd=$input["new_password"];
		    $name=$this->session->username;
		    $email=$this->session->email;
			
			$user_id= $this->user_id;
			date_default_timezone_set('Asia/Kolkata');
			$modified_on=date('Y-m-d H:i:s');
            $password_hash=md5(generateSalt().$input["new_password"]);
 		   
			$qs=  $this->db->set('password_hash', $password_hash)
						   ->set('modified_on',$modified_on)
						   ->set('reset_by',$this->user_id)
                           ->where('id',$user_id)
                           ->update('bf_users');
              
           $message="Your Account Password Changed Successfully.";

			if ($qs) {
              $this->load->model('Settings_model');
               $users=$this->session->userdata('id');
               $emails=$this->Settings_model->getLoginParticularEmail($users);	 
               $pwd=$input["new_password"];
              //Email content
               $subject = 'Changed Account Password';
               $message = '<p><b>New Account Password: </b> '.$pwd.'</p>';
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
			 	


				echo $this->ajax__response_data_preperation("Password Updated Successfully","Details Updated Successfully. Logout and login again.","success", [$user_id]);
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

public function checkEmail()
{
	    $email=$this->input->post('email');
        $count =  $this->db->select('1' )
                 				->from('bf_users')
                 				->where('email', $email)
                 				->count_all_results();
            if ( (int)$count >= 1) {
            //Update Password
             $nos=rand(1000,9999);
             $pwd=md5(generateSalt().$nos);
             $update_data["password_hash"] = $pwd;
             $update_data["modified_on"] = date("Y-m-d H:i:s");
             $update_data["modified_by"] = $this->user_id;

            $this->db->where("email", $email);
            $chk = $this->db->update("bf_users",$update_data);
     
               $subject = 'Recover Account Password';
               $message = '<p>New Password '.$nos.' <br> You can use this password to login your account</p>';
               $email_config = $this->email_config();
               $dataemail = array(
		        'blog_title'   => $subject,
		        'blog_heading' => $message
		        );
               $email_message = $this->parser->parse('themes/email-templates/settings', $dataemail, true);
		       $this->send_email($email_config, $email,$subject,$email_message);
 
        
                echo "1";
                return;
            }
            else
            {
                echo "2";
                return;
            }
}

}