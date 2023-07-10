<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Settings_model extends CI_Model {

	public function keyvalue($modeule,$new="") {
		$arr_email = [];
		 $this->db->select("name, value")
			->from("settings")
			->where("module",$modeule)
			
			->where("deleted","0")
			->order_by("id", 'DESC');
      if($new==""){
        $this->db->where("customer_id","9999999");
      }
      else{
        $this->db->where("customer_id",$this->customer_id);
      }

			$q = $this->db->get();
		if ($q ) {
			foreach ($q->result() as $key => $value) {
				$arr_email[$value->name] = $value->value;
			}
			return $arr_email;
		}
		else
		{
			return $this->db->error();
		}
	}


 public function getGrades($grade_id)
 {
  
        $this->db->from('bf_campaign_grade');
        $this->db->where('id',$grade_id);
        $query = $this->db->get();
  
        return $query->row();

 }

 public function getTypes($type_id)
 {
 	 $this->db->where('id', $type_id);
         $query = $this->db->get('bf_campaign_type');
      foreach($query->result() as $row)
      {
          $output = $row->name;
      }
        return $output;
 }

public function getUserExtensionDetails($extension_id)
{
	   $this->db->from('bf_users_extension');
        $this->db->where('user_id',$extension_id);
        $query = $this->db->get();
  
        return $query->row();
} 

public function getUsersDetails($disposition_id)
{
   $this->db->from('bf_users');
        $this->db->where('id',$disposition_id);
        $query = $this->db->get();
  
        return $query->row();
} 

public function getCountry($country_id)
{
     $this->db->where('id', $country_id);
         $query = $this->db->get('bf_country');
      foreach($query->result() as $row)
      {
          $output = $row->country_name;
      }
        return $output;

}

public function getStateDetails($state_id)
{
      $this->db->where('id', $state_id);
         $query = $this->db->get('bf_state');
      foreach($query->result() as $row)
      {
          $output = $row->state_name;
      }
        return $output;
}

public function getLoginEmail($users)
{
    $this->db->where('customer_id', $users);
         $query = $this->db->get('bf_users');
      foreach($query->result() as $row)
      {
          $output[] = $row->email;
      }
        return $output;
}


public function insertemailnotification($array)
{
    return $this->db->insert("bf_notification",$array);
    

}

 public function getLoginParticularEmail($users)
 {
    $this->db->where('id', $users);
         $query = $this->db->get('bf_users');
      foreach($query->result() as $row)
      {
          $output = $row->email;
      }
        return $output;
 }

 public function getReasons($type_id)
 {
   $this->db->where('id', $type_id);
         $query = $this->db->get('bf_campaign_reasons');
      foreach($query->result() as $row)
      {
          $output = $row->reason;
      }
        return $output;
 }


public function getModulesData($module_id)
{
   $this->db->from('bf_settings');
        $this->db->where('id',$module_id);
        $query = $this->db->get();
  
        return $query->row();
}


public function getGlobalSettingData()
{
   $this->db->from('bf_settings');
        $this->db->where('customer_id',$this->customer_id)->where('deleted',0);
        $query = $this->db->get();
        return $query->result_array();
}


public function getUserDesignation($designation_id)
{
  $this->db->from('bf_user_designation_points');
        $this->db->where('id',$designation_id);
        $query = $this->db->get();
  
        return $query->row();
}


public function getGroups($group_id)
{

   $this->db->from('bf_campaign_user_group');
        $this->db->where('id',$group_id);
        $query = $this->db->get();
  
        return $query->row();

}

public function getUsersCount()
{
   $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_users');
  return $query->num_rows();
}

public function getExtensionsCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_users_extension');
  return $query->num_rows();
}

public function getAgentDispositionsCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_agent_disposition');
  return $query->num_rows();
}

public function getQualityDispositionsCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_quality_disposition');
  return $query->num_rows();
}

public function getLocationCountryCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_country');
  return $query->num_rows();

}
public function getLocationStateCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_state');
  return $query->num_rows();

}

public function getGradeCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_campaign_grade');
  return $query->num_rows();
}

public function getTypeCount()
{
   $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_campaign_type');
  return $query->num_rows();

}

public function getCampaignGroups()
{
$query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_campaign_user_group');
  return $query->num_rows();
}

public function getUserDesignationCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_user_designation_points');
  return $query->num_rows();
}
public function getUserSettingsCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_user_designation_points');
  return $query->num_rows();
}
public function getRejectionReasonsCount()
{
  $query = $this->db->where('deleted', 0)->where('customer_id', $this->customer_id)->get('bf_campaign_reasons');
  return $query->num_rows();
}
}