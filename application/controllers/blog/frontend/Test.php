<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Test extends CI_Controller   {

    public function __construct() {
        parent::__construct();
        $this->load->model('blog/frontend/Menu_m');
    }

    public function index(){
        $this->load->model('blog/Blog_model');
        $data['form_data'] = $this->Blog_model->getBlogPosts();
        
        $data['dropdown'] = $this->Menu_m->menu_all();
		$data['select'] = $this->Menu_m->menu_select();
        $data['categories'] = $this->Menu_m->getCategories();

		$this->load->view('frontend/partials/menus', $data);
        $this->load->view('frontend/partials/header');
        $this->load->view('frontend/blogfrontend', $data);
        $this->load->view('frontend/partials/footer');
    }

    public function about(){
        $data['dropdown'] = $this->Menu_m->menu_all();
		$data['select'] = $this->Menu_m->menu_select();
        $data['categories'] = $this->Menu_m->getCategories();

        $this->load->view('frontend/partials/menus', $data);
        $this->load->view('frontend/partials/header');
        $this->load->view('frontend/about');
        $this->load->view('frontend/partials/footer');
    }

    public function home(){
        $data['dropdown'] = $this->Menu_m->menu_all();
		$data['select'] = $this->Menu_m->menu_select();
        $data['categories'] = $this->Menu_m->getCategories();

        $this->load->view('frontend/partials/menus', $data);
        $this->load->view('frontend/partials/header');
        $this->load->view('frontend/home');
        $this->load->view('frontend/partials/footer');
    }

    public function menus(){
        $data['dropdown'] = $this->Menu_m->menu_all();
		$data['select'] = $this->Menu_m->menu_select();
        $data['categories'] = $this->Menu_m->getCategories();
        
		$this->load->view('frontend/partials/menus', $data);
    }

}