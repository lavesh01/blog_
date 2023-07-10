<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Edm_model extends CI_Model {

	public function create_campaign($value="") {
		$q = $this->db->select("*")->get_where('email_campaign',array('customer_id'=>$this->customer_id, 'created_by'=> $this->user_id, 'status'=>0, 'deleted'=>0));
		if ($q->num_rows() > 0 ) {
			return $q->result_array()[0]["id"];
		}
		else {
			$data = array('customer_id'=>$this->customer_id, 'created_by'=> $this->user_id, 'status'=>0, 'deleted'=>0);
			if ($this->db->insert("email_campaign",$data)) {
				return $this->db->insert_id();
			}
			else
			{
				return false;
			}
		}
	}

	public function get_campaignbyid($id)
	{
		$q = $this->db->select("*")->get_where('email_campaign',array('customer_id'=>$this->customer_id,  'deleted'=>0,'id'=>$id));
		if ($q->num_rows() > 0 ) {
			return $q->result_array()[0];
		}
		else {
			return false;
		}
	}

	public function get_udc($type, $id)
    {
		$joining_col = "camp_or_list_id";
		$table_name = "bf_email_campaign_datasource";
        if ($type != "") {
           if($type == "1")
           {
           	$col = "list_name";
           	$joining_table = "bf_email_list";
           }
           else if($type == "2")
           {
           	$col = "campaign_name";
           	$joining_table = "bf_campaigns";
           }
           else{
           	return false;
           }
        }
        else
        {
            return false;
        }

        if (isset($table_name) && !empty($table_name) && isset($id) && !empty($id)) {
            $this->db->select('b.id, b.'.$col.' as text');
            $this->db->from($table_name . " a");
            $this->db->join($joining_table . ' b', 'a.'.$joining_col.' = b.id');
            $this->db->where("b.customer_id", $this->customer_id);
            $this->db->where("a.type", $type);
            return $this->db->where("email_campaign_id", $id)->get()->result();

        }
    }

    public function savedeleteselectedCampaignNList($type)
    {

        $joining_col = "camp_or_list_id";
		$table_name = "bf_email_campaign_datasource";
        if ($type != "") {
           if($type == "1")
           {
           	$col = "list_name";
           	$joining_table = "bf_email_list";
           }
           else if($type == "2")
           {
           	$col = "campaign_name";
           	$joining_table = "bf_campaigns";
           }
           else{
           	return false;
           }
        }
        else
        {
            return false;
        }

        if ($this->input->post()) {
            $input = $this->input->post();
            $id = $input["id"];

            $campaign_id = $input["campaign_id"];
            $select = $input["select"];

            if (isset($id) && !empty($id) && isset($campaign_id) && !empty($campaign_id) && isset($select) && !empty($select)) {
               
                if ($select == "yes") {
                    $insert_data = array("email_campaign_id" =>$campaign_id, $joining_col => $id, 'type' => $type, 'customer_id' =>$this->customer_id,'created_by'=>$this->user_id);
                    $chk = $this->db->insert($table_name, $insert_data);
                    if ($chk) {
                       return 1;
                    }
                    else
                    {
                        return $this->db->error();
                    }
                }
                else if ($select == "no") {
                    //echo $joining_col .'  '. $id; die;
                    $this->db->where("camp_or_list_id", $id);
                    $this->db->where("type", $type);
                    $this->db->where("customer_id", $this->customer_id);
                    $this->db->where('email_campaign_id', $campaign_id);
                    $chk =$this->db->delete($table_name);
                    if ($chk) {
                        $this->db->where("email_campaign_datasource_d", $id);
                        $this->db->where("type", $type);
                        $this->db->where("customer_id", $this->customer_id);
                        $this->db->where('email_campaign_id', $campaign_id);
                        $this->db->delete('email_sending_prospects');
                       return $this->db->error();
                    }
                    else
                    {
                        return $this->db->error();
                    }
                }
            }
            else
            {
                return "inputs required";
            }
        }
    }

    public function html_template($id)
	{

		if ($this->input->post() && $id !="") {
	        $input = $this->input->post();
	        if (isset($input["campaign_script"]) && !empty($input["campaign_script"])) 
	        {
	            $this->db->where('customer_id',$this->customer_id);
	            $this->db->set('modified_by',$this->user_id);	
				$this->db->where('id',$id);
				$this->db->set('html_template',$input["campaign_script"]);
				$this->db->update('email_campaign');
				return true;
            }
       	}
    }

    public function campaignlist()
    {

        $this->db->select("email_campaign.id action, email_campaign.name,email_campaign.status");
        $this->db->select("(select count(1) from bf_email_sending_prospects where bf_email_sending_prospects.email_campaign_id = email_campaign.id) as count ",false);
        $this->db->select("(select count(1) from bf_email_sending_prospects where bf_email_sending_prospects.email_campaign_id = email_campaign.id and bf_email_sending_prospects.status = 2 ) as sent ",false);
        $this->db->select("(select count(1) from bf_email_sending_prospects where bf_email_sending_prospects.email_campaign_id = email_campaign.id and bf_email_sending_prospects.status = 3 ) as open ",false);
        $this->db->select("(select count(1) from bf_email_sending_prospects where bf_email_sending_prospects.email_campaign_id = email_campaign.id and bf_email_sending_prospects.status = 4 ) as click ",false);
        $this->db->where('customer_id',$this->customer_id);
        $this->db->order_by('email_campaign.created_on','asc');
        return $this->db->from('email_campaign email_campaign');   
           
    }

    public function datasynccampaign($id)
    {
        $db_debug = $this->db->db_debug; 
        $this->db->db_debug = FALSE; 
        $this->db->query("INSERT INTO bf_email_sending_prospects( fname, lname, email, email_campaign_id, email_campaign_datasource_d, customer_id ) SELECT f_name, l_name, email, email_campaign_id, id, customer_id FROM ( SELECT c.f_name, c.l_name, c.email, b.email_campaign_id, b.id, a.customer_id FROM bf_email_campaign a JOIN bf_email_campaign_datasource b ON a.id = b.email_campaign_id AND b.camp_or_list_id = 1 AND a.status = 1 and a.id=".$id." JOIN bf_email_list_prospect c ON b.id = c.list_id UNION SELECT d.first_name, d.last_name, d.email_id, b.camp_or_list_id, b.id, a.customer_id FROM bf_email_campaign a JOIN bf_email_campaign_datasource b ON a.id = b.email_campaign_id AND b.type = 2 AND a.status = 1 JOIN bf_leads c ON b.camp_or_list_id = c.campaign_id JOIN bf_prospects d ON c.prospect_id = d.id ) AS main WHERE NOT EXISTS( SELECT b.email_id FROM bf_dnc a JOIN bf_prospects b ON a.id_or_number = b.id AND a.dnc_type IN(1, 2) AND b.email_id = main.email ) AND NOT EXISTS( SELECT X.email FROM bf_email_sending_prospects X WHERE X.email = main.email and X.email_campaign_id = ".$id." )");
        $this->db->db_debug = $db_debug;
        return $this->campaignlist()->where('email_campaign.id', $id);

    }
}