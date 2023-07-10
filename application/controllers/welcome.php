<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Welcome extends Admin_Controller   {


  public function __construct() {
       parent::__construct();
       $this->load->model("Campaign_model");
	}

	public function index()
	{
			$data["title"] =  "Dashboard";
			$this->load_view("welcomepage", $data,'users/sidebar/sidebar');
	}
 }