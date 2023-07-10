<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CDR_model extends CI_Model {

    public function __construct()
    {
              parent::__construct();
              // Your own constructor code
    }

    public function q_getCRD() {
        $q = $this->db->select("*")
            ->from("crd_moitele")
            ;
        if ($q->num_rows() > 0 ) {
            return $q->result()[0]->id;
        }
        else {
            return 0;
        }
    }
}
