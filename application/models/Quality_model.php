<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Quality_model extends CI_Model {

      
      public function getGroups($group_id)
      {
           $this->db->from('bf_quality_group');
           $this->db->where('id',$group_id);
           $query = $this->db->get();
           return $query->row();

      }

      public function getGroupData($id)
      {
             $this->db->select('bf_quality_group.id , bf_quality_group.group_name',FALSE); 
        $this->db->from("bf_quality_group");
        $this->db->where('bf_quality_group.customer_id', $this->customer_id);
        $this->db->where('bf_quality_group.id', $id);
        $group_data =$this->db->get();   
        if ($group_data->num_rows() > 0) 
        {
            return $group_data->result_array();
        }
        else
        {
            return false;
        }
      }

    public function getContentDiscoveryGroups($group_id)
    {
        $this->db->from('bf_contentdiscovery_group');
           $this->db->where('id',$group_id);
           $query = $this->db->get();
           return $query->row();
    }

}