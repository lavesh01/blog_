<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Suppression_model extends CI_Model {

	public $suppression_db ;
    public function __construct()
    {
        parent::__construct();
        $this->suppression_db = $this->load->database('suppression', TRUE);
    }

    public function create_table($campaign_id)
    {
  		$table_name = "supp_" . $campaign_id ;
  		$chk = $this->suppression_db->query("create table IF NOT EXISTS " .$table_name." ( id int not null AUTO_INCREMENT primary key, txt text , batch varchar(50))" );
  		if ($chk) {
  			return 1;
  		}
  		else
  		{
  			return 0;
  		}

    }

	public function upload_bulk_csv($table_name, $file_path, $batch)
	{
	   //$file_path = str_replace('\\', '/', $file_path);
	   $this->suppression_db->query("LOAD DATA LOCAL INFILE '".$file_path."' 
	   INTO TABLE supp_".$table_name."
	   FIELDS TERMINATED BY ','
	   LINES TERMINATED BY '\\n' 
	   IGNORE 1 LINES
	   (@row)
	   SET txt = TRIM(@row), batch = '".$batch."'
	 	");
	   $chk = $this->suppression_db->error();
	   if ($chk["code"] =='00000') {
	   	return 1;
	   }
	   else
	   {
	   	return $chk["message"];
	   }
	}

	public function getCount($table_name, $batch)
	{
		$this->suppression_db->where('batch',$batch);
		return $this->suppression_db->from("supp_".$table_name)->count_all_results();
	}

	public function deleteCampaignExternalSupp($campaign_id,$batch, $table_name)
    {
        $this->suppression_db->where("batch", $batch);
        $this->suppression_db->delete("supp_".$table_name);
    }

    public function IsEmailExistSuppression($table_name, $value)
    {
    	$this->suppression_db->like('txt',$value,'both');
		return $this->suppression_db->from("supp_".$table_name)->count_all_results();
    }
}