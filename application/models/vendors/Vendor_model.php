<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendor_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
       
    }

    // Get all vendors
    public function get_vendors()
    {
        $query = $this->db->where("customer_id",$this->customer_id)->get('vendors');
        return $query->result_array();
    }

    // Get a single vendor by ID
    public function get_vendor($id)
    {
        $query = $this->db->where("customer_id",$this->customer_id)->get_where('vendors', array('id' => $id));
        return $query->row();
    }

    // Insert a new vendor
    public function insert_vendor($data)
    {   
        $data["created_by"] = $this->user_id;
        $data["customer_id"] = $this->customer_id;
        return $this->db->insert('vendors', $data);
    }

    // Update an existing vendor
    public function update_vendor($id, $data)
    {
        $this->db->where('id', $id)->where("customer_id",$this->customer_id);
        return $this->db->update('vendors', $data);
    }

    // Delete a vendor
    public function delete_vendor($id)
    {
        $this->db->where('id', $id)->where("customer_id",$this->customer_id);
        return $this->db->delete('vendors');
    }
}
