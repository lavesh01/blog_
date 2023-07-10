<?php

class Multiple_delete_model extends CI_Model
{

 function delete($id)
 {   
 	$this->db->set('deleted', 1);
     $this->db->where('id', $id);
     $this->db->delete('bf_agent_disposition');
 }

public function deleteContactData($id)
{
	$this->db->where('id', $id);
    $this->db->delete('sale_client_details');
     
}


public function deleteMyCampaignData($id)
{
   $this->db->where('id', $id);
    $this->db->delete('bf_campaigns');
}

}

?>
