<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sales_model extends CI_Model {

	public function viewSalesLeadList()
	{
		$this->db->select("sale_client_details.id As Actions, sale_client_details.name,
							sale_client_details.business_name as 'Business Name',
							sale_client_details.type_of_contact as 'Salutation',
							sale_client_details.business_phone as Phone, 
							sale_client_details.personal_phone as Mobile,
							sale_client_details.business_email as Email,
							udc_country.name as Country,
							sale_client_details.address as Address,
							sale_client_details.designation  as Designation,
							kanban_boards.title as Status");
		$this->db->from("sale_client_details as sale_client_details");
		$this->db->join("kanban_boards as kanban_boards","kanban_boards.id = sale_client_details.status");
		$this->db->join("udc_country as udc_country","udc_country.id = sale_client_details.Country", "Left");
	    $this->db->where("sale_client_details.created_by",$this->user_id);
        $this->db->where("sale_client_details.customer_id",$this->customer_id);
        $this->db->order_by("sale_client_details.id",'DESC');
       // $this->db->where("kanban_boards.id != 0");
        return $this->db->order_by("isRemoved","asc");
		
	}
	public function viewSalesLeadCount()
	{
	    $this->db->select("*");
		$this->db->from("sale_client_details");
	    $this->db->where("created_by",$this->user_id);
        $this->db->where("customer_id",$this->customer_id);
        $this->db->order_by("isRemoved","asc");
		return $this->db->count_all_results();
	}


	public function viewSalesLeadListManager()
	{
		$this->db->select("sale_client_details.id as 'Actions',
							users.username as 'Lead of',
							sale_client_details.name,
							sale_client_details.business_name as 'Business Name',
							sale_client_details.type_of_contact as 'Contact Type',

							sale_client_details.business_phone as Phone, 

							sale_client_details.personal_phone as Mobile,

							sale_client_details.business_email as Email,

							udc_country.name as Country,

							sale_client_details.address as Address,

							sale_client_details.designation  as Designation,

							kanban_boards.title as Status");

		$this->db->from("sale_client_details as sale_client_details");
        $this->db->join("kanban_boards as kanban_boards","kanban_boards.id = sale_client_details.status");
		$this->db->join("udc_country as udc_country","udc_country.id = sale_client_details.Country", "Left");
	    $this->db->join("users as users", "sale_client_details.created_by = users.id");
        $this->db->where("sale_client_details.customer_id",$this->customer_id);
        return $this->db->order_by("isRemoved","asc");

		
	}
	public function viewSalesLeadCountManager()
	{
	    $this->db->select("*");
		$this->db->from("sale_client_details");
        $this->db->where("customer_id",$this->customer_id);
        $this->db->order_by("isRemoved","asc");
		return $this->db->count_all_results();
	}

public function fetch_state($country_id)
 {
  $this->db->where('customer_id', $this->customer_id);
  $this->db->where('deleted', '0');
  $query = $this->db->get('bf_udc_country');
  $output = '<option value="">Select</option>';
  foreach($query->result() as $row)
  {
   $output .= '<option value="'.$row->name.'">'.$row->name.'</option>';
  }
  return $output;
 }


 public function getCampaignDetails($campaign_id)
 {
     $this->db->from('bf_campaigns');
        $this->db->where('id',$campaign_id);
        $query = $this->db->get();
  
        return $query->row();
 }

  //Campaign Names for client rejection 
 public function getCampaignNameForClientRejection($id)
 { 

   $this->db->select('campaigns.id ,
									campaigns.campaign_name ,
									campaign_grade.name as compaign_grade,
									campaign_type.name as campaign_type,
									campaigns.start_date ,
									campaigns.end_date ,
									campaigns.total_lead,
									extended_end_date,
									campaigns.status ,
									campaigns.suppression_type,
									campaigns.suppression_days,
									campaigns.script,
									users.username as created_by,
									campaigns.created_on,
									m.username as modified_by,
									campaigns.modified_on
									',FALSE); //id, campaign_name, campaign_type_id, start_date, end_date, total_lead,status'
	    $this->db->from("campaigns");
		$this->db->join('campaign_grade', 'campaign_grade.id = campaigns.campaign_grade_id','left');
		$this->db->join('campaign_type', 'campaign_type.id = campaigns.campaign_type_id','left');
		$this->db->join('users ', 'campaigns.created_by = users.id','left');
		$this->db->join('users AS m', 'campaigns.modified_by = m.id','left');
		$this->db->where('campaigns.customer_id', $this->customer_id);
		$this->db->where('campaigns.id', $id);
		return $this->db->get()->result_array();

 }


 public function getBusinessDetails($business_id)
 {
 	   $this->db->from('bf_sale_client_details');
        $this->db->where('id',$business_id);
        $query = $this->db->get();
        return $query->row();
 }


 
 public function fetch_subdispositionsManual($agent_disposition)
 {
  $output ='';
  $agent_disposition= explode(",", trim($agent_disposition,','));
  $this->db->where_in('agent_disposition_id', $agent_disposition);
  $this->db->where('deleted', '0');
  $this->db->where('customer_id', $this->customer_id);
  $this->db->order_by('name', 'ASC');
  $query = $this->db->get('bf_agent_sub_disposition');
  foreach($query->result() as $row)
  {
   $output .= '<option value="'.$row->id.'">'.$row->name.'</option>';
  }
  return $output;
 } 

}		