<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        // Your own constructor code
    }


	public function new_customer_setup($id,$user_id="")
	{
		$this->db->query("insert into bf_prospects_other_info_level (lebel, attribue_name,customer_id,created_by) select lebel, attribue_name,".$id.",".$this->customer_id."   from bf_prospects_other_info_level where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert into bf_mandate_col ( name,col_name	,status,customer_id	,key_name	,ordering	,lebel) select name,col_name	,status,".$id."	,key_name	,ordering	,lebel  from bf_mandate_col  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert into bf_suppression ( customer_id, email) value (".$id.", 1)  ") ;
		$this->db->query("insert into bf_udc_job_level ( name,customer_id) select name,".$id."	 from bf_udc_job_level  where customer_id = 9999999   ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert into bf_udc_job_function ( name,customer_id) select name,".$id."	 from bf_udc_job_function  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert into bf_udc_industry ( name,customer_id) select name,".$id."	 from bf_udc_industry  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert	into bf_udc_revenue ( name,customer_id) select name,".$id." from bf_udc_revenue  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert	into bf_udc_country( name,customer_id)  select name,".$id." from bf_udc_country  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_udc_salutation ( name,customer_id) select name,".$id." from bf_udc_salutation  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_udc_employee_size ( name,customer_id) select name,".$id." from bf_udc_employee_size  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert	into bf_udc_nic_code ( code,customer_id) select code,".$id." from bf_udc_nic_code  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_udc_sic_code ( code,customer_id)  select code,".$id." from bf_udc_sic_code  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_datasource ( datasource,customer_id)  select datasource,".$id." from bf_datasource  where customer_id = 9999999  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_user_designation_points ( designation,points,customer_id) values ('Agent',100,".$id."),('Team Lead',100,".$id."),('Manager',100,".$id."),('Director',100,".$id."),('Management',100,".$id.") ,('Sales Executive',100,".$id.")  ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_agent_disposition ( name,customer_id) values ('Verified',".$id.") ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_agent_sub_disposition ( name,customer_id,agent_disposition_id)  select 'Verified',".$id.", id from bf_agent_disposition  where customer_id = ".$id." and name ='Verified' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_quality_disposition ( name,customer_id) values ('Verified',".$id.") ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_quality_sub_disposition ( name,customer_id,quality_disposition_id)  select 'Verified',".$id.", id from bf_quality_disposition  where customer_id = ".$id." and name ='Verified' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_campaign_grade ( name,customer_id,grade,qualityGrade,cdqaGrade) values ('Demo Campaign Grade',".$id.",100,100,100) ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_campaign_type ( name,customer_id) values ('BANT',".$id."),('HQL',".$id."),('Normal',".$id."),('SQL',".$id."),('Content Syndication',".$id."),('Email',".$id.") ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_kanbanboards_category ( name,customer_id) values ('CRMDevelopment',".$id.") ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_issue','issue', id ,".$id." from bf_kanbanboards_category  where customer_id = ".$id." and name ='CRMDevelopment' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_inpipeline','inpipeline', id ,".$id." from bf_kanbanboards_category  where customer_id = ".$id." and name ='CRMDevelopment' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_wip','wip', id ,".$id." from bf_kanbanboards_category  where customer_id = ".$id." and name ='CRMDevelopment' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_uat','uat', id ,".$id." from bf_kanbanboards_category  where customer_id = ".$id." and name ='CRMDevelopment' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_kanban_boards (order_number, board_id,title, category,customer_id)  select 1,'_done','_done', id ,".$id." from bf_kanbanboards_category  where customer_id = ".$id." and name ='CRMDevelopment' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);

		$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('CRMDevelopment',".$id.",'kanban') ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$id."  ,".$user_id." from bf_campaign_user_group  where customer_id = ".$id." and group_name ='CRMDevelopment' and module='kanban' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);

		$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('Agent Team 1',".$id.",'agent') ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$id."  ,".$user_id." from bf_campaign_user_group  where customer_id = ".$id." and group_name ='Agent Team 1' and module='agent' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);

		$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('quality Team 1',".$id.",'quality') ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$id."  ,".$user_id." from bf_campaign_user_group  where customer_id = ".$id." and group_name ='quality Team 1' and module='quality' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);

		$this->db->query("insert 	into bf_campaign_user_group ( group_name,customer_id, module) values ('cdqa Team 1',".$id.",'cdqa') ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);
		$this->db->query("insert 	into bf_campaign_user (group_id, user_id,customer_id)  select id ,".$id."  ,".$user_id." from bf_campaign_user_group  where customer_id = ".$id." and group_name ='cdqa Team 1' and module='cdqa' ");
		$this->db->query('update bf_customers set setup_status = setup_status + 1 where Customer_id = '. $id);

        $role_data = array( 'role_name' => 'Campaign Managers' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('agent','campaign.manager.view','campaign.manager.edit','campaign.grade.create','campaign.type.create','campaign.manager.create','Companies Detail','cdqa','dnc.index','dnc.Upload','dnc.search','prospects.search','prospects.leadsearch','prospects.exported','prospects.bulkupload','prospects.mandateColumn','prospects.otherColumn','prospects.details','prospects.addLeadToCampaign','quality.audit','campaign.mylist','campaign.data','scraping.zendomainabulkupload')");

        $role_data = array( 'role_name' => 'Agents' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('agent','dnc.index','dnc.Upload','dnc.search','prospects.details','campaign.mylist','mycdr')");

        $role_data = array( 'role_name' => 'Sales Managers' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('agent','campaign.manager.view','campaign.manager.edit','campaign.grade.create','campaign.type.create','campaign.manager.create','Companies Detail','cdqa','dnc.index','dnc.search','prospects.search','prospects.leadsearch','prospects.bulkupload','prospects.mandateColumn','prospects.details','prospects.addLeadToCampaign','quality.audit','sales.kanban','sales.list.view','sales.manager','sales.clientRejection','campaign.group','campaign.mylist','campaign.data','operations.udc.edit','prospects.leadsearch')");

        $role_data = array( 'role_name' => 'Data Agent' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('campaign.manager.view','cdqa','dnc.index','dnc.Upload','dnc.search','prospects.bulkupload')");

        $role_data = array( 'role_name' => 'Admin' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('agent','api','campaign.manager.view','campaign.manager.edit','campaign.grade.create','campaign.type.create','campaign.manager.create','Companies Detail','cdqa','agents_subdsposition.create','dnc.index','dnc.Upload','dnc.search','edm','prospects.search','prospects.leadsearch','prospects.exported','prospects.bulkupload','prospects.dedupSetting','prospects.mandateColumn','prospects.otherColumn','prospects.details','prospects.addLeadToCampaign','quality.audit','sales.kanban','sales.list.view','sales.manager','sales.clientRejection','setting','campaign.group','prospects.allexportedlist','campaign.mylist','campaign.data','operations.udc.edit','leads.exported','prospects.leadsearch','leads.Delete','kanban','mycdr','operations.udc.add','prospects.details.editpkvalues','scraping.prospectsverification','scraping.linkedinextension','scraping.zendomainabulkupload','landingpage')");

        $role_data = array( 'role_name' => 'Campaign Managers 1' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('agent','campaign.manager.view','campaign.manager.edit','campaign.manager.create','cdqa','dnc.index','dnc.Upload','dnc.search','prospects.search','prospects.leadsearch','prospects.exported','prospects.bulkupload','prospects.details','prospects.addLeadToCampaign','quality.audit','campaign.group','campaign.mylist','campaign.data','leads.exported','prospects.leadsearch','mycdr')");

        $role_data = array( 'role_name' => 'Quality' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('dnc.index','dnc.search','prospects.details','quality.audit','campaign.group','campaign.mylist','mycdr')");

        $role_data = array( 'role_name' => 'Scraper' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('scraping.zendomainabulkupload','scraping.prospectsverification','scraping.linkedinextension')");

        $role_data = array( 'role_name' => 'Kanban' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('kanban')");

        $role_data = array( 'role_name' => 'Landing Page' ,'customer_id' =>$id);
        $this->db->insert("bf_roles",$role_data);
        $r_id = $this->db->insert_id();
        $this->db->query("insert into bf_role_permissions (role_id ,permission_id ,customer_id )  
            select ".$r_id.", permission_id ,". $id ."  from bf_permissions  where name in ('landingpage')");
        // final run
        $this->db->query('update bf_customers set setup_status = setup_status + 1, deleted = 0 where Customer_id = '. $id);
        return 1;
	}
	
	
	public function fetch_agentssub_dispositions()
	{
		 $this->db->order_by("name", "ASC");
         $query = $this->db->get("bf_agent_disposition");
         return $query->result();
	}

	public function getUserIdFromUsername($username='')
	{
		if ($username=='') {
			return '';
		}
		$query =  $this->db->select('id')
								->from('bf_users')
								->where('customer_id', $this->customer_id)
								 ->where('username', $username)->get();
		if ($query->num_rows() > 0) 
		{
		 	return $query->result_array()[0]["id"];
		}						 
		else
		{
			return '';
		}

	}	

}


