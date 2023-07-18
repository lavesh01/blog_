<?php 
class Menu_m extends CI_Model
{	
	function __construct()
	{
		parent::__construct();
	}

	public function getCategories() {
		$this->db->select('category_name');
		$this->db->from('bf_category');
		$query = $this->db->get();
		if ($query === false) {
			// Handle query error
			$error = $this->db->error();
			log_message('error', 'Menu_m - getCategories: ' . $error['message']);
			return array(); // Return an empty array or handle the error appropriately
		}
		return $query->result();
	}

	
	public function menu_all()
	{
		$this->db->select('*, bf_menu1.m_id as menu_id, bf_menu_item.m_id as menu_item_id');
		$this->db->from('bf_menu1');
		$this->db->join('bf_menu_item', 'bf_menu1.m_id = bf_menu_item.m_id', 'left');
		$this->db->group_by('m_name');
		$this->db->order_by('menu_id');
		$query = $this->db->get();

		if ($query === false) {
			// Handle query error
			$error = $this->db->error();
			log_message('error', 'Menu_m - menu_all: ' . $error['message']);
			return array(); // Return an empty array or handle the error appropriately
		}

		return $query->result();
	}

	public function menu_select()
	{
		$this->db->select('*');
		$this->db->from('menu_item');
		$query = $this->db->get();

		if ($query === false) {
			// Handle query error
			$error = $this->db->error();
			log_message('error', 'Menu_m - menu_select: ' . $error['message']);
			return array(); // Return an empty array or handle the error appropriately
		}

		return $query->result();
	}
}

?>