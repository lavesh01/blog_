<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Datasource_model extends CI_Model {

    public function __construct()
    {
              parent::__construct();
              // Your own constructor code
    }

    public function getall() {
        $q = $this->db->select("*")
            ->from("datasource")->where('customer_id',$this->customer_id)->get()
            ;
        if ($q->num_rows() > 0 ) {
            return $q->result_array();
        }
        else {
            return 0;
        }
    }
}
