<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CategoryModel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    // Insert a new category into the database
    public function insert($data) {
        return $this->db->insert('categories', $data);
    }

    // Update an existing category in the database
    public function update($id, $data) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        return $this->db->update('categories', $data);
    }

    // Delete a category from the database
    public function delete($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        return $this->db->delete('categories');
    }

    // Retrieve a single category by ID
    public function get_category($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('categories');
        return $query->row();
    }

    // Retrieve all categories
    public function get_categories() {
        $this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('categories');
        return $query->result();
    }

    public function get_categorysidname() {
        $this->db->select('id,name');
        $this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('categories');
        return $query->result_array();
    }


}
