<?php

class Cron_model extends CI_Model
{



public function getAll()
{
   $this->db->select("*");
    return  $this->db->from("cron");
}

}

?>
