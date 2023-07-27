<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Menus extends Admin_Controller   {

public function __construct() {
       parent::__construct();
       $this->load->model('blog/Menu_model');
}

public function save_branch()
{
    $data = $this->input->post();

    $input_data = $this->input->input_stream();
    if (
        !isset($input_data['parent_id']) ||
        !isset($input_data['level']) ||
        !isset($input_data['title']) || empty($input_data['title']) 
    ) {
        echo $this->ajax__response_data_preperation('Error', 'Missing data in the request', 'error');
        die();
    }

    $result = $this->Menu_model->save_branch($data);

    if ($result == "error") {
        echo $this->ajax__response_data_preperation('Error', 'Failed to save branch data', 'error', $result );
    } else {
        $input_data['menu_id'] = $result; 
        echo $this->ajax__response_data_preperation('Saved', 'Branch data saved successfully', 'success', $input_data);

    }
    
}

public function remove_branch()
{
    $id = $this->input->post('id');
    $result = $this->Menu_model->remove_branch($id);

    if ($result == "success") {
        echo $this->ajax__response_data_preperation('Deleted', 'Branch data saved successfully', 'success');

    } else {
        echo $this->ajax__response_data_preperation('Error', 'Failed to save branch data', 'error');
    }
}

public function update_branch()
{
    $input_data = $this->input->input_stream();
    if (
        !isset($input_data['id']) ||
        !isset($input_data['parent_id']) ||
        !isset($input_data['level']) ||
        !isset($input_data['title']) || empty($input_data['title']) ||
        !isset($input_data['type']) || 
        !isset($input_data['selected_type']) || empty($input_data['selected_type'])
    ) {
        echo $this->ajax__response_data_preperation('Error', 'Missing data in the request', 'error');
        return;
    }
   
    $update_result = $this->Menu_model->update_branch($input_data);
   
    if ($update_result) {
        echo $this->ajax__response_data_preperation('Updated', 'Branch data updated successfully', 'success');
    } else {
        echo $this->ajax__response_data_preperation('Error', 'Failed to update branch data', 'error');
    }
}

public function update_branch_onSort()
{
    $input_data = $this->input->input_stream();
    if (
        !isset($input_data['id']) ||
        !isset($input_data['parent_id']) ||
        !isset($input_data['level']) ||
        !isset($input_data['order']) 
    ) {
        echo $this->ajax__response_data_preperation('Error', 'Missing data in the request', 'error');
        return;
    }
   
    $update_result = $this->Menu_model->update_branch($input_data);
    
    if ($update_result) {
        echo $this->ajax__response_data_preperation('Updated', 'Branch data updated successfully', 'success');
    } else {
        echo $this->ajax__response_data_preperation('Error', 'Failed to update branch data', 'error');
    }
}

public function get_menu_items() {
    $id = $this->input->post('id');

    if (!$id) {
        echo $this->ajax__response_data_preparation('Error', 'Missing ID in the request', 'error');
        return;
    }

    $menu = $this->Menu_model->get_menu_by_id($id);
    
    if ($menu) {
        echo json_encode($menu);
        // $input_data['menu_id'] = $menu;
        // echo $this->ajax__response_data_preparation('Menu Details', 'Menu data retrieved successfully', 'success', $menu);
    }else{
        echo $this->ajax__response_data_preparation('Error', 'Menu not found', 'error');
    } 
}

public function index($table_name="")
{

    $data["title"] =  "Menus";
    $data["js"] =  [
            "https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js",
            site_url()."resources/themes/".$this->theme_selected_template."/assets/sortable-list-tree/js/treeSortable.js",
            site_url()."resources/themes/".$this->theme_selected_template."/assets/sortable-list-tree/js/script.js"];

    $data["css"] = [ 
        "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css",
        site_url()."resources/themes/".$this->theme_selected_template."/assets/sortable-list-tree/css/treeSortable.css",
    ];

    $data['menuItems'] = $this->Menu_model->getMenuItems();

    $this->load_view("blog/menuspage", $data, 'operation/sidebar/sidebar');
      
}


public function addBugs($table_name="")
{
 
   $input = $this->input->post();
   if(isset($input["title"]) && isset($input["description"]) && !empty($input["title"]) && !empty($input["description"]) )
   {
        
      $data =  array('title' =>$input["title"], 'url' =>$input["url"],'Summary'=>$input["description"], "customer_id" => $this->customer_id,"created_by" => $this->user_id);
      $this->db->insert('bugs',$data);
      echo $this->ajax__response_data_preperation("Successfully Added","","success");
      $email_config = $this->email_config();
      $subject = "Bug Added - ". $input["title"];
       $dataemail = array(
        'blog_title'   =>$subject ,
        'blog_heading' => $input["description"]
        );
       $email_message = $this->parser->parse('themes/email-templates/settings', $dataemail, true);
       $this->send_email($email_config, $this->config->item('support_email'),$subject,$email_message);
   }
   else
   {
        echo $this->ajax__response_data_preperation("Not Added","Parameter are Missing","error");
   }
}

    public function ajax_getall($value='')
    {
       
        $this->db->select('bugs.id as # , title,summary, users.username as created_by,bugs.created_on, bugs.status, bugs.eta')->from('bugs');
        $query = $this->db->join('users', 'bugs.created_by = users.id');
        echo $this->ajax__response_data_preperation("","asas","success",$this->datatable_data($query,"" ,$value,"title"));
        die;

    }

}