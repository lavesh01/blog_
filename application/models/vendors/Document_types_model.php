<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Document_types_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
       
    }

    // Get all document_types
    public function get_vendors()
    {
        $query = $this->db->where("customer_id",$this->customer_id)->get('document_types');
        return $query->result();
    }

    // Get a single vendor by ID
    public function get_vendor($id)
    {
        $query = $this->db->where("customer_id",$this->customer_id)->get_where('document_types', array('id' => $id));
        return $query->row();
    }

    // Insert a new vendor
    public function insert_vendor($data)
    {
        return $this->db->insert('document_types', $data);
    }

    // Update an existing vendor
    public function update_vendor($id, $data)
    {
        $this->db->where('id', $id)->where("customer_id",$this->customer_id);
        return $this->db->update('document_types', $data);
    }

    // Delete a vendor
    public function delete_vendor($id)
    {
        $this->db->where('id', $id)->where("customer_id",$this->customer_id);
        return $this->db->delete('document_types');
    }
}
