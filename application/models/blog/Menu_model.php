<?php
class Menu_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }


    public function get_menu_by_id($id) {
        $this->db->where('id', $id);
        $this->db->where('is_delete', 0);
        return $this->db->get('bf_menu1')->row_array();
    }
    
    public function getMenuItems()
    {
        $this->db->where('is_delete', 0);

        $query = $this->db->select('*')
                        ->from('bf_menu1')
                        ->order_by('order', 'asc')
                        ->get();

        return $query->result_array();
        
        // return $this->db->select('*')->from('bf_menu1')->order_by('order','asc')->get()->result_array();
    }

    public function save_branch($data)
    {   
        $str_newmenuUIid =  $data['uid'];
        $originalOrderStr = $data['order'];
        unset($data['order']);
        unset($data['id']);
        unset($data['uid']);
        unset($data['ci_csrf_token']);
        
        if ($this->db->insert('bf_menu1', $data)) {
            $menu_id = $this->db->insert_id();
        
            $order = str_replace($str_newmenuUIid, $menu_id, $originalOrderStr);
            $this->update_branch_order($order);
            return $menu_id;
        } else {
            return "error"; //$this->db->error() ;
        }
    }

    public function remove_branch($id)
    {
        $this->db->where('id', $id);
        // $this->db->delete('bf_menu1');
        $this->db->update('bf_menu1', array('is_delete' => 1));
        
        $num_affected_rows = $this->db->affected_rows();

        if ($num_affected_rows > 0) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function update_branch($data)
    {
        $branch_id = $data['id'];
        unset($data['id']);
        $order = $data['order'];
        unset($data['order']);
    
        $this->db->where('id', $branch_id);
        $this->db->update('bf_menu1', $data);

        $num_affected_rows = $this->db->affected_rows();

        if ($num_affected_rows > 0) {
            $this->update_branch_order($order);
            return true; 
        } else {
            return false; 
        } 
    }

    private function update_branch_order($order){
        $array_order = explode(',', $order); 
        $ordering = 0;

        foreach ($array_order as $key => $value) { 
            $ordering++;
            $this->db->set('order',$ordering);   
            $this->db->where('id', $value);
            $this->db->update('bf_menu1');
        }
    }

}