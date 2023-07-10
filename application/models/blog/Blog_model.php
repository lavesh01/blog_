<?php
class Blog_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function get_form_data(){
        $query = $this->db->get("bf_post");
        return $query->result();
    }

    public function save_form_data($data) {
        $this->db->insert('bf_post', $data);
        return $this->db->insert_id();
    }

    public function save_social_tags($data) {
        $this->db->insert('bf_social_tags', $data);
        return $this->db->insert_id();
    }

    public function delete_post($post_id) {
        $this->db->where('id', $post_id);
        $this->db->delete('bf_post');
        return $this->db->affected_rows();
    }
    
}