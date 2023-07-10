<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Exported_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    public function new($url, $filepath,$filename, $module , $json="")
    {
    	$data["url"] = $url;
        $data["filepath"] = $filepath;
        $data["filename"] = $filename;
        $data["details"] = $json;
    	$data["module"] = $module;
    	$data["customer_id"] = $this->customer_id;
    	$data["created_by"] = $this->user_id;
    	
    	
    	$chk = $this->db->insert("exported", $data);
    	if ($chk > 0) {
            $data["id"] = $this->db->insert_id() ;
           //echo $data["id"] ;
            $q = $this->db->get_where('exported', array('id' => $data["id"]))->result_array()[0];
            $insertdata = array('table_name' => 'exported', 'asset_uuid' => $q["uuid"],'notes'=>"data exported", 'customer_id' => $this->customer_id, 'created_by'=>$this->user_id, 'ip'=>$this->input->ip_address() );
           $this->db->insert('assets_download',$insertdata);
           return array_merge($data,$insertdata);
    	  //$this->db->insert_id() ;
    	} 
    	else {
    	 return $this->db->error();
    	}
    }

    public function getAllExportedByCustomer($module)
    {
        $this->db->select('exported.id as #,exported.uuid,exported.created_on as Date,users.username, exported.Downloaded' );
        $this->db->from("exported");
        $this->db->join('users', 'exported.created_by = users.id');
        $this->db->where("exported.customer_id", $this->customer_id);
        $this->db->where("module", $module);
        return $this->db->order_by('exported.created_on', 'DESC');
    }

    public function getAllExportedByCustomerGroupedByUser($module,$limit=10)
    {
        $this->db->select('users.username,profile_url, Count(1) as count' );
        $this->db->from("exported");
        $this->db->join('users', 'exported.created_by = users.id');
        $this->db->where("exported.customer_id", $this->customer_id);
        $this->db->where("module", $module);
        $this->db->group_by("users.username");
        return $this->db->order_by('exported.created_on', 'DESC')->limit($limit);
    }

    public function getAllExportedByUser($module)
    {
        $this->db->select('created_on as Exported,id as View, url as Download');
        $this->db->from("exported");
        $this->db->where("created_by", $this->user_id);
        $this->db->where("customer_id", $this->customer_id);
        $this->db->where("module", $module);
        return $this->db->order_by('created_on', 'DESC');
    }

    public function getAllExportedByID($id)
    {
        $this->db->select('*');
        $this->db->from("exported");
        $this->db->where("created_by", $this->user_id);
        $this->db->where("customer_id", $this->customer_id);
        $this->db->where("id", $id);
        return $this->db->order_by('created_on', 'DESC')->get()->result();;
    }
    
}