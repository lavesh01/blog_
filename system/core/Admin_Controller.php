<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Admin_Controller  extends CI_Controller {

    public $template ;
    public $customer_id;
    public $user_id ;
    public $role_id;
    public $theme_selected_template ;
    public $permissions_array = ["jhjh"];
    public $topheader = "";
    public $templatedata = array();
    public $cachefilename  = "";

    public function __construct()
    {
        parent::__construct();
         if($this->input->is_ajax_request() && $this->session->userdata("isloggedin") == false)
           {
            $reply["title"] =  "Logged out";
            $reply["text"] =  "Please re-login . <a href='".base_url()."auth/logout"."' >Login</a>";
            $reply["type"] =  "danger";
            $reply["confirmButtonClass"] =  'btn btn-danger' ;
            header("Content-type: application/json; charset=utf-8");
            echo json_encode($reply);  
            die();
           }
        elseif ($this->session->userdata("isloggedin") == false) {
           
            redirect(base_url()."auth/logout", 'auto');
        }
        elseif ($this->session->userdata("isloggedin") == false) {
           
            redirect(base_url()."auth/logout", 'auto');
        }
        else{
            $this->customer_id =  $this->session->userdata("customer_id");
            $this->role_id =  $this->session->userdata("role_id");
            $this->user_id = $this->session->userdata("id");
            $this->theme_selected_template  = $this->session->userdata("theme_selected_template");
            $this->load->library('parser');
            $this->load->library('encrypt');
            $this->load->helper('global');
            $this->load->library('mybreadcrumb');
            $this->mybreadcrumb->add('Home', base_url().'dashboard/index');
            $this->get_permission();
        }
        $this->session->set_userdata("last_visited",time());
        $this->cache();
        
    }

    private function cache()
    {
        $this->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
        $cachefoldername = $this->customer_id.'_'.$this->user_id.'_';
        $segments = implode("_",$this->uri->segment_array());
        if($segments ==""){
            $segments = "null.php";
        }
        else {
            $segments = preg_replace('/[^A-Za-z0-9]/ ','_', $segments) . ".php";
        }
        $this->cachefilename = $cachefoldername . $segments;
        
        if ($this->input->is_ajax_request() &&  $data = $this->cache->get($this->cachefilename)){
            $reply["type"] = "success";
            $reply["cached"] = "yes";
            $data = array_merge( $data,$reply);
            $data =  json_encode($data);
            return $this->output->set_content_type('application/json')->set_output($data);
           
            die;
        }
    }

    protected function datatable_data($query,$iTotalDisplayRecords="",$type="data", $t_search_term="",$custom_query ="" )
    {
    
      $draw = $this->input->post("draw");
      $start =  $this->input->post("start");
      $length = $this->input->post("length");
      $search_term = $this->input->post("search[value]");
      $iTotalDisplayRecordspost = $this->input->post("iTotalDisplayRecordspost"); 
     
      if ($t_search_term != "" && $search_term !="") {
        
         $s  = explode(',',$t_search_term );

         $query->group_start();
         foreach ($s as $key => $value) {
             $query = $query->or_like(trim($value,","),$search_term); 
         }
         $query->group_end();
        }

      if ((int)$length > 50) {
            $length = 50;
      }
      if ($custom_query == "") {
        if ($type=="data" || $type=="" ) {
            
            if (isset($iTotalDisplayRecordspost) && !empty($iTotalDisplayRecordspost))
            {
                $iTotalDisplayRecords = preg_replace('/[^0-9]/', '', $iTotalDisplayRecordspost) ;
            }
            else{
                $iTotalDisplayRecords = clone $query;
                $iTotalDisplayRecords = $iTotalDisplayRecords->count_all_results();
            }
           
           if ((int)$start == 0) {
              $query = $query->limit($length);
           }
           else
           {
              $query = $query->limit($length, $start);
           }
           
         
           //$data_arr  = $this->db->query(  $query->get_compiled_select()  )->result();    
            $data_arr  = $query->get()->result(); 
           $response = array(
              "draw" => intval($draw),
              "iTotalRecords" => count($data_arr), //$query->num_rows(),
              "iTotalDisplayRecords" => $iTotalDisplayRecords,
              "aaData" => $data_arr
           );
           return  $response;
        }
        if ($type=="field")
        {
         
          $data_arr  = $query->limit(1)->get()->list_fields();
         
          $a = [];
          foreach ($data_arr as $key => $value) {
              $title = ucwords(str_replace("_"," ",$value));
              $a[] = array("data" => $value, "title"=>$title, "name"=>$value, 'className'=>'css_'.str_replace(" ","_",$value));
          }
          
          return  array("data" => $a);
        }
      }
      else if ($custom_query == "yes")
      {
        if ($type=="data" || $type=="" ) {
            if ($iTotalDisplayRecords == "") {
              $iTotalDisplayRecords = $this->db->query($query)->num_rows();
            }
            $offset  = '';
            if ($start !='0' and $start != '')
            {
              $offset = ' offset '.  $start;
            }
            $query = $query . " limit " .$length . $offset;
            $q = $this->db->query($query);
            $iTotalRecords =  $q->num_rows();
            $response = array(
              "draw" => intval($draw),
              "iTotalRecords" => $iTotalRecords,
              "iTotalDisplayRecords" => $iTotalDisplayRecords,
              "aaData" => $q->result()
           );
           return  $response;
        }
        if ($type=="field")
        {
             $query = $query . " limit 1 " ;
             $a = [];
             
             if ($keys =  $this->db->query($query)) {
                 $keys = $keys->result();
                 if (isset($keys[0])) {
                   $fields = array_keys( (array)$keys[0]);
                   foreach ($fields as $key => $value) {
                        $a[] = array("data" => $value, "title"=>$value);
                   }
                 }
                 else
                 {
                     $a[] = array("data" => "no_data", "title"=>"No Data");
                 }
                return  array("data" => $a);  
            }
            else
            {
                return $this->db->error();
            }
          }
        }
    }

    protected function datatable_data_maxid($query,$iTotalDisplayRecords,$type="data",$col=[])
    {
        $qcount = clone $query;
        if ($type=="data" || $type=="" ) {
           $draw = $this->input->post("draw");
           $start = $this->input->post("start");
           $length = $this->input->post("length");
           $maxId = $this->input->post("maxId");
           $maxIdCol = $this->input->post("maxIdCol");

           if (isset($maxId) && $maxId != "-Infinity" && isset($maxIdCol)  && !empty($maxIdCol)) {
              $query = $query->where($maxIdCol . ' > ', $maxId);
              $start = 0;
           }
           // $qcount = $qcount->get()->num_rows();
           if ((int)$length > 50) {
                $length = 50;
           }
           if ((int)$start == 0) {
              $query = $query->limit($length)->get();
           }
           else
           {
            $query = $query->limit($length, $start)->get();
           }

           
          
           $data_arr  = $query->result();
           //$iTotalDisplayRecords = $iTotalDisplayRecords->countOne();
           $response = array(
              "draw" => intval($draw),
              "iTotalRecords" => "",
              "iTotalDisplayRecords" => 1000408,
              "aaData" => $data_arr,
              //"test" => $qcount->get_compiled_select()
           );
           return  $response;
        }
        if ($type=="field")
        {
            foreach($col as $value)
            {
            $value = trim($value);
            $title = trim(ucwords(str_replace("_"," ",$value)));
            $a[] = array("data" => $value, "title"=>$title, "name"=>$value, 'className'=>'css_'.str_replace(" ","_",$value));
            }

          return  array("data" => $a);
        }
    }
    public function htmlform($viewpath, $data=[] )
    {
         
        if($this->input->is_ajax_request())
        {
            try {
               $viewpath = str_replace("-",'/',$viewpath);
                $str = $this->load_view($viewpath,$data);
                echo json_encode(['type'=>'success', "csrf_value" => $this->security->get_csrf_hash(),'message'=>$str]);
               
            } catch (Exception $e) {
                echo json_encode(['type'=>'error','message'=>'not found', "csrf_value" => $this->security->get_csrf_hash()]);
            }
        }
        else
        {
            echo json_encode(['type'=>'error']);
        }
    }

    protected function get_permission()
    {
        
       if ($this->customer_id != 9999999) {
        $data = $this->db->select('permissions.name')
                       ->from('role_permissions')
                       ->join('permissions',' permissions.permission_id =role_permissions.permission_id ','left')
                       ->where('role_permissions.customer_id', $this->customer_id)
                       ->where('role_permissions.role_id', $this->role_id)
                       ->get()->result_array();;
          
        }
        else
        {
           $data = $this->db->select('name')
                       ->from('permissions')
                       ->group_by('name')
                       ->get()->result_array();;
        }
        foreach ($data as $key => $value) {
            $this->permissions_array[] = $value["name"];
          }
    }
    protected function check_permission($value,$sidebar="", $custom_key = true)
    {
        //return true;
        if ($this->customer_id == 9999999) {
            return true;
        }
        $data["title"] = 'Permission Denied';
        $controller =  $this->router->fetch_class();
        $method  =$this->router->fetch_method();
        $data["permission_denied"] = 1;
        if ($custom_key) {
          $permission_key_name = $value;
        }
        else
        {
            $permission_key_name = $controller.'.'.$method.'.'.$value;
        }
        $data["permission_key_name"] = $permission_key_name;
        if ($this->permissions_array == null || !in_array($permission_key_name, $this->permissions_array) )
        {
            if(!$this->input->is_ajax_request())
            {
              $this->load_view('themes/default/permission_denied',$data,$sidebar);
               return false;
            }
            else
            {
                return false;
            }
            
        }
        return true;
    }

    protected function check_permission_no_redirection($value,$sidebar="", $custom_key = true)
    {
        //return true;
        if ($this->customer_id == 9999999) {
            return true;
        }
        $data["title"] = 'Permission Denied';
        $controller =  $this->router->fetch_class();
        $method  =$this->router->fetch_method();
        $data["permission_denied"] = 1;
        if ($custom_key) {
          $permission_key_name = $value;
        }
        else
        {
            $permission_key_name = $controller.'.'.$method.'.'.$value;
        }
        $data["permission_key_name"] = $permission_key_name;
        if (!in_array($permission_key_name, $this->permissions_array))
        {
            return false;
        }
        return true;
    }

    protected function  ajax__response_data_preperation($title,$text,$type ,$data=[] )
    {
       if($this->input->is_ajax_request())
       {
        header("Content-type: application/json; charset=utf-8");
       }
       else{
        return;
       }
        
        $reply["title"] =  $title;
        $reply["text"] =  $text;
        $reply["type"] =  $type;
        $reply["confirmButtonClass"] =  'btn btn-'.$type ;
        $reply["csrf_value"] = $this->security->get_csrf_hash();
        if (sizeof($data) > 0) {
         $reply = array_merge($reply,$data);
        }
       
        return json_encode($reply);    
    }
    protected function temlate_data($data=[])
    {

       // $data["js"]    = $this->js;
        return $data;
    }
//zanex
    /*
    protected function load_view($view_path='',$data=[], $template_sidebar="",$template= "zanex")
    {
        
        $template = $this->theme_selected_template ;
        $data['theme_selected_template'] = $template;
        $data['breadcrumbs'] = $this->mybreadcrumb->render();
        $data["permissions_array"] = $this->permissions_array;

        if ($template == "default") {
            
            $data["ext_theme_view_path"] = APPPATH;
            $data["template_sidebar"] = "themes" . '/'.$template .'/'. 'partials/sidebar'; 
            $this->load->view("themes" . '/'. $template .'/' . "header",$data);
            $this->load->view($view_path,$data);
            $this->load->view("themes" . '/'.$template .'/'. "footer",$data);
        }
        else
        {   
            $ext_theme_view_path = FCPATH."resources/themes" . '/'. $template .'/' . "view/";
            $data["ext_theme_view_path"] = $ext_theme_view_path;
            $this->load->ext_view( $ext_theme_view_path, "header",$data);
            if (file_exists($ext_theme_view_path.$view_path.'.php')) {
                $this->load->ext_view($ext_theme_view_path,$view_path, $data);
            }
            else{
                $this->load->view($view_path,$data);
            }
            $this->load->ext_view($ext_theme_view_path, "footer",$data);
        }
    }
*/

    protected function load_view($view_path='',$data=[], $template_sidebar="",$template= "zanex")
    {
        
        $template = $this->theme_selected_template ;
        $data['theme_selected_template'] = $template;
        $data['breadcrumbs'] = $this->mybreadcrumb->render();
        $data["permissions_array"] = $this->permissions_array;
        $data['topheader'] = $this->topheader;

        if ($template == "default") {
            
            $data["ext_theme_view_path"] = APPPATH;
            $data["template_sidebar"] = "themes" . '/'.$template .'/'. 'partials/sidebar'; 
            $this->load->view("themes" . '/'. $template .'/' . "header",$data);
            $this->load->view($view_path,$data);
            $this->load->view("themes" . '/'.$template .'/'. "footer",$data);
        }
        else
        {   
            $this->benchmark->mark('ajax_page_load'); 
            $controller =  strtolower($this->router->fetch_class());
             $method  =strtolower($this->router->fetch_method());
            $ext_theme_view_path = FCPATH."resources/themes" . '/'. $template .'/' . "view/";
            $data["ext_theme_view_path"] = $ext_theme_view_path;
           if(!$this->input->is_ajax_request())
            {
                $this->load->ext_view( $ext_theme_view_path, "header",$data);
            }

            if($this->input->is_ajax_request() && !$this->cache->get($this->cachefilename))
            {
                $data = array_merge($data,$this->templatedata);
                $inputtopheader  = $this->input->post("topheader");
                $inputleftsubmenu  = $this->input->post("leftsubmenu");
                if (isset($data["topheader"]) && $data["topheader"] != "" && isset($inputtopheader) && $inputtopheader != $data["topheader"]) {
                    $data["topheaderhtml"] =  $this->load->ext_view($ext_theme_view_path,$data["topheader"], $data,true);
                }
                if (isset($data["leftsubmenu"]) && $data["leftsubmenu"] != "" && isset($inputtopheader) && $inputtopheader != $data["leftsubmenu"]) {
                    $data["leftsubmenuhtml"] =  $this->load->ext_view($ext_theme_view_path,$data["leftsubmenu"], $data,true);
                }
                if (file_exists($ext_theme_view_path.$view_path.'.php')) {
                    $data["html"] =  $this->load->ext_view($ext_theme_view_path,$view_path, $data,true);
                }
                else{
                    $data["html"] =   $this->load->view($view_path,$data,true);
                }

                $page_level_css_file_path = 'resources/themes/'.$template.'/assets/custom/css/'.$controller.'/'.$method.'.css';
                if (file_exists(FCPATH.$page_level_css_file_path ) )
                {
                      $data["css"][] = site_url().$page_level_css_file_path;
                }
                $this->benchmark->mark('ajax_page_load_end'); 
                $data["estimatedloadtime"] = $this->benchmark->elapsed_time('ajax_page_load', 'ajax_page_load_end');
                $data["estimatedmemoryusage"] = $this->benchmark->memory_usage();
                echo $this->ajax__response_data_preperation("","","success" ,$data);
                //$this->cache->save($this->cachefilename, $data);
                die;
            }
            

            if(!$this->input->is_ajax_request())
            {
             $this->load->ext_view($ext_theme_view_path, "footer",$data);
            }
        }

    }

    protected function prepare_datatable($data_arr, $fields , $primary_key_field='', $primary_key_field_link='',  $delete_key_field ='',$active='',$class="", $option=[])
    {
       
        $bool_col = isset($option["bool_col"])?$option["bool_col"]:array();
        if ($class=="") {
            $class="table table-hover table-striped table-bordered dataTable dtr-inline";
        }
       
        //$query =  $this->db->select($col_name)->from($table_name)->get();
        //$data_arr  = $query->result();
        //$fields  = $query->list_fields();

        $html = "";
        $html .= '<table class="'.$class.'" id="common_dataTable" role="grid" aria-describedby="common_dataTable_info"><thead><tr role="row">';
        if (isset($fields ))
        {
            foreach ($fields as  $value) {
               $html .= '<th>'.ucfirst($value).'</th>';
            }
        }
        $html .= '</tr></thead> <tbody>';
         if (isset($data_arr ) && isset($fields ))
        {
            foreach ($data_arr as $key => $value) {
                $v = (array)$value;
               // $html .= '<tr role="row" class="odd" id="dttr_'.$v[$primary_key_field].'">';
                $html .= "<tr>";
                foreach ($fields as  $f) {
                    if ($primary_key_field==$f) {
                        $html .= '<td > <a href="'.site_url().$primary_key_field_link.'/'.$v[$f].'" ><i class="fa fa-edit icon-gradient bg-arielle-smile"></i></a></td>';
                       // $html .= '<td ></td>';
                    }
                    elseif ($delete_key_field==$f) {
                        $html .= '<td > <i id="delete_'.$v[$primary_key_field].'" class="fa fa-trash icon-gradient bg-love-kiss  delete_class"></i></td>';
                    }
                    elseif ($active==$f) {
                        if ($v[$f] == 1) {
                            $active_text = "checked";
                        }
                        else
                        {
                            $active_text = "";
                        }

                        $html .= '<td ><input class="active_class" type="checkbox"  '.$active_text.'=""></td>';
                    }
                    else
                    {
                        $html .= '<td >'.$v[$f].'</td>';
                    }
                }
               $html .= "</tr>";
            }
        }
        $html .= '</tbody></table>';
        return $html ;
       
    }

    public function prepare_db_data($type='insert', $data="")
    {
      $data["customer_id"] = $this->customer_id;
      if ($type =='delete') {
          $data["deleted"] = $this->user_id;
          $data["deleted_by"] = date("Y-m-d H:i:s");
      }
      else if ($type =='update') {
          $data["modified_by"] = $this->user_id;
          $data["modified_on"] = date("Y-m-d H:i:s");
      }  
      else if ($type =='insert') {
          $data["created_by"] = $this->user_id;
          $data["created_on"] = date("Y-m-d H:i:s");
      }
      return $data;
    }

    function validateUDC($arr, $str)
    {
        foreach ($arr as $key => $value) {
            if ( strtolower($value->text) == strtolower($str)) {
                     return $value->id;
            }    
        }
        return false;
    }

    function validateTextArrayByText($arr, $str)
    {
        foreach ($arr as $value) {
            if ( trim(strtolower($value)) == trim(strtolower($str))) {
                     return $value;
            }    
        }
        return false;
    }

    function _do_upload($element_name,$module_name="", $reference_id="", $max_size='50000',$allowed_types='jpg|jpeg|png|gif|pdf|docx|xls|xlsx|doc|csv|txt|mp3|ogg|wav|mp4',$datasource="")
    {
        if ($module_name != "") {
          $upload_folder = "/".$module_name;
        }
        // Set preference
        $directory = "/resources/uploads".$upload_folder  .'/' . date("Y").'/'.date("m").'/'.date("d").'/';
        //If the directory doesn't already exists.
        $dir = '.'.$directory;
        if(!is_dir($dir)){
          //Create our directory.
          mkdir($dir , 755, true);
        }
        $file_name = md5( time() .'_'. rand(9,99999));
        $config['upload_path'] = $dir;
        $config['allowed_types'] = $allowed_types;
        $config['max_size'] = $max_size; // max_size in kb
        $config['file_name'] = $file_name;

        $this->load->library('upload',$config);        
        if ( ! $this->upload->do_upload($element_name))
        {
          header('HTTP/1.1 500 Internal Server Error');
          header('Content-type: text/plain');
          $error =$this->upload->display_errors();
          $error = str_replace("<p>","",$error);
          $error = str_replace("</p>","",$error);
          exit($error);
        }
        else
        {
          $data = $this->upload->data();
          $url = $directory. $file_name.$data["file_ext"];
          $data["url"] = $url;
          $data = $this->prepare_db_data("insert",$data);
          $this->load->model('Assets_model');
          $chk =  $this->Assets_model->new($data,$module_name, $reference_id, $datasource);
          if (isset($chk["code"])) {
            header('HTTP/1.1 500 Internal Server Error');
            header('Content-type: text/plain');
            exit("File not uploaded.");
          }
          else
          {
            $new_data = array("status"=>"success", "id" => $chk, "url" => $url, "client_name"=>$data["client_name"],
              'file_size'=> $data["file_size"], "full_path"=>$data["full_path"], "mime_type"=>$data["file_type"]  );
            return $new_data;
          }
        }
    }


    protected function email_config()
    {
      $this->load->model("Settings_model");
      return $this->Settings_model->keyvalue("email");
    }

    protected function send_email($email_config, $to_email,$subject,$message)
    {
      if (ENVIRONMENT != "production") {
        //return false;
      }
      //$email_config = $this->email_config();
      $this->load->library('email');
      $this->email->initialize($email_config);
      $this->email->set_newline("\r\n");
      $this->email->from($email_config["smtp_user"] , $email_config["Identification"]);
      $this->email->to($to_email);
      $this->email->subject($subject);
      $this->email->message($message);
      if(!$this->email->send())
      {
        log_message('error', 'Email not sent! Subject --> '.$subject . "  ::: " .$this->email->print_debugger());
      }
    }


  public function exportCSV($module,$header,$usersData, $json){ 
       // Set preference

        $directory = "resources/exported/".$module  .'/' . date("Y").'/'.date("m").'/'.date("d").'/';
        //If the directory doesn't already exists.
        $dir = FCPATH.$directory;
        if(!is_dir($dir)){
          //Create our directory.
          mkdir($dir , 755, true);
        }
        $file_name = md5( time() .'_'. rand(9,99999)).'.csv';
        $filepath  = $dir.$file_name;

       header("Content-Description: File Transfer"); 
       header("Content-Disposition: attachment; filename=$filepath"); 
       header("Content-Type: application/csv; ");
       
       // get data 
       $this->load->model('Exported_model');

       // file creation 
       $file = fopen($filepath, 'w+');
        $count = 0;
       fputcsv($file, $header);
       foreach ($usersData as $key=>$line){ 
        if (is_array($line)) {
           fputcsv($file,$line); 
           $count++;
        }
         
       }
       fclose($file); 
       return $this->Exported_model->new($directory.$file_name, $filepath,$file_name, $module , $json);
       exit; 
      
    }

    public function table_update_logs()
    {
        $chk = $this->db->insert("bf_table_update_logs", $data);
    }

    public function assetsdownloadlog($table='',$uuid='',$url="")
    {
       $notes= $this->input->post('commondownloadnotes');
       if ($notes == "") {
           $data['title'] = "Download File";
           $this->load_view('downloads',$data);
           return;
       }
       $this->load->helper('download');
       $this->db->select($url);
       $this->db->where("uuid",$uuid);
       $this->db->from($table);
       $q = $this->db->get()->result_array();
       if (sizeof($q) > 0) {
           $this->db->set('downloaded', 'downloaded+1', FALSE);
           $this->db->where("uuid",$uuid);
           $this->db->update($table);
           $insertdata = array('table_name' => $table, 'asset_uuid' => $uuid,'notes'=>$notes, 'customer_id' => $this->customer_id, 'created_by'=>$this->user_id, 'ip'=>$this->input->ip_address() );
           $this->db->insert('assets_download',$insertdata);
           force_download(FCPATH.$q[0][$url], NULL);
           
       }
    }


    public function updaterecord()
    {
       $input = $this->input->post();
       $name = $input["name"];
       $pk = $input["pk"];
       $value = trim($input["value"]);
       $table = $input["table"];
       $pk_name = $input["pk_name"];
       if (empty($name) || empty($pk) ||  empty($value) || empty($table) || empty($pk_name) ) {
           header("HTTP/1.1 400 OK");
           echo "Please try again!! Missing Values.";
           die();
       }

       $name = trim($this->encrypt->decode($name));
       $pk = trim($this->encrypt->decode($pk));
       $table = trim($this->encrypt->decode($table));
       $pk_name = trim($this->encrypt->decode($pk_name));

       $this->db->from($table);
       $q = $this->db->where($pk_name,$pk);
       if ($q->get()->num_rows() > 0) {
           $this->db->set($name, $value);
           $this->db->set("modified_by", $this->user_id);
           $this->db->where($pk_name,$pk);
           $chk = $this->db->update($table);
       }
       else
       {
        $arr_data = array($name => $value,
            $pk_name => $pk,
            "customer_id" => $this->customer_id, 
            "created_by" => $this->user_id
        );
            $chk = $this->db->insert($table,$arr_data);
       }
       
       if ($chk) {
          header("HTTP/1.1 200 OK");
          echo "updated";
          die();
       }
       else
       {
        header("HTTP/1.1 400 OK");
        echo $this->db->error_msg();
        die();
       }
    }

/*update on 04-02-2023*/
    public function _grocerycurd_output($view,$output = null)
    {
        
        $data = (array)$output;
        foreach ($data["js_files"] as $key => $value) {
             $data["js"][] = $value;
        }

        foreach ($data["css_files"] as $key => $value) {
             $data["css"][] = $value;
        }     
        $this->load_view($view,$data);
    }


}