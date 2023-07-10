<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class TagModel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    // Insert a new tag into the database
    public function insert($data) {
        return $this->db->insert('tags', $data);
    }

    // Update an existing tag in the database
    public function update($id, $data) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        return $this->db->update('tags', $data);
    }

    // Delete a tag from the database
    public function delete($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        return $this->db->delete('tags');
    }

    // Retrieve a single tag by ID
    public function get_tag($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('tags');
        return $query->row();
    }

    // Retrieve all tags
    public function get_tags() {
        $this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('tags');
        return $query->result();
    }
}
