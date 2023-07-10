<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ProjectModel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    // Insert a new project into the database
    public function insert($data) {
        return $this->db->insert('projects', $data);
    }

    // Update an existing project in the database
    public function update($id, $data) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        return $this->db->update('projects', $data);
    }

    // Delete a project from the database
    public function delete($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        return $this->db->delete('projects');
    }

    // Retrieve a single project by ID
    public function get_project($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('projects');
        return $query->row();
    }

    // Retrieve all projects
    public function get_projects() {
        $this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('projects');
        return $query->result_array();
    }

    public function get_projectsidname() {
        $this->db->select('id,name');
        $this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('projects');
        return $query->result_array();
    }
}
