<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Todo_model extends CI_Model {

	public function get_todos() {
		$q = $this->db->order_by('id','DESC')->get_where('todos',array('status'=>0,'user_id'=>$this->user_id)) ;
		              
		return $q->result();
	}
	public function insert($data) {
		$data["user_id"] = $this->user_id;
		$this->db->insert('todos',$data);
		return $this->db->insert_id();
	}
	public function update($data,$id) {
		$this->db->where('user_id',$this->user_id);
		$this->db->where('id',$id);
		$this->db->update('todos',$data);
	}
	public function find_todo($id) {
		$q = $this->db->get_where('todos',array('id'=>$id));
		return $q->row(0);
	}

}