<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kanbanboards_model extends CI_Model {

	public function getallCategory() {
		$q = $this->db->select("id,name")
			->from("kanbanboards_category")
			//->where("customer_id",$this->customer_id)
			->order_by("name", 'asc')
			->get();	
		if ($q->num_rows() > 0 ) {
			return $q->result_array();
		}
		else {
			return 0;
		}
	}


}