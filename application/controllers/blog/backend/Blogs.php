<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Blogs extends Admin_Controller   {

public function __construct() {
       parent::__construct();
       $this->load->model('blog/Blog_model');
}

public function index($table_name="")
{
    $data["title"] =  "All Blogs";
    $data["js"] =  [                
        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/blog/allblog.js",
    ];

    $data['form_data'] = $this->Blog_model->getBlogPosts();

    $this->load_view("blog/allblogspage", $data, 'operation/sidebar/sidebar');
}

public function ajax_getBlogPosts($value="")  {
    $query= $this->Blog_model->ajax_getBlogPosts();
	echo $this->ajax__response_data_preperation("ssdsd","asas","success",$this->datatable_data($query,"" ,$value,"bf_post.post_title"));
}

public function deletepost() {
    $post_id = $this->input->post('id');

    $this->load->model('blog/Post_model');
    $result = $this->Post_model->delete_post($post_id);

    if ($result == "success") {
        echo $this->ajax__response_data_preperation('Deleted', 'Post data deleted successfully', 'success');

    } else {
        echo $this->ajax__response_data_preperation('Error', 'Failed to delete branch data', 'error');
    }
}

}