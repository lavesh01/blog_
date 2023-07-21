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

    if (!isset($data['id']) || !isset($data['parent_id']) || !isset($data['level']) || !isset($data['title'])) {
        echo $this->ajax__response_data_preperation('Error', 'Missing data in the request', 'error');
        return;
    }

    if (empty($data['type']) || empty($data['selected_type']) || empty($data['slug'])) {
        echo $this->ajax__response_data_preparation('Error', 'Missing data for additional fields', 'error');
        return;
    }

    $result = $this->Menu_model->save_branch($data);
    
    if ($result === 'success') {
        echo $this->ajax__response_data_preperation('Saved Branch', 'Branch data saved successfully', 'success');
    } else {
        echo $this->ajax__response_data_preperation('Error', 'Failed to save branch data', 'error');
    }
    
}

public function remove_branch()
{
    $id = $this->input->post('id');
    $this->Menu_model->remove_branch($id);
}

public function update_branch()
{
    $input_data = $this->input->input_stream(); 
    $this->Menu_model->update_branch($input_data);
    
    echo $this->ajax__response_data_preperation('Updated Branch','Branch data updated successfully','success') ;
}

public function get_menu_items() {
    $id = $this->input->post('id');

    if (!$id) {
        echo $this->ajax__response_data_preparation('Error', 'Missing ID in the request', 'error');
        return;
    }

    $menu = $this->Menu_model->get_menu_by_id($id);

    if (!$menu) {
        echo $this->ajax__response_data_preparation('Error', 'Menu not found', 'error');
        return;
    }

    // echo $this->ajax__response_data_preparation('Menu Details', 'Menu data retrieved successfully', 'success', $menu);
    echo json_encode($menu);
}

public function index($table_name="")
{

    $data["title"] =  "Bug Reporting";
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

    // public function addMenu() {
//     $menuName = $this->input->post('name');
//     $menuUrl = $this->input->post('menu_url');
//     $menuType = $this->input->post('menu_type');
//     $data['menu'] = $this->Menu_model->addMenu($menuName, $menuUrl,$menuType);
//     echo json_encode($data);
// }

// public function deleteMenu() {
//     $menuId = $this->input->post('menuId');
//     $this->Menu_model->deleteMenu($menuId);
// }

// public function addMenuItem()
// {
//     $menuId = $this->input->post('menu_id');
//     $menuItemName = $this->input->post('menu_item_name');

//     if (!empty($menuId) && !empty($menuItemName)) {
//         $this->Menu_model->addMenuItem($menuId, $menuItemName);
//         $menuItemData = $this->Menu_model->getMenuItemById($menuId);
//         echo json_encode($menuItemData);
//     } else {
//         echo json_encode(['error' => 'Menu ID and Menu Item Name are required.']);
//     }
// }

// public function getSubMenus($menuId) {
//     $subMenus = $this->Menus_model->getMenuItemById($menuId);

//     if ($subMenus) {
//         echo json_encode($subMenus);
//     } else {
//         echo json_encode(array());
//     }
// }

}