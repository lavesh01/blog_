<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Assets_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    public function new($file_data, $module , $reference_id,$datasource="")
    {
    	$data["file_name"] = $file_data["file_name"];
    	$data["file_type"] = $file_data["file_type"];
    	$data["file_path"] = $file_data["file_path"];
    	$data["full_path"] = $file_data["full_path"];
    	$data["raw_name"] = $file_data["raw_name"];
    	$data["orig_name"] = $file_data["orig_name"];
    	$data["client_name"] = $file_data["client_name"];
    	$data["file_ext"] = $file_data["file_ext"];
    	$data["file_size"] = $file_data["file_size"];
    	$data["status"] = "1";
    	$data["reference_id"] = $reference_id;
    	$data["module"] = $module;
    	$data["customer_id"] = $file_data["customer_id"];
    	$data["created_by"] = $file_data["created_by"];
    	$data["created_on"] = $file_data["created_on"];
    	$data["url"] = $file_data["url"];
        if($datasource != "") {
    	   $data["datasource"] = $datasource;
        }
    	$chk = $this->db->insert("assets", $data);
    	if ($chk > 0) {
    	 return $this->db->insert_id() ;
    	} 
    	else {
    	 return $this->db->error();
    	}
    }

    public function getRecordings($module,  $reference_id)
    {
        $this->db->select('*');
        $this->db->from("assets");
       // $this->db->where("customer_id", $this->customer_id);
        $this->db->where("module", $module);
        $this->db->where("reference_id", $reference_id);
        return $this->db->order_by('created_on', 'DESC')->get()->result();
    }
    public function getAssets($module,  $reference_id="")
    {
        $this->db->select('*');
        $this->db->from("assets");
        $this->db->where("customer_id", $this->customer_id);
        $this->db->where("module", $module);
        if ($reference_id !="")
        {
            $this->db->where("reference_id", $reference_id);
        }
       
        return $this->db->order_by('created_on', 'DESC')->get()->result();
    }
    public function getAssetsForAjaxDatatabele($module,  $reference_id)
    {
        $this->db->select("assets.client_name as file, users.username, assets.created_on, assets.uuid");
        $this->db->from("assets");
        $this->db->join('users', 'assets.created_by = users.id');
        $this->db->where("assets.customer_id", $this->customer_id);
        $this->db->where("module", $module);
        $this->db->where("reference_id", $reference_id);
        return $this->db->order_by('created_on', 'DESC');
    }

    public function getAssetProspectByUser($module,  $reference_id="")
    {
        $this->db->select("assets.client_name 'File Name',  assets.created_on 'Date',  asset_prospects.uploaded_row 'Uploaded', asset_prospects.accepted_row 'Accepted', asset_prospects.uuid 'Result', asset_prospects.Downloaded");
        $this->db->from("assets as assets");
        $this->db->join('asset_prospects as asset_prospects', 'assets.id = asset_prospects.asset_id');
        $this->db->where('assets.created_by', $this->user_id);
        $this->db->where("assets.customer_id", $this->customer_id);
        $this->db->where("assets.module", $module); 
        if ($reference_id !="")
        {
            $this->db->where("assets.reference_id", $reference_id);
        }
        return $this->db->order_by('assets.created_on', 'DESC');
        
    }

    public function getAssetProspect($module,  $reference_id="")
    {
        $this->db->select('assets.client_name , users.username, assets.created_on as Date,  asset_prospects.uploaded_row, asset_prospects.accepted_row, asset_prospects.uuid as Result,  asset_prospects.Downloaded');
        $this->db->from("assets");
        $this->db->join('asset_prospects', 'assets.id = asset_prospects.asset_id');
        $this->db->join('users', 'assets.created_by = users.id');
        $this->db->where("assets.customer_id", $this->customer_id);
        $this->db->where("assets.module", $module); 
        if ($reference_id !="")
        {
            $this->db->where("assets.reference_id", $reference_id);
        }
        return $this->db->order_by('assets.created_on', 'DESC')->get()->result();
        print_r($this->db->error() );die;
    }
    public function getAssetLeadFileDetails($module,  $reference_id="")
    {
        $this->db->select('assets.id,assets.status, datasource.datasource,assets.client_name , users.username, assets.created_on as Date,  asset_prospects.uploaded_row, asset_prospects.accepted_row, asset_prospects.uuid as Result,  asset_prospects.Downloaded');
        $this->db->from("assets");
        $this->db->join('asset_prospects', 'assets.id = asset_prospects.asset_id');
        $this->db->join('datasource', 'assets.datasource = datasource.id', 'left');
        $this->db->join('users', 'assets.created_by = users.id');
        $this->db->where("assets.customer_id", $this->customer_id);
        $this->db->where("assets.module", $module); 
        if ($reference_id !="")
        {
            $this->db->where("assets.reference_id", $reference_id);
        }
        return $this->db->order_by('assets.created_on', 'DESC');
        print_r($this->db->error() );die;
    }

    public function getAssetFileDetails($module,  $reference_id="")
    {
        $this->db->select('assets.id,assets.status, datasource.datasource,assets.client_name , users.username, assets.created_on as Date,  asset_datafiles.uploaded_row, asset_datafiles.accepted_row, asset_datafiles.uuid as Result,  asset_datafiles.Downloaded');
        $this->db->from("assets");
        $this->db->join('asset_datafiles', 'assets.id = asset_datafiles.asset_id');
        $this->db->join('datasource', 'assets.datasource = datasource.id', 'left');
        $this->db->join('users', 'assets.created_by = users.id');
        $this->db->where("assets.customer_id", $this->customer_id);
        $this->db->where("assets.module", $module); 
        if ($reference_id !="")
        {
            $this->db->where("assets.reference_id", $reference_id);
        }
        return $this->db->order_by('assets.created_on', 'DESC');
        print_r($this->db->error() );die;
    }

    public function getAssetDataFileCTPS($module="ctps")
    {
        $this->db->select('assets.client_name , assets.created_on as Date,  asset_datafiles.uploaded_row as Uploaded, asset_datafiles.accepted_row as DND, asset_datafiles.uuid as Result,  asset_datafiles.Downloaded');
        $this->db->from("assets");
        $this->db->join('asset_datafiles', 'assets.id = asset_datafiles.asset_id');
        $this->db->join('users', 'assets.created_by = users.id');
        $this->db->where("assets.customer_id", $this->customer_id);
        $this->db->where("assets.module", $module);
        return $this->db->order_by('assets.created_on', 'DESC');
        print_r($this->db->error() );die;
    }


    public function getAssetDataFile($module)
    {
        $this->db->select('assets.client_name , assets.created_on as Date,  asset_datafiles.uploaded_row as Uploaded, asset_datafiles.accepted_row as Accepted, asset_datafiles.uuid as Result,  asset_datafiles.Downloaded');
        $this->db->from("assets assets");
        $this->db->join('asset_datafiles asset_datafiles', 'assets.id = asset_datafiles.asset_id');
        $this->db->join('users users', 'assets.created_by = users.id');
        $this->db->where("assets.customer_id", $this->customer_id);
        $this->db->where("assets.module", $module);
        return $this->db->order_by('assets.created_on', 'DESC');
        print_r($this->db->error() );die;
    }

    public function setAssetDatafiles($asset_id, $module, $uploaded_row=0, $accepted_row=0, $result_csv="")
    {
       $data_assets_datafiles["asset_id"] = $asset_id ;
       $data_assets_datafiles["module"] = $module ;
       $data_assets_datafiles["uploaded_row"] = $uploaded_row ;
       $data_assets_datafiles["accepted_row"] = $accepted_row ;
       $data_assets_datafiles["result_csv"] = $result_csv ;
       $chk = $this->db->insert("asset_datafiles", $data_assets_datafiles);
        if ($chk > 0) {
         return $this->db->insert_id() ;
        } 
        else {
         return $this->db->error();
        }
    }
    
    public function updateAssetDatafiles($asset_id, $module, $uploaded_row, $accepted_row, $result_csv)
    {
       $data_assets_datafiles["uploaded_row"] = $uploaded_row ;
       $data_assets_datafiles["accepted_row"] = $accepted_row ;
       $data_assets_datafiles["result_csv"] = $result_csv ;
       $chk = $this->db->where("asset_id",$asset_id)
                        ->where("module",$module)
                        ->update("asset_datafiles", $data_assets_datafiles);
        if ($chk > 0) {
         return $this->db->insert_id() ;
        } 
        else {
         return $this->db->error();
        }
    }
}