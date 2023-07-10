<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ExpenseModel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    // Insert a new expense into the database
    public function insert($data) {
        if ($this->db->insert('expenses', $data)) {
           return $this->db->insert_id();
        }
        else{
            return $this->db->error()["message"];
        }
        
    }

    // Update an existing expense in the database
    public function update($id, $data) {
        $this->db->where('id', $id);
        $this->db->where('customer_id', $this->customer_id);
        return $this->db->update('expenses', $data);
    }

    // Delete an expense from the database
    public function delete($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        return $this->db->delete('expenses');
    }

    // Retrieve a single expense by ID
    public function get_expense($id) {
        $this->db->where('id', $id);$this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('expenses');
        return $query->row();
    }

    // Retrieve all expenses
    public function get_expenses() {
        $this->db->where('customer_id', $this->customer_id);
        $query = $this->db->get('expenses');
        return $query->result();
    }

    public function get_myexpenses() {
        $this->db->select('expenses.id, expenses.status , projects.name as project,categories.name as category, expenses.amount, expenses.date,expenses.description  ');
        $this->db->from('expenses');
        $this->db->join('projects','projects.id = expenses.project_id');
        $this->db->join('categories','categories.id = expenses.category_id');
        $this->db->where('expenses.customer_id', $this->customer_id);
         $this->db->where('expenses.created_by', $this->user_id);
         return $this->db->order_by("id","desc");
        // $query->result_array();
    }

    // Insert expense-tag relationship
    public function insert_expense_tag($data) {
        return $this->db->insert('expense_tags', $data);
    }

    // Delete expense-tag relationships for a given expense
    public function delete_expense_tags($expense_id) {
        $this->db->where('customer_id', $this->customer_id);
        $this->db->where('expense_id', $expense_id);
        return $this->db->delete('expense_tags');
    }


}
