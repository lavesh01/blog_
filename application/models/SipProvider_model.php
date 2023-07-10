<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SipProvider_model extends CI_Model {

	public function get_all_functional() {
		return $this->db->select('id,name')->from('sip_provider')->get()->result() ;
		return $q->result();
	}

}