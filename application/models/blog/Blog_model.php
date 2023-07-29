<?php
class Blog_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function getBlogPost($postId) {
        $this->db->where('id', $postId);
        $query = $this->db->get('bf_post');
    
        if ($query->num_rows() > 0) {
            return $query->row(); 
        } else {
            return false; 
        }
    }

    public function ajax_getBlogPosts() {
        $this->db->where('isdelete', 0);
        $this->db->select('bf_post.id, bf_post.post_title, bf_category.category_name, bf_status.status_type, bf_post.created_on');
        $this->db->from('bf_post');
        $this->db->join('bf_category', 'bf_post.category = bf_category.id', 'left');
        return $this->db->join('bf_status', 'bf_post.status = bf_status.id', 'left');
    }
    
    public function getBlogPosts() {
        $this->db->select('bf_post.*, bf_category.category_name, bf_sub_category.subcategory_name, bf_status.status_type');
        $this->db->from('bf_post');
        $this->db->join('bf_category', 'bf_post.category = bf_category.id', 'left');
        $this->db->join('bf_sub_category', 'bf_post.sub_category = bf_sub_category.id', 'left');
        $this->db->join('bf_status', 'bf_post.status = bf_status.id', 'left');
        $query = $this->db->get();
    
        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return array();
        }
    }
    
    public function updateBlogPost($postId, $updatedData) {
        $this->db->where('id', $postId);
        $this->db->update('bf_post', $updatedData);
        
        if( $this->db->affected_rows() > 0) {
            $menu_id = $this->db->insert_id();
            return $menu_id;
        }else{
            return "error";
        }
    }
    
    public function get_form_data(){
        $query = $this->db->get("bf_post");
        return $query->result();
    }

    public function get_categories(){
        $query = $this->db->get('bf_category');
        return $query->result();
    }

    public function delete_post($post_id) {
        $this->db->where('id', $post_id);
        $this->db->delete('bf_post');
        return $this->db->affected_rows();
    }
    
}