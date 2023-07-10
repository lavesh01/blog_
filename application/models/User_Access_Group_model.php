<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_Access_Group_model extends CI_Model {

	public function __construct()
    {
            parent::__construct();
            // Your own constructor code
    }
	
	public function ifNameExist($name='', $module ='')
    {
        $chk = $this->db->select('1' )
                ->from('campaign_user_group')
                ->where('customer_id', $this->customer_id)
                ->where('group_name', $name)
                ->where('module', $module)
                ->count_all_results();

         if ($chk) {
         	return $chk;
         }
         else
         {
               return 0; 
    	 }
    }

    public function add($name='', $module='')
    {
    	if(!$this->ifNameExist($name, $module))
    	{
    		$data["group_name"] = $name;
    		$data["module"] = $module;
    		$data["customer_id"] = $this->customer_id;
    		$chk = $this->db->insert('campaign_user_group',$data);
    		if ($chk) {
         		return $this->db->insert_id();
	        }
	        else
	        {
	               return 0; 
	    	}
    	}
    	else
    	{
    		return 'Already exit';
    	}
    }


    public function delete($group_id='')
    {
    	$this->db->where('id', $group_id);
		$this->db->delete('campaign_user_group');
		$tables = array('campaign_user_allow_status', 'campaign_user');
		$this->db->where('group_id', $group_id);
		$this->db->delete($tables);
		return true;
    }

    public function listUserGroup($module="agent", $campaign_id='')
    {
    		return $this->db->select("a.id as Action, a.group_name, Count(c.group_id) as User_Count,b.group_id , a.id as Delete" )
                ->from('campaign_user_group a')
                ->join('campaign_user_allow_status b',"a.id = b.group_id  and b.campaign_id = ".$campaign_id,'left')
                ->join('campaign_user c','a.id = c.group_id','left')
                ->where('a.customer_id', $this->customer_id)
                ->where('a.module', $module)
                ->group_by('a.id, a.group_name, c.group_id');
    }

    public function removeGroupFromCampaign($group_id="", $campaign_id='')
    {
    		return $this->db->where('customer_id', $this->customer_id)
                ->where('campaign_id', $campaign_id)
                ->where('group_id', $group_id)
                ->delete('campaign_user_allow_status');
    }

    public function addGroupFromCampaign($group_id,$campaign_id)
    {
    	$chk = $this->db->select('1' )
                ->from('campaign_user_allow_status')
                ->where('group_id', $group_id)->where('campaign_id', $campaign_id)->count_all_results();
		if ($chk == 0) {
	        $data["customer_id"] = $this->customer_id;
	    	$data["group_id"] = $group_id;
	    	$data["campaign_id"] = $campaign_id;
	    	$chk =  $this->db->insert('campaign_user_allow_status', $data);
	    	if ($chk) {
	    		return $this->db->insert_id();
	    	}
	    	else
	    	{
	    		return false;
	    	}
        }
        else
        	return false;
    	
    }

    public function listCampaignUserOfAGroup($group_id)
    {
    	if ( $this->input->post('search[value]') !== null)
    	{
    		$this->db->like('u.username', $this->input->post('search[value]') ,'both');
    	}
		return $this->db->select('u.id as Action, u.username, c.id as cid' )
            ->from('users u')
            ->join('campaign_user c', 'u.id = c.user_id and c.group_id = ' . $this->input->post('group_id'), "left")
            ->where('u.customer_id', $this->customer_id)
            ->order_by("c.id","desc");
    }

    public function addUserFromGroup($group_id,$user_id )
    {
        $data["user_id"] = $user_id;
        $data["group_id"] = $group_id;
        $data["customer_id"] = $this->customer_id;
        $chk = $this->db->insert('campaign_user', $data);
        if ($chk) {
    		return $this->db->insert_id();
    	}
    	else
    	{
    		return false;
    	}
    }

    public function removeUserFromGroup($group_id,$user_id )
    {
        return $this->db->where('customer_id', $this->customer_id)
                ->where('user_id', $user_id)
                ->where('group_id', $group_id)
                ->delete('campaign_user');
    }


    public function myCampaign($module, $campaign_id="")
    {
        
        $this->db->select('campaigns.id as Action,
                                    a.module as group_type,
                                    a.group_name,
                                    campaigns.campaign_name as Campaign Name,
                                    campaign_grade.name as Grade,
                                    campaign_type.name as Type,
                                    campaigns.start_date as "Start date",
                                    campaigns.end_date as "End date",
                                    campaigns.total_lead as "Leads",
                                    campaigns.status as Status
                                    ') 
                                ->from('campaign_user_group a');
        
        if($module=='all')
        {
            $this->db->join('campaign_user_allow_status b',"a.id = b.group_id  and a.customer_id = ".$this->customer_id);
        }
        else
        {
            $this->db->join('campaign_user_allow_status b',"a.id = b.group_id and a.module ='".$module."' and a.customer_id = ".$this->customer_id);
        }
        $this->db->join('campaign_user c','b.group_id = c.group_id and c.user_id = '.$this->user_id);
        $this->db->join( 'campaigns', 'campaigns.id = b.campaign_id' );
        $this->db->join('campaign_grade', 'campaign_grade.id = campaigns.campaign_grade_id','left');
        $this->db->join('campaign_type', 'campaign_type.id = campaigns.campaign_type_id','left');
        if( $campaign_id != "")
        {
            $this->db->where('b.campaign_id',$campaign_id);
        }
        return $this->db->order_by('campaigns.id', 'DESC');
    }

    public function getGroupKanbanAllByUser($module="kanban")
    {
        //$input = $this->input->post();
        
        if ( $module != "") {
            $query =  $this->db->select("a.id , a.group_name" )
                ->from('campaign_user_group a')
               ->join('campaign_user c','a.id = c.group_id',"left")
                ->where('a.customer_id', $this->customer_id)
                ->where('a.module',$module)
                ->where('c.user_id', $this->user_id)
                ->where('a.deleted', 0)
                ->group_by('a.group_name')->get();
            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
            else
            {
                return 0;
            }
        }
    }

    public function checkGroupKanbanByUser($group_id)
    {
        $query =  $this->db->select('1')->from('campaign_user')
           ->where('group_id', $group_id)
            ->where('user_id', $this->user_id)->get();
        if ($query->num_rows() > 0) {
            return true;
        }
        else
        {
            return false;
        }
    }
}