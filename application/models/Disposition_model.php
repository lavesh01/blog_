<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Disposition_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }
  
    public function getDispositions($disposition_id)
    {
        
        $this->db->where('id', $disposition_id);
         $query = $this->db->get('bf_agent_disposition');
      foreach($query->result() as $row)
      {
          $output = $row->name;
      }
        return $output;
      
    }

    public function getQualityDispositions($disposition_id)
    {
        $this->db->where('id', $disposition_id);
         $query = $this->db->get('bf_quality_disposition');
     foreach($query->result() as $row)
      {
          $output = $row->name;
      }
        return $output;
    }
   

   public function getSubDispositions($sub_disposition_id)
   {
       $this->db->where('id', $sub_disposition_id);
         $query = $this->db->get('bf_agent_sub_disposition');
      foreach($query->result() as $row)
      {
          $output = $row->name;
      }
        return $output;
   }


   public function getQualitySubDispositions($sub_disposition_id)
   {
        $this->db->where('id', $sub_disposition_id);
         $query = $this->db->get('bf_quality_sub_disposition');
      foreach($query->result() as $row)
      {
          $output = $row->name;
      }
        return $output;
   }

 

}