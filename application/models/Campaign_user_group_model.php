<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Campaign_user_group_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        // Your own constructor code
    }

    public function getGroup($value='')
    {
    	$this->db->select("a.id As Actions,  a.group_name As Group Name,  COUNT(b.user_id) AS User_Count");
        $this->db->from('campaign_user_group a');
        $this->db->join('campaign_user b', 'ON a.id = b.group_id', 'left');
    	$this->db->where("a.customer_id", $this->customer_id); 
    	$this->db->where("a.deleted", "0");
        return $this->db->group_by(array("a.group_name", "a.id"));  
    
    }


    public function getGroupAccess($value='')
    {
        $this->db->select("d.allowed_status As Actions,a.group_name,a.id, COUNT(b.user_id) AS User_Count");
        $this->db->from('campaign_user_group a');
        $this->db->join('bf_campaign_user_allow_status d', 'ON a.id = d.group_id', 'left');
        $this->db->join('campaign_user b', 'ON a.id = b.group_id', 'left');
        $this->db->where("a.customer_id", $this->customer_id); 
        $this->db->where("a.deleted", "0");
        return $this->db->group_by(array("a.group_name", "a.id")); 
    }

    public function getGroupCount($value='')
    {
    	$this->db->select('1');
    	$this->db->from('campaign_user_group');
    	$this->db->where("deleted", "0");
    	return $this->db->where("customer_id", $this->customer_id)->count_all_results();;
    	// $this->db->get()->result();
    }


    public function getGroupUsersCountAccess($value='')
    {
        $this->db->select('1');
        $this->db->from('campaign_user_group');
        $this->db->where("deleted", "0");
        return $this->db->where("customer_id", $this->customer_id)->count_all_results();;
    }

    public function getGroupUsers($group_id='')
    {
    	$this->db->select('users.username,users.email');
    	$this->db->from('campaign_user');
    	$this->db->join('users', 'campaign_user.user_id = users.id');
    	$this->db->where("users.deleted", "0");
    	return $this->db->where("users.customer_id", $this->customer_id);
    	//return $this->db->get()->result();
    }

    public function getGroupUsersCount($group_id='')
    {
    	$this->db->select('1');
    	$this->db->from('campaign_user');
    	$this->db->join('users', 'campaign_user.user_id = users.id');
    	$this->db->where("users.deleted", "0");
    	return $this->db->where("users.customer_id", $this->customer_id)->count_all_results();;
    	//return $this->db->get()->result();
    }

    public function getCampaignGroup($campaign_id='')
    {
    	$this->db->select('campaign_user_access.id, campaign_user_group.group_name');
    	$this->db->from('campaign_user_access');
    	$this->db->join('campaign_user_group', 'campaign_user_group.id = users.id');
    	$this->db->where("campaign_user_access.deleted", "0");
    	$this->db->where("campaign_user_access.campaign_id", $campaign_id);
    	return $this->db->where("campaign_user_access.customer_id", $this->customer_id);
    	//return $this->db->get()->result();
    }

    public function getCampaignGroupCount($campaign_id='')
    {
    	$this->db->select('1');
    	$this->db->from('campaign_user_access');
    	$this->db->join('campaign_user_group', 'campaign_user_group.id = users.id');
    	$this->db->where("campaign_user_access.deleted", "0");
    	$this->db->where("campaign_user_access.campaign_id", $campaign_id);
    	return $this->db->where("campaign_user_access.customer_id", $this->customer_id)->count_all_results();;
    	//return $this->db->get()->result();
    }

    public function addgrouptocampaign($value='')
    {
    	$input = $this->input->post();
    	if (isset($input["campaign_id"]) && !empty($input["campaign_id"]) && isset($input["activate"])  && isset($input["group_id"]) && !empty($input["group_id"])) {
    		if ($input["activate"] == "1") {
    			$insert_data["group_id"] = $input["group_id"];
    			$insert_data["campaign_id"] = $input["campaign_id"];
                $insert_data["customer_id"] = $this->customer_id;
    			$chk =  $this->db->insert("campaign_user_group_access", $insert_data);
    			if ($chk) {

            //add Access alowed status to particular group ID
                $insert_data_user["group_id"] = $input["group_id"];
                $insert_data_user["campaign_id"] = $input["campaign_id"];
                $insert_data_user["customer_id"] = $this->customer_id;
                $insert_data_user["allowed_status"]=1;
            $qs=  $this->db->insert("bf_campaign_user_allow_status", $insert_data_user);

    				return 1;
    			}
    			else
    			{
    				return $this->db->error() ;
    			}
    		}
    		else if ($input["activate"] == "0") {
    			$this->db->where("group_id",$input["group_id"]);
                $this->db->where("customer_id",$this->customer_id);
    			$this->db->where("campaign_id",$input["campaign_id"]);
    			$chk =  $this->db->delete("campaign_user_group_access");
    			if ($chk) {
    				return 0;
    			}
    			else
    			{
    				return $this->db->error() ;
    			}
    		}
    	}
    	else
    	{
    		return 0;
    	}
    }

    public function add_user_to_group_access($value='')
    {
        $input = $this->input->post();
        if (isset($input["user_id"]) && !empty($input["user_id"]) && isset($input["activate"])  && isset($input["group_id"]) && !empty($input["group_id"])) {
            if ($input["activate"] == "1") {
                $insert_data["group_id"] = $input["group_id"];
                $insert_data["user_id"] = $input["user_id"];
                $insert_data["customer_id"] = $this->customer_id;
                $insert_data["created_by"] = $this->user_id;
                $chk =  $this->db->insert("bf_campaign_user", $insert_data);
                if ($chk) {
                    return 1;
                }
                else
                {
                    return $this->db->error() ;
                }
            }
            else if ($input["activate"] == "0") {
                $this->db->where("group_id",$input["group_id"]);
                $this->db->where("user_id",$input["user_id"]);
                $this->db->where("customer_id",$this->customer_id);
                $chk =  $this->db->delete("bf_campaign_user");
                if ($chk) {
                    return 0;
                }
                else
                {
                    return $this->db->error() ;
                }
            }
        }
        else
        {
            return 0;
        }
    }

    public function getAllCustomerUserCount($value='')
    {
        return $this->db->select('1' )
                ->from('users')
                ->where('customer_id', $this->customer_id)
                ->where('deleted', "0")
                ->where('Banned', "0")
                ->where('Active', "1")
                ->count_all_results();;
                
    }

    public function getAllCustomerUser()
    {
       
        return "select users.id, GROUP_CONCAT(user_group.id  SEPARATOR ',') as Action , users.email, users.username, GROUP_CONCAT(user_group.group_name  SEPARATOR ',') as Groups
                from bf_users users 
                left join bf_campaign_user campaign_user on users.id = campaign_user.user_id
                left join bf_campaign_user_group user_group on user_group.id = campaign_user.group_id
                where  users.customer_id = ". $this->customer_id ." and users.deleted = 0 and users.Banned = 0 and users.Active = 1
                group by users.id, users.email, users.username ";
    }
}