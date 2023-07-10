<?php
function load_app_controllers()
{
  spl_autoload_register('my_own_controllers');
  
}
function my_own_controllers($class)
{

	include_once(FCPATH.'system/core/Admin_Controller.php');
  include_once(FCPATH.'system/core/Front_Controller.php');
}