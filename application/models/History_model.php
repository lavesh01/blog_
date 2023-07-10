<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class History_model extends CI_Model {

    public function __construct()
    {
            parent::__construct();
            // Your own constructor code
    }

    public function prospects_history($table_name , $id)
    {
         $query =  $this->db->select('table_update_logs.*, users.display_name, users.profile_url')
                            ->from('table_update_logs ')
                            ->join('users', 'table_update_logs.created_by = users.id')
                            ->where_in('table_name', $table_name)
                            ->where('customer_id', $this->customer_id)
                            ->where('pk', $id)
                            ->order_by("created_on","desc")
                            ->get();
        return $query->result_array();
    }

}