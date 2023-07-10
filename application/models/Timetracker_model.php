<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Timetracker_model extends CI_Model {

	public function get_current_task() {
		$q = $this->db->order_by('id','DESC')->get_where('time_tracker',array('status'=>0,'created_by'=>$this->user_id)) ;
		if ($q->num_rows() > 0) {
			return $q->result_array()[0];
		}
		return 0;
	}
	public function new_task($task) {
		$this->load->helper('date');
		$data = array('status' => 1, 'endtime' => date('Y-m-d H:i:s'));
		$this->db->where('created_by',$this->user_id);
		$this->db->where('status',0);
		$this->db->update('time_tracker',$data);
		if ($task != "") {
			
			if ($task == "8") {
				$data = array('status' => 1, 'endtime' => date('Y-m-d H:i:s'), 'created_by' => $this->user_id, 'task'=>$task, 'customer_id' => $this->customer_id);
			}
			else
			{
				$data = array('status' => 0, 'created_by' => $this->user_id, 'task'=>$task, 'customer_id' => $this->customer_id);
			}
			
			$this->db->insert('time_tracker',$data);
			return $this->db->insert_id();
		}
	}

	//SELECT  * FROM `bf_time_tracker` WHERE  (CAST(`created_on` AS DATE)  = CURDATE() 
		
 

	public function todays_total_time() {
		$q = $this->db->select('sum(TIMESTAMPDIFF(SECOND, `created_on`, `endtime` )) as t', false)
			->from('time_tracker')
			->where('created_by',$this->user_id)
			->where('CAST(`created_on` AS DATE) = ','CURDATE()',false)->get();
		return $q->result_array()[0];
	}

	public function todays_total_time_all_days() {
		$q = $this->db->select('CAST(`created_on` AS DATE) as d,sum(TIMESTAMPDIFF(SECOND, `created_on`, `endtime` )) as t', false)
			->from('time_tracker')
			->where('created_by',$this->user_id)
			->group_by("CAST(`created_on` AS DATE)",false)->order_by('created_on','desc')->limit(31)->get();
		if ($q->num_rows() > 0) {
			return $q->result_array();
		}
		return [];
	}

	public function day_all_tasks($date) {
		return $q = $this->db->select('id , task, created_on as start_time, endtime as end_time, SEC_TO_TIME(TIMESTAMPDIFF(SECOND, `created_on`, `endtime` )) as time_spend_in_min', false)
			->from('time_tracker')
			->where('created_by',$this->user_id)
			->where('CAST(`created_on` AS DATE)  =',$date)->order_by('created_on','desc');
		
	}
}