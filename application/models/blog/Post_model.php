<?php
class Post_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function save_form_data($data) {
        $this->db->insert('bf_post', $data);
        return $this->db->insert_id();
    }

    public function get_categories(){
        $query = $this->db->get('bf_category');
        return $query->result();
    }

    public function save_category($data) {
        $this->db->insert('bf_category', $data);
        $category_id = $this->db->insert_id();
        
        // Retrieve the inserted category row from the database
        $this->db->where('id', $category_id);
        $query = $this->db->get('bf_category');
        $category_row = $query->row();
        
        return $category_row;
    }

    public function get_subcategories() {
        $query = $this->db->get('bf_sub_category');
        return $query->result();
    }
    
    public function save_subcategory($data) {
        $this->db->insert('bf_sub_category', $data);
        $subcategory_id = $this->db->insert_id();
    
        // Retrieve the inserted subcategory row from the database
        $this->db->where('id', $subcategory_id);
        $query = $this->db->get('bf_sub_category');
        $subcategory_row = $query->row();
    
        return $subcategory_row;
    }
    
    

    public function delete_post($post_id) {
        $this->db->where('id', $post_id);
        $this->db->delete('bf_post');
        return $this->db->affected_rows();
    }
    
}