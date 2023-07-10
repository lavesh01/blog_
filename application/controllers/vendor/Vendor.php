<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendor extends Admin_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('vendors/Vendor_model');
        $this->templatedata["topheader"] = "vendors/topsubmenu";
        $this->load->library('form_validation');
        // Load additional models for document_types and vendor_documents as needed
    }

    // Display the add vendor form
    public function index()
    {
      $data["title"] = 'Vendor Manager';
      $data["js"] = [site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/vendors/index.js"];
      $this->load_view("vendors/vendors",$data,'operation/sidebar/sidebar');
    }

    // Process the add vendor form submission
    public function add_vendor()
    {
        // Set validation rules
        $this->form_validation->set_rules('name', 'Name', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('phone', 'Phone', 'trim|required');
        $this->form_validation->set_rules('address', 'Address', 'trim|required');
        $this->form_validation->set_rules('tax-id', 'Tax ID', 'trim|required');

        if ($this->form_validation->run() === FALSE) {
            $errors = $this->form_validation->error_array();
              $error_string = '';
              foreach ($errors as $error) {
                  $error_string .= $error . '<br>';
              }
            echo $this->ajax__response_data_preperation("Error",$error_string,"warning");return false;
        } else {
            // Validation passed, save the vendor data and redirect
            $data = array(
                'name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'phone' => $this->input->post('phone'),
                'address' => $this->input->post('address'),
                'tax_id' => $this->input->post('tax-id')
            );

            if ($id = $this->Vendor_model->insert_vendor($data))
            {
                echo $this->ajax__response_data_preperation("Added","","success");
            }
            else{
                echo $this->ajax__response_data_preperation("Retry",$this->db->error()["message"],"warning");
            }
            return false;
            
        }
    }

    public function ajax_all($value='')
    {
        $query = $this->db->select("id, status, name,email, phone")->where("customer_id",$this->customer_id)->from('vendors');
        echo $this->ajax__response_data_preperation("ssdsd","asas","success",
        $this->datatable_data($query,"" ,$value,""));
    }

    public function ajax_getdocuments($id="",$doc_category=""){
        $this->load->model('vendors/Vendor_documents_model');
        $data["docs"] =  $this->Vendor_documents_model->get_document_list("", $id);
        echo $this->ajax__response_data_preperation("ssdsd","asas","success",
        $data);

    }

    public function upload_doc($selected_vendor="")
    {
        if ($selected_vendor == "") {
            echo $this->ajax__response_data_preperation("Vendor Id Missing","","warning");
            return false;
        }
        $input = $this->input->post();
        if (!isset($input["id"]) && empty($input["id"])) {
           echo $this->ajax__response_data_preperation("Doc Id Missing","","warning");return false;

        }
        $data = $this->_do_upload('file',"VendorDoc","", "20000", "png||jpg||jpeg");
        if (isset($data)) {
            //, "dnc", $data["id"]
            $this->load->model('vendors/Vendor_documents_model');
            $dataa["vendor_id"] = $selected_vendor ;
            $dataa["document_type_id"] = $input["id"] ;
            $dataa["file_path"] = $data["url"] ;
            $dataa["created_by"] = $this->user_id ;
            $dataa["customer_id"] = $this->customer_id ;
            if( $this->Vendor_documents_model->insert_vendor($dataa))
            {
                $dataa["id"] = $this->db->insert_id();
                echo $this->ajax__response_data_preperation("Upload Done","","success",$dataa);
            }
            else{
                echo $this->ajax__response_data_preperation("Try Again","Something Went Wrong","warning",$this->db->error());
            }
        }
    }
}
