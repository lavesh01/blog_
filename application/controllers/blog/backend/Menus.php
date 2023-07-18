<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Menus extends Admin_Controller   {

public function __construct() {
       parent::__construct();
       $this->load->model('blog/Menu_model');
}
public function addMenu() {
    $menuName = $this->input->post('name');
    $data['menu'] = $this->Menu_model->addMenu($menuName);
    echo json_encode($data);
}

public function deleteMenu() {
    $menuId = $this->input->post('menuId');
    $this->Menu_model->deleteMenu($menuId);
}


public function index($table_name="")
{

    $data["title"] =  "Bug Reporting";
    $data["js"] =  [
            site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/moment/moment.min.js",
           site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/bootstrap4-editable/js/bootstrap-editable.min.js",
            site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/poshytip/jquery.poshytip.min.js",
            site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/bugs/index.js" ];

    $data["css"] = [ site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/bootstrap4-editable/css/bootstrap-editable.css",
    site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/x-editable/poshytip/tip-yellowsimple/tip-yellowsimple.css",
    ];

    $data['menus'] = $this->Menu_model->getMenus();

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