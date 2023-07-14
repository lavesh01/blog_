<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Test extends CI_Controller   {

    public function __construct() {
        parent::__construct();
    }

    public function index(){
        $this->load->model('blog/Blog_model');
        $data['form_data'] = $this->Blog_model->getBlogPosts();

        $this->load->view('frontend/blogfrontend', $data);
    }


}