<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notification_model extends CI_Model {

	public function get_notification($limit = 10) {
		$q = $this->db->select("subject, message, created_date")->order_by("alter_date","desc")->order_by("id","desc")->limit($limit)->get_where('notification',array('user_id'=>$this->user_id));
		return $q->result();
	}
	public function insert($data) {
		$data["user_id"] = $this->user_id;
		$this->db->insert('notification',$data);
		return $this->db->insert_id();
	}
	public function find_notification($id) {
		$q = $this->db->get_where('notification',array('id'=>$id));
		return $q->row(0);
	}
}