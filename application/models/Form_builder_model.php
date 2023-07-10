<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Form_builder_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                // Your own constructor code

        }

        public function new_form($form_name, $public_name)
        {
           $formbuilder = $this->load->database('formbuilder', TRUE);
           $formbuilder->where('form_name', $form_name);
           $formbuilder->or_where('public_name', $public_name);
           $formbuilder->from('forms');
           $chk =  $formbuilder->count_all_results(); 
           //echo $chk; die;
           if ($chk == 0 ) {
               $data = array(
                            'form_name' => strip_tags($form_name),
                            'public_name' => strip_tags($public_name)
                        );
                 $formbuilder->insert("forms", $data);
                $chk =$formbuilder->insert_id();
                if ($chk > 0) {
                   return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return "already exits";
            }
        }


        public function getformInfoByPublicName($public_name)
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $sql = "SELECT * FROM bf_forms where public_name = '".$public_name."'";
            $query = $formbuilder->query($sql);
            if ($query->num_rows() > 0) {
                return  $query->result_array();
            } else {
                return 0;
            }
        }

        public function getformIdByPublicName($public_name)
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $sql = "SELECT * FROM bf_forms where public_name = '".$public_name."'";
            $query = $formbuilder->query($sql);
            if ($query->num_rows() > 0) {
                return  $query->result_array()[0]["id"];
            } else {
                return 0;
            }
        }
        public function get_form($public_name) {
          
          $formbuilder = $this->load->database('formbuilder', TRUE);
           $form_id = $this->getformIdByPublicName($public_name);

            $sql = "SELECT uuid as name, label, type, htmlClass as class, field_id as id,  default_value as 'default' , placeholder , case when required = 1 then 'required' else '' end as required , length  FROM bf_form_inputs where form_id = '".$form_id."'";
            $query = $formbuilder->query($sql);
            if ($query->num_rows() > 0) {
                return $query->result_array();
            } else {
                return array();
            }
        }

        public function getFormByID($form_id) {
          
           //$form_id = $this->getformIdByPublicName($public_name);
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $sql = "SELECT uuid as name, label, type, htmlClass as class, field_id as id,  default_value as 'default' , placeholder , case when required = 1 then 'required' else '' end as required , length  FROM bf_form_inputs where form_id = '".$form_id."'";
            $query = $formbuilder->query($sql);
            if ($query->num_rows() > 0) {
                return $query->result_array();
            } else {
                return array();
            }
        }

        public function set_form_data( $data)
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            foreach ($data as $key => $value) {
                $formbuilder->insert("form_data", $value);
            }
        }

        public function getIdByUUID($uuid)
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $sql = "SELECT * FROM bf_form_inputs where uuid = '".$uuid."'";
            $query = $formbuilder->query($sql);
            if ($query->num_rows() > 0) {
                return  $query->result_array()[0];
            } else {
                return 0;
            }
        }


        public function getAllInputTypes()
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $sql = "SELECT * FROM input_types";
            $query = $formbuilder->query($sql);
            if ($query->num_rows() > 0) {
                return  $query->result_array();
            } else {
                return 0;
            }
        }

        public function add_new_field($public_name, $data)
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $form_id = $this->getformIdByPublicName($public_name);

            if ($form_id > 0) {
               $formbuilder->where('form_id', $form_id);
               $formbuilder->where('label', $data['label']);
               $formbuilder->from('form_inputs');
               $chk =  $formbuilder->count_all_results(); 
               if ($chk == 0) {
                    $data["form_id"] = $form_id;
                    $formbuilder->insert("form_inputs", $data);
                    return 1;
                    //$formbuilder->insert_id();
               }
               else
               {
                return 2;
               }
               
            }
            else
            {
                return 0;
            }
        }

        public function list($public_name, $offset=0)
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $form_id = $this->getformIdByPublicName($public_name);
            if ($form_id > 0) {
                $data =array();
                $offset = "";
                $limit = 25;
                if ($offset != 0) {
                    $offset = "offset ". ($offset*$limit);
                }
                $group = "select distinct groups from bf_form_data where f_id= ".$form_id." order by createddate desc limit 25  ". $offset ;
                $query_group = $formbuilder->query($group);
                if ($query_group->num_rows() > 0) {
                    $grouping =   $query_group->result_array();
                    $sql_listed = "select fi_id, label, type from bf_form_inputs where listed = 1 and  form_id = ".$form_id." ;";
                    $query_listed = $formbuilder->query($sql_listed);
                    $listing =   $query_listed->result_array();
                    
                    foreach ($grouping as $grkey => $gr) {
                        $group_name = $gr["groups"];
                        $rows = array();
                        
                        foreach ($listing as $lskey => $ls) {
                          $label = $ls["label"];
                          $fl_id = $ls["fi_id"];
                          
                          $sql = "SELECT fd.value  FROM `form_data` fd where  fi_id = ".$fl_id." and  fd.groups = '".$gr["groups"]."'";
                          $query = $formbuilder->query($sql);

                           if ($query->num_rows() > 0) {
                            $row =   $query->result_array();
                            $replace_html = get_input_html($ls["type"],$row[0]["value"] );
                    
                            $rows[] = $replace_html;
                           }
                           else
                           {
                             $rows[] = "";
                           }

                        }
                        $rows[] = $gr["groups"];
                        $data[] = $rows;
                    }

                    $headers = array();
                    foreach ($listing as $lskey => $ls) {
                        $headers[] =   [$ls["label"]];
                    }
                    $data1=array();
                    $data1["data"] = $data;
                    $data1["draw"] = 1;
                    $data1["recordsTotal"] = 40;
                    $data1["recordsFiltered"] = 40;
                    $data1["columns"] = $headers;

                } else {
                    return 0;
                }
                return $data1;
            }
            else
            {
                return 0;
            }
        }

        public function getSingleRecordByGroupID($groups_id, $form_id)
        {
            $formbuilder = $this->load->database('formbuilder', TRUE);
            $data =array();
            
            $sql_listed = "select label,field_id ,fi_id, type from bf_form_inputs where form_id = ".$form_id;
            $query_listed = $formbuilder->query($sql_listed);
            if ($query_listed->num_rows() > 0) {
                $listing =   $query_listed->result_array();
                foreach ($listing as $key => $ls) {
                    $group = "select fd.value from bf_form_data fd where groups = '".$groups_id."' and fi_id = '".$ls["fi_id"]."'";
                    $query_group = $formbuilder->query($group);
                    
                    if ($query_group->num_rows() > 0) {
                        $dvalue =  $query_group->result_array()[0]['value'];
                        $data[] = array("field_id" => $ls['field_id'], "value" => $dvalue, "type" => $ls["type"]);
                    }
                    else
                    {
                       $data[] = array("field_id" => $ls['field_id'], "value" => "", "type" => $ls["type"]);
                    }
                    
                }
                return $data;
            }
            else
            {
                return 0;
            }
        }

    public function getFormIdByGroup($groups_id)
    {
        $formbuilder = $this->load->database('formbuilder', TRUE);
        $group = "select fd.f_id from bf_form_data fd where groups = '".$groups_id."'";
        $query_group = $formbuilder->query($group);
        if ($query_group->num_rows() > 0) {
            return  $query_group->result_array()[0]['f_id'];
        }
        else
        {
            return 0;
             //$data[$ls['field_id']] =  "";
        }
    }


    public function getViewByFormID($form_id)
    {
        $formbuilder = $this->load->database('formbuilder', TRUE);
        $group = "select html from bf_form_record_view fd where f_id = ".$form_id;
        $query_group = $formbuilder->query($group);
        if ($query_group->num_rows() > 0) {
            return  $query_group->result_array()[0]['html'];
        }
        else
        {
            return 0;
             //$data[$ls['field_id']] =  "";
        }
    }

    public function getAllForms()
    {
        $formbuilder = $this->load->database('formbuilder', TRUE);
        $c =  $formbuilder->from('forms')->get();
        if ($c->num_rows() > 0) {
            return $c->result_array();
        }
        else{
            return 0;
        }
    }

    public function add_update_view_html($data)
    {
        $formbuilder = $this->load->database('formbuilder', TRUE);
        $f_id = $data["f_id"];

        $formbuilder->where('f_id', $f_id);
        $formbuilder->from('form_record_view');
        $chk =  $formbuilder->count_all_results();
        if ($chk == 0) {
            $formbuilder->insert('form_record_view', $data);
        }
        else
        {
            $formbuilder->where('f_id', $f_id);
            $formbuilder->update('form_record_view', $data);
        }

    }
    
}

