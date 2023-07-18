<?php
class Menu_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
    public function getMenus() {
        $this->db->select('*');
        $this->db->from('bf_menu1');
        $query = $this->db->get();
        return $query->result();
    }

    public function deleteMenu($menuId) {
        $this->db->where('m_id', $menuId);
        $this->db->delete('bf_menu1');
    }
    
    
    public function addMenu($menuName) {
        $data = array(
            'm_name' => $menuName
        );
        $this->db->insert('bf_menu1', $data);
        
        $this->db->where('m_id', $this->db->insert_id());
        $query = $this->db->get('bf_menu1');
        return $query->row();
    }
  
}