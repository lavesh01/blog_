<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Api extends Admin_Controller   {

public function __construct() {
       parent::__construct();
        if (!$this->check_permission('api','',true)) {
            echo $this->ajax__response_data_preperation("Access Required","You don't have permission!!","error");
            return false;
        }
           $this->load->library('form_validation');
           $this->mybreadcrumb->add('API List', base_url().'Api/index');
}

public function index()
{

    $data["title"] =  "API - Client Delivery";
    $data["css"] = [
                     
                    ];
    $data["js"] = [ 
                        
                           site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/api/index.js"
                    ];
    $data["types"] = $this->getAllInputTypes();
    $this->load_view("api/index", $data, 'operation/sidebar/sidebar');
}

public function ajax_getallapi($value='')
{
   
     $this->db->select('api_form.id as # ,name')
    ->from('api_form');
    $query = $this->db->order_by("api_form.created_on","desc")->where('customer_id',$this->customer_id);
    echo $this->ajax__response_data_preperation("","asas","success",$this->datatable_data($query,"" ,$value,"name"));
    die;
}

public function add_new_api($table_name="")
{

    $input = $this->input->post();
    if ($input["name"] == "" || $input["method"] == ""  || $input["api_url"] == "" ) {
        echo $this->ajax__response_data_preperation("Missing Input","Name or Method or  API URL","success");
        return false;
    }

      $input["customer_id"] = $this->customer_id;
      $input["created_by"]=  $this->user_id;
      unset($input["ci_csrf_token"]);
      $ck = $this->db->insert('api_form',$input);
      if($ck){
        echo $this->ajax__response_data_preperation("Successfully Added","","success");
      }
      else
      {
        echo $this->ajax__response_data_preperation("Not Added",$this->db->error()["code"],"success");
      }
      
}

public function getAllInputTypes()
{
    $sql = "SELECT * FROM bf_form_input_types";
    $query = $this->db->query($sql);
    if ($query->num_rows() > 0) {
        return  $query->result_array();
    } else {
        return 0;
    }
}

public function add_new_question($ref_id = "")
{
    if (!$this->check_permission('campaign.manager.create','',true)) {
        echo $this->ajax__response_data_preperation("Access Required","Access required for delete action","error");
        return false;
    }
    if ($ref_id == "") {
         echo $this->ajax__response_data_preperation("Input Required", "Campaign Not Found","error");
         die;
    }
    $chk = $this->ifformexits($ref_id);
    if (!$chk) {
       echo $this->ajax__response_data_preperation("Missing Input","Name or Method or  API URL","success");
        return false;
    }

     $this->form_validation->set_error_delimiters('', '');
     $this->form_validation->set_rules('inputype', 'inputype', 'required');
     $this->form_validation->set_rules('label', 'Input Name', 'required');
     $this->form_validation->set_rules('text_lenth', 'Text Lenth', 'required');
     $this->form_validation->set_rules('name', 'API Field Name', 'required');
     if ($this->form_validation->run() == FALSE) {
        echo $this->ajax__response_data_preperation("Input Required",  validation_errors(),"error");
        die;
     } 
     $input = $this->input->post();
     $data["name"]  =  $input["name"]; //str_replace(" ","_",preg_replace("/[^a-zA-Z]+/", "", trim($input["label"])));
     $data["type"] = $input["inputype"];
     $data["default"] = $input["default"];
     $data["htmlClass"] = $input["css_class"];
     $data["style"] = $input["css_style"];
     $data["label"] = $input["label"];
     $data["length"] = $input["text_lenth"];
      $data["customer_id"]=$this->customer_id;
     if (isset($input["required"])) {
        $data["required"] = $input["required"];
     }
     if (isset($input["placeholder"])) {
        $data["placeholder"] = $input["placeholder"];
     }
     $this->db->where('isdeleted', 0);
     $this->db->where('ref_id', $ref_id);
     $this->db->where('label', $data['label']);
     $this->db->from('api_inputs');

     $chk =  $this->db->count_all_results(); 
     if ($chk == 0) {
        $data["ref_id"] = $ref_id;
        $this->db->insert("api_inputs", $data);
        $data["id"] = $this->db->insert_id();
        if ($data["id"] == "0") {
            echo $this->ajax__response_data_preperation("Something went wrong",  "Please try again","warning",$data);
            die;
        }
        else
        {
            //$data["error"] = $this->db->error(); 
            $d["api_inputs"] = $this->form_question($ref_id);
            echo $this->ajax__response_data_preperation("Question Added",  "New Question is added","success",$d);
            die;
        }
      }
      else
      {
        $d["message"] = $this->db->error();
        echo $this->ajax__response_data_preperation("Question Exits",  "Question already exits","warning",$d);
            die;
      }
}

protected function form_question($value='')
{
    $this->load->helper("input_helper");
    $api_inputs_data = $this->get_form($value);
    $output_array = array();
    foreach ($api_inputs_data as $key => $value) {
        $output_array[] =  select_choices($value);
    }
    return $output_array; 
}

public function form_question_data($value='')
{
    echo json_encode($this->form_question($value));
}

public function get_form($ref_id) {
  
    $query =  $this->db->select("name, label, type, CONCAT(htmlClass, ' ', 'campaigns_questions')  as class, id ,  default , placeholder , case when required = 1 then 'required' else '' end as required , length")
    ->from("api_inputs")
    ->where("ref_id", $ref_id)
    ->where("isdeleted", "0")
    ->order_by('position','asc')
    ->get();
    $data = $query->result_array();
    if (sizeof($data) > 0) {
        return $data;
    } else {
        return array();
    }
}
public function delete_input()
{
    $chk = $this->ifformexits($id);
    if (!$chk) {
       echo $this->ajax__response_data_preperation("Missing Input","Name or Method or  API URL","success");
        return false;
    }
    if ($this->input->post()) {
        $id =$this->input->post("id");
        $update_data["isdeleted"] = "1";
        $update_data["deleted"] = date("Y-m-d H:i:s");
        $update_data["deletedby"] = $this->user_id;

        $this->db->where("id", $id);
        $chk = $this->db->update("api_inputs",$update_data );
        if ($chk) {
            $data["message"] = $this->db->error();
            echo $this->ajax__response_data_preperation("Delete","","success",$data["message"]);
        }
        else{
            $data["message"] = $this->db->error();
            echo $this->ajax__response_data_preperation("Not Delete","","warning",$data["message"]);    
        }
    }
}
public function api($api="")
{
    $chk = $this->ifformexits($api);
    if (!$chk) {
        $data["error"] = "Not Found";
        $data["title"] = "API Not Found";
      $this->load_view("error", $data);
      return false;
    }

    $data = $chk;
    $data["data"] = $data;
    $data["title"] =  "API - " . $data["name"];
    $data["css"] = [
                       
                    ];
    $data["js"] = [ 
                          site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/api/api.js"
                    ];
    $data["ref_id"] = $api;
    $data["types"] = $this->getAllInputTypes();
    $this->load_view("api/api", $data, 'operation/sidebar/sidebar');
}


public function save_values($id="")
{
    
      $input = $this->input->post();
      $q =  $this->db->from('api_form')->where("id",$id)->get();
      if ($q->num_rows() == 0) {
             echo $this->ajax__response_data_preperation("API not found",  "","error");
            return false;
      }
      $q = $q->result_array()[0];
      //$this->db->where('ref_id', $id);
      //$aa = $this->db->from('api_inputs')->get()->result_array();
      //$this->form_validation->set_error_delimiters('', '');
      //unset($input["ci_csrf_token"]);
      $lead_status = $this->callAPI($q["method"],$q["api_url"] , $input);
      $chk = $this->_savedata($id,$input,$lead_status);
      if ($chk) {
          echo $this->ajax__response_data_preperation("Successfully Added","","success");
      }
      else{
        echo $this->ajax__response_data_preperation("Error",$this->db->error()["message"],"success");
      }
}

private function ifformexits($id='')
{
      $input = $this->input->post();
      $q =  $this->db->from('api_form')->where("id",$id)->where("customer_id",$this->customer_id)->get();
      if ($q->num_rows() == 0) {
            return false;
      }
      return $q->result_array()[0];
      
}

private function _savedata($id,$input,$lead_status)
{
      $data["customer_id"] = $this->customer_id;
      $data["created_by"]=  $this->user_id;
      $data["status"]=  $lead_status;
      $data["data"] = json_encode([$input]);
      $data["ref_id"] = $id;
      return $this->db->insert('api_data',$data);
}



/*
    public function ajax_getall($value='')
    {
        

        $id = $this->input->post('id');
        $q =  $this->db->from('api_inputs')->where("ref_id",$id)->where('isdeleted','0')->order_by('position','asc')->get()->result_array();
        if ($value == "field") {
           $fields = [];
           $fields[] = array('data'=>'id','title'=>'id','name'=>'id');
            $fields[] = array('data'=>'status','title'=>'status','name'=>'status');
           foreach ($q as $k=>$v)
            {   $arr = [];
                $arr['data'] = $v["name"];
                $arr['title'] = $v["label"];
                $arr['name'] = $v["name"];
                $arr["defaultContent"]="";
                $fields[] = $arr;
            }
            
            $data["data"] = $fields;
            echo json_encode($data);
            die;
        }
       
        $query = $this->db->select('id,status , data')
        ->from('api_data')->where('customer_id',$this->customer_id)->where('ref_id',$id)->order_by("created_on","desc");
        $rows = $this->datatable_data($query,"" ,$value,"data");
        $r = [];
        $data = ($rows["aaData"]);
        foreach ($data as $key1 => $value1) {
            $arr = [];
            $arr["id"] = $value1->id;
            $arr["status"] = $value1->status;
            $jd = json_decode($value1->data);
            foreach ( $jd[0] as $key => $value) {
               $arr[$key] = $value;
               
            }
            $r[] = $arr;
        }
        $rows["aaData"] = $r;
        //echo json_encode(array("aaData"=>$r)); die;
        echo $this->ajax__response_data_preperation("","asas","success", $rows);
        die;

    }
*/

     private function _getall($value='')
    {   $id = $this->input->post('id');
        if (!isset($id) || empty($id)) {
           die;
        }
        $chk = $this->ifformexits($id);
        if (!$chk) {
           echo $this->ajax__response_data_preperation("Missing Input","Name or Method or  API URL","success");
            die;
           
        }
        
        if ($value == "field") {
           $q =  $this->db->from('api_inputs')->where("ref_id",$id)->where('isdeleted','0')->order_by('position','asc')->get()->result_array();
           $fields = [];
           $fields[] = array('data'=>'id','title'=>'id','name'=>'id');
            $fields[] = array('data'=>'status','title'=>'status','name'=>'status');
           foreach ($q as $k=>$v)
            {   $arr = [];
                $arr['data'] = $v["name"];
                $arr['title'] = $v["label"];
                $arr['name'] = $v["name"];
                $arr["defaultContent"]="";
                $fields[] = $arr;
            }
            
           $data["data"]  = $fields;
            return $data; //json_encode($data);
            die;
        }
       
        $query = $this->db->select('id,status ,created_on, data')
        ->from('api_data')->where('customer_id',$this->customer_id)->where('ref_id',$id)->order_by("created_on","desc");
        $rows = $this->datatable_data($query,"" ,$value,"data,status");
        $r = [];
        $data = ($rows["aaData"]);
        foreach ($data as $key1 => $value1) {
            $arr = [];
            $arr["id"] = $value1->id;
            $arr["status"] = $value1->status;
            $jd = json_decode($value1->data);
            foreach ( $jd[0] as $key => $value) {
               $arr[$key] = $value;
            }
            $r[] = $arr;
        }
          $rows["aaData"] = $r;
          return $rows;
        //echo json_encode(array("aaData"=>$r)); die;
        echo $this->ajax__response_data_preperation("","asas","success", $rows);
        die;

    }

    public function ajax_getall($value="")
    {

        $rows = $this->_getall($value);
        if ($value == "field") {
            echo json_encode($rows);
        }
        else{
            echo $this->ajax__response_data_preperation("","asas","success", $rows);
        }
        die;
    }
    public function ajax_exportall()
    {
        $h = $this->_getall("field");
        $header = [];
        foreach ( $h["data"] as $v )
        {
            $header[] = $v["name"];
        }
        $usersData = $this->_getall("data");
        $json = json_encode([]);
        $chk = $this->exportCSV("apidataexport",$header,$usersData["aaData"], $json);
        echo $this->ajax__response_data_preperation("File is ready to download","<b><a href='".site_url().$chk["url"]."' target='_blank'>Click here to download</a></b>","success"  );
    }



    private function callAPI($method, $url, $data){
       $curl = curl_init($url);
       curl_setopt($curl, CURLOPT_POSTFIELDS,  $data);
       curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
       $result = curl_exec($curl);
       if(!$result){
        return "Connection Failure";
       }
       curl_close($curl);
       return $result;
    }

    public function ajax_apidelete($value='')
    {   
        $id = $this->input->post("id");
        if (isset($id) ) {
            echo $this->ajax__response_data_preperation("Not deleted","try again!!","warning");
        }
        $chk = $this->ifformexits($id);
        if (!$chk) {
           echo $this->ajax__response_data_preperation("Missing Input","Name or Method or  API URL","success");
            return false;
        }
        if($this->db->delete("api_form", array('id' => $this->input->post("id") )))
        {
            echo $this->ajax__response_data_preperation("deleted","","success");
        }
        else{
            echo $this->ajax__response_data_preperation("Not deleted","try again!!","warning");
        }
        
    }

    public function ajax_order_status()
    {
        
        $data = $this->input->post();
        $column = strtolower($data["order"]);
        if (isset($column)) {
            $items = explode(",",$column);
            for ($i=0; $i < sizeof($items) ; $i++) { 
                $data = array('position' => $i, 'modified_by' => $this->user_id);
                $this->db->where('customer_id', $this->customer_id);
                $this->db->where('id', $items[$i]);
                $this->db->update('api_inputs', $data);
            }
            echo $this->ajax__response_data_preperation("Update successfully","","success");    
        }
        else
        {
            echo $this->ajax__response_data_preperation("Error","Something Went Wrong","warning");      
            return false;
        }
    }

    
    public function ajax_apidatadelete($value='')
    {
        $id = $this->input->post("id");
        if (!isset($id) ) {
            echo $this->ajax__response_data_preperation("Not deleted","try again!!","warning");
        }
        
        if($this->db->delete("api_data", array('id' => $this->input->post("id") , 'customer_id' => $this->customer_id)))
        {
            echo $this->ajax__response_data_preperation("deleted","","success");
        }
        else{
            echo $this->ajax__response_data_preperation("Not deleted","try again!!","warning");
        }
        
    }

    public function ajax_getsingleapirow()
    {
        $input = $this->input->post();
        if (isset($input["id"]) && isset($input["ref_id"]) && !empty($input["id"]) && !empty($input["ref_id"]) ) {
            $q =  $this->db->from('api_data')->where("id",$input["id"])->where("ref_id",$input["ref_id"])->get();
            if ($q->num_rows() > 0) {
                $data["data"] = json_decode($q->result_array()[0]["data"]);
                echo $this->ajax__response_data_preperation("","","success",$data);
            }
            else
            {
                echo $this->ajax__response_data_preperation("No Item","","warning");
            }
        }
    }

    public function generateimporttemplate(){
        $id = $this->input->post("id");
        if (isset($id) && !empty($id)) {
            $chk = $this->ifformexits($id);
            if ($chk) {

                $this->db->where('isdeleted', 0);
                $this->db->where('ref_id', $id);
                $this->db->order_by('position');
                $q = $this->db->from('api_inputs')->get();
                if ($q->num_rows() > 0 ) {
                    $qr = $q->result_array();
                    $input = [];
                    foreach ($qr as $key => $value) {
                        $input [] = $value["name"];
                        
                    }
                    $time = time();
                    $fpath =  'resources/data/api/template/'.date('Y/m/d').'/';
                    if (!is_dir(FCPATH.$fpath)) {
                        mkdir(FCPATH.$fpath, 0777, TRUE);
                    }
                    $filename = md5($time).'.xlsx';
                    $fullFile =FCPATH. $fpath.$filename; 
                    /*
                    $delimiter = ",";
                    $fp = fopen($fullFile, 'w') or die("can't open file");
                    fputcsv($fp ,  $input , $delimiter);
                    fclose($fp);
                    */
                    $spreadsheet = new Spreadsheet();
                    $sheet = $spreadsheet->getActiveSheet();
                    $row = 1;
                    foreach ($input as $key => $header) {
                        $column = $key + 1;
                        $sheet->setCellValueByColumnAndRow($column, $row, $header);
                    }
                    $writer = new Xlsx($spreadsheet);
                    $writer->save($fullFile);
                    
                    $data["url"] = site_url() . $fpath.$filename;
                    echo $this->ajax__response_data_preperation('','','success',$data);
                }
                else
                {
                   echo $this->ajax__response_data_preperation('','','warning');
                }
            }
        }
        else
            echo $this->ajax__response_data_preperation('','','warning');
    }

    public function uploadcsv($id)
    {

        $data["title"] = 'Upload API';
        $data["decription"] = '';
        $data["js"] = [ 
                        site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/api/uploadcsv.js"
                    ];
        $this->load->model("Assets_model");
        $data["getAssets"] = $this->Assets_model->getAssetProspect("APIUpload");
        $this->load_view("api/uploadcsv",$data,'operation/sidebar/sidebar');
    }

    public function upload_api_bulk($id)
    {
        if (isset($id) && !empty($id)) {

            $data = $this->_do_upload('file',"APIUpload","", "500", "csv|xlsx|xls");
            if (isset($data)) {
                if ($this->xl_read_n_load($data["full_path"], $id, $data["id"]))
                {
                    echo $this->ajax__response_data_preperation("Bulk Upload Completed","","success");  
                }
                else
                {
                    echo $this->ajax__response_data_preperation("Error","Something Went Wrong","warning");      
                }
            }
            }
        else{
            
        }
    }

    function read_n_load($filename_load, $ref_id, $asset_id)
    {

        $data_batch_insert = [];
        $row_count = 0;
        $row_inserted = 0;
        if (($handle = fopen($filename_load, "r")) !== FALSE) {       
            $time = time();
            $fpath =  'resources/uploads/APIUpload/export/'.date('Y/m/d').'/';
            if (!is_dir(FCPATH.$fpath)) {
                mkdir(FCPATH.$fpath, 0777, TRUE);
            }
            $filename = md5($time).'.csv';
            $fullFile =FCPATH. $fpath.$filename; 
            $delimiter = ",";
            $headers = fgetcsv($handle);
            $fp = fopen($fullFile, 'w') or die("can't open file");
            while (($data = fgetcsv($handle, 0, $delimiter = ",")) !== FALSE) {
                $error_message = "";
                if (1==1) 
                {   
                    $send_data = array_combine($headers, $data);
                    $svdbdata["data"] = json_encode([$send_data]);
                    $svdbdata["status"] = "Not Uploaded";
                    $svdbdata["customer_id"] = $this->customer_id;
                    $svdbdata["ref_id"] = $ref_id;
                    
                    if ($this->db->insert('api_data',$svdbdata))
                    {
                        $rowinsertedid = $this->db->insert_id();
                        $q =  $this->db->from('api_form')->where("id",$ref_id)->get();
                        if ($q->num_rows() == 0) {
                            echo $this->ajax__response_data_preperation("API not found",  "","error");
                            return false;
                        }
                        $q = $q->result_array()[0];
                        $lead_status = $this->callAPI($q["method"],$q["api_url"] , $send_data);
                        $this->db->set('status',$lead_status);
                        $this->db->where('id',$rowinsertedid);
                        $this->db->update("api_data");
                        $svdbdata["status"] = $lead_status;
                        $row_inserted++;
                    }
                    else{
                        $svdbdata["status"] = "Not Saved DB";
                        fputcsv($fp ,  $input , $delimiter);
                    }
                }
               else
                {
                    $data['Result']  = 'all column not found';
                    fputcsv($fp ,  $data , $delimiter);
                }
                $row_count++;
            }
            fclose($handle);
            fclose($fp);
            $asset_prospects["result_csv"] =  $fpath.$filename; 
            $asset_prospects["asset_id"] = $asset_id;
            $asset_prospects["uploaded_row"] =$row_count;
            $asset_prospects["accepted_row"] =$row_inserted;
            $this->db->insert("asset_datafiles",$asset_prospects );
            return true;
        }
    }

    function xl_read_n_load($filename_load, $ref_id, $asset_id)
    {

        $data_batch_insert = [];
        $row_count = 0;
        $row_inserted = 0;

        $time = time();
        $fpath =  'resources/uploads/APIUpload/export/'.date('Y/m/d').'/';
        if (!is_dir(FCPATH.$fpath)) {
            mkdir(FCPATH.$fpath, 0777, TRUE);
        }
        $filename = md5($time).'.xlsx';
        $fullFile =FCPATH. $fpath.$filename; 
        
        $spreadsheet = IOFactory::load($filename_load);
        $sheet = $spreadsheet->getActiveSheet();
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();
        // Array to store column names
        $columnNames = [];
        for ($col = 'A'; $col <= $highestColumn; $col++) {
            $cellValue = $sheet->getCell($col . '1')->getValue();
            $columnNames[] = $cellValue;
        }
        for ($row = 2; $row <= $highestRow; $row++) {
            $row_arr = [];
            for ($col = 'A'; $col <= $highestColumn; $col++) {
                $row_arr[] = $sheet->getCell($col . $row)->getValue();
            }
            $send_data = array_combine($columnNames, $row_arr);
            $svdbdata["data"] = json_encode([$send_data]);
            $svdbdata["status"] = "Not Uploaded";
            $svdbdata["customer_id"] = $this->customer_id;
            $svdbdata["ref_id"] = $ref_id;
            
            if ($this->db->insert('api_data',$svdbdata))
            {
                $rowinsertedid = $this->db->insert_id();
                $q =  $this->db->from('api_form')->where("id",$ref_id)->get();
                if ($q->num_rows() == 0) {
                    echo $this->ajax__response_data_preperation("API not found",  "","error");
                    return false;
                }
                $q = $q->result_array()[0];
                $lead_status =""; //$this->callAPI($q["method"],$q["api_url"] , $send_data);
                $this->db->set('status',$lead_status);
                $this->db->where('id',$rowinsertedid);
                $this->db->update("api_data");
                $svdbdata["status"] = $lead_status;
                $row_inserted++;
            }
            else{
                $svdbdata["status"] = "Not Saved DB";
                fputcsv($fp ,  $input , $delimiter);
            }
            $row_count++;
        }
        $spreadsheet->disconnectWorksheets();
        $asset_prospects["result_csv"] =  $fpath.$filename; 
        $asset_prospects["asset_id"] = $asset_id;
        $asset_prospects["uploaded_row"] =$row_count;
        $asset_prospects["accepted_row"] =$row_inserted;
        $this->db->insert("asset_datafiles",$asset_prospects );
        return true;
    }

}

