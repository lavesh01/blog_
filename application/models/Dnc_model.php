<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dnc_model extends CI_Model {

	public function get_numberdnc($value) {
		return  $this->db->select("id")->get_where('dnc_numbers',array('customer_id'=>$this->customer_id, 'contactno'=> $value))->num_rows();
		/*if ($q->num_rows() > 0 ) {
			return $q->result()[0]->id;
		}
		else {
			return 0;
		}*/
	}
	
	public function if_dnc($value,$type) {
		return $this->db->select("*")->get_where('dnc',array('customer_id'=>$this->customer_id,'id_or_number' => $value,"dnc_type"=>$type ))->num_rows();
		/*if ($q->num_rows() > 0 ) {
			return $q->result()[0]->id;
		}
		else {
			return 0;
		}*/
	}

	public function getCount($type) {
		$q = $this->db->select("1")->get_where('dnc',array('customer_id'=>$this->customer_id,"dnc_type"=>$type ));
		return $q->num_rows();
	}
	
    public function search_dnc($value,$type)
	{
		$this->load->model('Prospects_model');
		$this->load->model('Company_model');
		
			if ($type == "Prospect") {
				
				$id = $this->Prospects_model->isEmailExists($value);
				if ($id) {
					return $this->if_dnc($id,1);
				}
				else
				{
					return 0;
				}
			}
			if ($type == "Number")
			{	
				return $this->get_numberdnc($value);
			}
			if ($type == "Company")
			{ 
				$id = $this->Company_model->isCompanyNameExists($value);
				if ($id) {
					return $this->if_dnc($id,3);
				}
				else
				{
					return 0;
				}
			}
			
			return 1000;
	}


	public function add_dnc($value,$type,$vid="")
	{
		$error_message ="";
		$id = "";
		if (empty($value) || empty($type)) {
			$error_message = "value or tye is missing";
		}
		else{
			if ($type = "Prospect") {
				if ($vid == "")
				{
					$id = $this->Prospects_model->isEmailExists($value);
				}
				else {
					$id = $vid;
				}
				if ($id) {

					if($this->if_dnc($id,1) == 0)
					{
						$Result = $this->db->insert("dnc", array('id_or_number' => $id,"dnc_type"=>1, "customer_id" => $this->customer_id ));
						$error_message = "DNC Added";
					}
					else {
						$error_message = "Already in DNC";
					}
				}
				else
				{
					$this->db->insert("prospects", array('dnc' => 1, 'email_id' => $value, "customer_id" => $this->customer_id ));
					$pid = $this->db->insert_id();
					$Result = $this->db->insert("dnc", array('id_or_number' => $pid,"dnc_type"=>1, "customer_id" => $this->customer_id ));
					$error_message = "Added to prospect, then to DNC ";
				}
			}
			elseif ($type = "Number")
			{
				$id = $this->get_numberdnc($value);
				if ($id != 0) {
					$error_message = "Already in DNC ";
				}
				else
				{
					$this->db->insert("dnc_numbers", array('contactno' => $value, "customer_id" => $this->customer_id ));
					$nid = $this->db->insert_id();
					$Result = $this->db->insert("dnc", array('id_or_number' => $nid,"dnc_type"=>2, "customer_id" => $this->customer_id ));
					$error_message = "Added to DNC ";
				}
			}
			elseif ($type = "Company")
			{
				if ($id == "")
				{
					$id = $this->Company_model->isCompanyNameExists($value);
				}
				else {
					$id = $vid;
				}
				if ($id) {
					if($this->if_dnc($id,3) == 0)
					{
						$Result = $this->db->insert("dnc", array('id_or_number' => $id,"dnc_type"=>3, "customer_id" => $this->customer_id ));
						$error_message = "DNC Added";
					}
					else {
						$error_message = "Already in DNC";
					}
				}
				else
				{
					$this->db->insert("companies", array('name' => $value, "customer_id" => $this->customer_id ));
					$cid = $this->db->insert_id();
					$Result = $this->db->insert("dnc", array('id_or_number' => $cid,"dnc_type"=>3, "customer_id" => $this->customer_id ));
					$error_message = "Added to prospect, then to DNC ";
				}
			}
			else{
				$error_message .= "Type value is not correct";
			}
		}
		return $error_message;

	}
	

}