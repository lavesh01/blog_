<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Front_Controller  extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
    }

    protected function front_load_view($view_path='',$data=[], $template_sidebar="",$template= "default")
    {
        $this->load->view("frontendthemes" . '/'. $template .'/' . "template",$data);
    }
}
