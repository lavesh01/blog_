<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendor_documents_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
       
    }

    // Get all vendor_documents
    public function get_document_list( $doc_category="",$document_type_id="",$id="")
    {
        $aa = "";
        if ($id != "") {
            $aa = "and vendor_documents.vendor_id = " . $id;
        } 
        $query = $this->db->select("document_types.id ,vendor_documents.id as vid,vendor_documents.file_path, document_types.name, document_types.description,vendor_documents.status")
                ->where("document_types.customer_id",$this->customer_id)
                ->from('document_types')
                ->join("vendor_documents","document_types.id = vendor_documents.document_type_id  ". $aa,"left");
        if ($document_type_id != "") {
            $query->where("vendor_documents.document_type_id",$document_type_id);
        }
        if ($doc_category != "") {
            $query->where("document_types.doc_category",$doc_category) ;
        }
              
        return $query->get()->result_array();
    }

    // Get all vendor_documents
    public function get_vendors()
    {
        $query = $this->db->where("customer_id",$this->customer_id)->get('vendor_documents');
        return $query->result();
    }

    // Get a single vendor by ID
    public function get_vendor($id)
    {
        $query = $this->db->where("customer_id",$this->customer_id)->get_where('vendor_documents', array('id' => $id));
        return $query->row();
    }

    // Insert a new vendor
    public function insert_vendor($data)
    {
        return $this->db->insert('vendor_documents', $data);
    }

    // Update an existing vendor
    public function update_vendor($id, $data)
    {
        $this->db->where('id', $id)->where("customer_id",$this->customer_id);
        return $this->db->update('vendor_documents', $data);
    }

    // Delete a vendor
    public function delete_vendor($id)
    {
        $this->db->where('id', $id)->where("customer_id",$this->customer_id);
        return $this->db->delete('vendor_documents');
    }
}
