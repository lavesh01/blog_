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
        $order = $data['order'];
        unset($data['order']);

        if ($this->db->insert('bf_menu1', $data)) {
            $this->update_branch_order($order);
            return 'success';
        } else {
            return 'error';
        }
    }

    public function remove_branch($id)
    {
        $this->db->where('id', $id);
        // $this->db->delete('bf_menu1');
        $this->db->update('bf_menu1', array('is_delete' => 1));
    }

    public function update_branch($data)
    {
        $branch_id = $data['id'];
        unset($data['id']);
        $order = $data['order'];
        unset($data['order']);

        $this->db->where('id', $branch_id);
        $this->db->update('bf_menu1', $data);
        $this->update_branch_order($order);
    }

    private function update_branch_order($order){
        $array_order = explode(',', $order); 
        $ordering = 0;

        foreach ($array_order as $key => $value) { 
            $this->db->set('order',$ordering);   
            $this->db->where('id', $value);
            $this->db->update('bf_menu1');
            $ordering++;
        }
    }






    
    
    // public function getMenus() {
    //     $this->db->select('*');
    //     $this->db->from('bf_menu1');
    //     $query = $this->db->get();
    //     return $query->result();
    // }

    // public function deleteMenu($menuId) {
    //     $this->db->where('m_id', $menuId);
    //     $this->db->delete('bf_menu1');
    // }
    
    
    // public function addMenu($menuName,$menuUrl,$menuType) {
    //     $data = array(
    //         'm_name' => $menuName,
    //         'm_url' => $menuUrl ,
    //         'm_type' => $menuType
    //     );
    //     $this->db->insert('bf_menu1', $data);
        
    //     $this->db->where('m_id', $this->db->insert_id());
    //     $query = $this->db->get('bf_menu1');
    //     return $query->row();
    // }

    // public function addMenuItem($menuId, $menuItemName)
    // {
    //     $data = array(
    //         'm_id' => $menuId,
    //         'm_item_name' => $menuItemName
    //     );
    //     $this->db->insert('bf_menu_item', $data);
    // }

    // public function getMenuItemById($menuId)
    // {
    //     $this->db->where('m_id', $menuId);
    //     $query = $this->db->get('bf_menu_item');

    //     if ($query->num_rows() > 0) {
    //         return $query->row();
    //     }
    //     return null;
    // }
  
}