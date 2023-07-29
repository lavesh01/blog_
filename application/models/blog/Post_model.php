<?php
class Post_model extends CI_Model {
    

    public function __construct() {
        parent::__construct();
       
    }

    public function save_post($data) {
        $data['customer_id']  = $this->customer_id;
        $data['created_by']  = $this->user_id;
        // $this->db->insert('post', $data);
        unset($data['ci_csrf_token']);

        if ($this->db->insert('post', $data)) {
            $post_id = $this->db->insert_id();
            return $post_id;
        } else {
            return "error"; //$this->db->error();
        }

    }
    
    public function save_form_data($data) {
        $data['customer_id']  = $this->customer_id;
        $data['created_by']  = $this->user_id;
        $this->db->insert('post', $data);
        return $this->db->insert_id();
    }

    public function get_categories(){
        $query = $this->db->get('category');
        return $query->result();
    }
    
    public function get_status(){
        $query = $this->db->get('status');
        if($query){
            return $query->result();
        }else{
            return false;
        }
    }

    public function save_category($data) {
        $this->db->insert('category', $data);
        $category_id = $this->db->insert_id();
        
        // Retrieve the inserted category row from the database
        $this->db->where('id', $category_id);
        $query = $this->db->get('category');
        $category_row = $query->row();
        
        return $category_row;
    }

    public function get_subcategories() {
        $query = $this->db->get('sub_category');
        return $query->result();
    }
    
    public function save_subcategory($data) {
        $this->db->insert('sub_category', $data);
        $subcategory_id = $this->db->insert_id();
    
        // Retrieve the inserted subcategory row from the database
        $this->db->where('id', $subcategory_id);
        $query = $this->db->get('sub_category');
        $subcategory_row = $query->row();
    
        return $subcategory_row;
    }
    
    

    public function delete_post($post_id) {
        $this->db->where('id', $post_id);
        // $this->db->delete('post');
        $this->db->update('post', array('isdelete' => 1));

        $num_affected_rows = $this->db->affected_rows();

        if ($num_affected_rows > 0) {
            return 'success';
        } else {
            return 'error';
        }

    }
    

    private function updaterecord($column, $value, $id)
    {
       if( $id == "")
       {
        $arr_data = array($name => $value,
            $column=> $value,
            "customer_id" => $this->customer_id, 
            "created_by" => $this->user_id
        );
        $chk = $this->db->insert($table,$arr_data);
       }
       
       $this->db->from("posts");
       $q = $this->db->where('id',$id);
       if ($q->get()->num_rows() > 0) {
           $this->db->set($name, $value);
           $this->db->set("modified_by", $this->user_id);
           $this->db->where($pk_name,$pk);
           $chk = $this->db->update($table);
       }
       else
       {
        
       }
       
    }
}