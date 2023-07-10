<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//include_once(FCPATH.'system/core/MY_Controller.php');
class Agent extends Admin_Controller   {

public function __construct() {
       parent::__construct();
		
		$this->load->model("Campaign_model");
        $this->load->model("Udc_model");
        $this->load->model("Prospects_model");
	$this->load->model("Lead_model");
	$this->load->model("Assets_model");
	$this->load->model("User_Access_Group_model");
	$this->mybreadcrumb->add('My Campaigns', site_url().'campaign/mycampaignlist' );
		if (!$this->check_permission('agent','',true)) {
			echo $this->ajax__response_data_preperation("Access Required","You don't have permission!!","error");
			return false;
		}
       
	

}


	public function manual($id="",$prospect_id="",$lead="")
	{
		$data["title"] = "Lead Auto Select";
		if($id=="")
		{
			$data["message"] = "No Campaign Selected";
			$this->load_view("prospects/message",$data,'operation/sidebar/sidebar');
         return false;
		}
		


		$this->mybreadcrumb->add('Auto', site_url().'Agent/index/'.$id );
		

		$data["title"] = 'Manual Lead Dail';
			 $data["campaign_id"]= $id;
			 $data["prospect_id"]= $prospect_id;
			 $data["lead_id"]= $lead;
		$campaign_data = $this->Campaign_model->getCampaign($id);
		if ($campaign_data != false) 
		{
		   if ($campaign_data[0]["status"] != 1) {
		   	$this->load_view("prospects/campaignnotlive",$data,'operation/sidebar/sidebar');
	              return false;
		   }
		   if ($this->Lead_model->getLeadStatus($lead,9) > 0) {
		              $this->load_view("prospects/inpreqa",$data,'operation/sidebar/sidebar');
		              return false;
		   }
		   $group_access = $this->User_Access_Group_model->myCampaign("agent", $id)->get()->result_array();
		   if (!$group_access) {
				$this->load_view("prospects/nogroupaccess",$data,'operation/sidebar/sidebar');
	         return false;
			}
		   

		   $data['campaign_data'] =$campaign_data[0];
		   	 
		   $data["decription"] = 'decription';
		   $data["title"] = "Campaign : ". $data['campaign_data']["campaign_name"];

		    $data["js"] = [ 
		    	/*site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/forms/select/select2.full.min.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/extensions/jquery.steps.min.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/pickers/dateTime/moment-with-locales.min.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/pickers/daterange/daterangepicker.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/editors/tinymce/tinymce.min.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/extensions/dropzone.min.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/ui/prism.min.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/formbuilder/bootstrap-formform.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/formbuilder/formatter.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/formbuilder/jsonlint.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assets/vendors/js/formbuilder/underscore-min.js",
						site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/js/vendors/taggingJS/tagging.min.js",
						*/
		    				site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/agent/agent.manual.js",
		    				site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/cdr/mycdr.js",
		    				site_url()."resources/phone/scripts/moment.js/moment.min.js",
		    				site_url()."resources/phone/scripts/SIP.js/sip.min.js",
		    				//site_url()."resources/phone/scripts/config.js",
		    				//site_url()."resources/phone/scripts/app.js"
						];
			$data["css"] = [ /*site_url().'resources/themes/'.$this->theme_selected_template.'/assets/vendors/css/forms/selects/select2.min.css',
						site_url().'resources/themes/'.$this->theme_selected_template.'/assets/vendors/css/pickers/daterange/daterangepicker.css',
						site_url().'resources/themes/'.$this->theme_selected_template.'/assetscss/plugins/pickers/daterange/daterange.css',
						site_url().'resources/themes/'.$this->theme_selected_template.'/assetscss/plugins/forms/wizard.css',
						site_url().'resources/themes/'.$this->theme_selected_template.'/assets/vendors/css/editors/summernote.css',
						site_url().'resources/themes/'.$this->theme_selected_template.'/assets/vendors/css/file-uploaders/dropzone.min.css',
						site_url().'resources/themes/'.$this->theme_selected_template.'/assetscss/plugins/file-uploaders/dropzone.css',
						site_url()."resources/themes/".$this->theme_selected_template."/assetsassets/css/vendors/taggingJS/tag-basic-style.css",*/
								site_url()."resources/phone/css/ctxSip.css"

						];
		    $data["script"] = $campaign_data[0]["script"];
		    //$data["pacing"] = $this->Campaign_model->getCampaignPacing($id);
		    //$data["extSupp"] = $this->Campaign_model->getCampaignExternalSupp($id);
		    //$data["getAssets"] = $this->Assets_model->getAssets("Campaign",$id);
		    $data["data_dispositions"]=$this->Udc_model->getAgentDispositions();
		    
		    $data_udc = $this->Udc_model->cd_common($id,'NoAll');
		    $data = array_merge($data, $data_udc);
		    $data["total_qualified_lead"]=$this->Campaign_model->getTotalCampQualifiedLeadsCount($id);
		    $data["getAvailabletocall"]=$this->Campaign_model->getAvailabletocall($id);
		    $data["disposed_lead"]=$this->Campaign_model->getTotalDisposedLeadsCount($id);
		    $data["disqualified_lead"]=$this->Campaign_model->getdisqualifiedLeads($id);
		    $data["otherColumns"] = $this->Prospects_model->getallenabledotherColumn();
		    $data["set_mandate_col"] = $this->Campaign_model->getCampaignMandateColumnlive($id);
		    $this->load_view("prospects/prospect_partial",$data,'operation/sidebar/sidebar');
		}
		else{

		}
	}

	public function index($id="",$leadid="")
    {
    	  $data["campaign_id"] = $id;
    		$data["direct_landed_lead_id"] = $leadid;
        $data["title"] = "Lead Auto Select";
        $data["pagetype"] = "agent";
        if($id=="")
        {
            $data["message"] = "No Campaign Selected";
            $this->load_view("prospects/message",$data,'operation/sidebar/sidebar');
         return false;
        }
        $this->mybreadcrumb->add('Manual', site_url().'Agent/manual/' . $id );
        

        
        $group_access = $this->User_Access_Group_model->myCampaign("agent", $id)->get()->result_array();
       if (!$group_access) {
            $data["message"] = "No Access To Campaign";
            $this->load_view("prospects/message",$data,'operation/sidebar/sidebar');
         return false;
        }
   
        $campaign_data = $this->Campaign_model->getCampaign($id);
        if ($campaign_data[0]["status"] != 1) {
	   	$this->load_view("prospects/campaignnotlive",$data,'operation/sidebar/sidebar');
              return false;
	   }
	   $data["can_edit_pk_value"] = false;//
        $data['campaign_data'] =$campaign_data[0];
        $data['campaign_id'] = $id;
        $data['direct_landed_lead_id'] = $leadid;
        $data["css"]  = [];
        $data["js"] = [ 
              site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/agent/auto.js",
          site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/prospect/details.js",
          site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/agent/autonextlead.js",
          site_url()."resources/themes/".$this->theme_selected_template."/assets/custom/js/cdr/mycdr.js",
            ];

        /// change for pagetype and dailer 
        if (1==1) {
        	$plivodatacss = [
                              site_url()."resources/themes/".$this->theme_selected_template."/assets/".'/vendors/plivo/assets/css/notify.css',
                            site_url()."resources/themes/".$this->theme_selected_template."/assets/".'/vendors/plivo/assets/css/intlTelInput.css',
                            site_url()."resources/themes/".$this->theme_selected_template."/assets/".'/vendors/plivo/assets/css/newstyle.css',
                        ];
        	$plivodatajs = [           

                        "https://cdn.plivo.com/sdk/browser/v2/plivo.min.js",
                        site_url()."resources/themes/".$this->theme_selected_template."/assets/".'/vendors/plivo/assets/lib/notify.js',
                        site_url()."resources/themes/".$this->theme_selected_template."/assets/".'/vendors/plivo/assets/lib/intlTelInput.min.js',
                        site_url()."resources/themes/".$this->theme_selected_template."/assets/".'/vendors/plivo/assets/js/utils.js',
                        site_url()."resources/themes/".$this->theme_selected_template."/assets/".'/vendors/plivo/assets/js/customclient.js',
                        site_url()."resources/themes/".$this->theme_selected_template."/assets/"."/custom/js/dailers/plivo/plivo.js"
                    ];

             $data["js"] = array_merge($data["js"],$plivodatajs);
             $data["css"] = array_merge($data["css"],$plivodatacss);
        }

        // webtrc
         if (1==1) {
         	// code...
         	$webrtcjs = [site_url()."resources/phone/scripts/SIP.js/sip.min.js",
	    				site_url()."resources/phone/scripts/config.js",
	    				site_url()."resources/phone/scripts/app.js"
	    			];
	    	$webrtccss = [site_url()."resources/phone/css/ctxSip.css"];
	    	$data["js"] = array_merge($data["js"],$webrtcjs);
            $data["css"] = array_merge($data["css"],$webrtccss);
	    	
         }

        $data["oc"] = $this->Prospects_model->getallotherColumnEnabledWithoutValue($id);

	      $data_udc = $this->Udc_model->cd_common($id,'NoAll');
        $data["script"] = $data_udc["campaign_data"]["script"];
		    $data = array_merge($data, $data_udc);
		    $data["total_qualified_lead"]=$this->Campaign_model->getTotalCampQualifiedLeadsCount($id);
		    $data["getAvailabletocall"]=$this->Campaign_model->getAvailabletocall($id);
		    $data["disposed_lead"]=$this->Campaign_model->getTotalDisposedLeadsCount($id);
		    $data["disqualified_lead"]=$this->Campaign_model->getdisqualifiedLeads($id);
		    $data["otherColumns"] = $this->Prospects_model->getallenabledotherColumn();
		    $data["data_dispositions"]=$this->Udc_model->getAgentDispositions();

        $this->load_view('prospecting/ajaxdetailsview',$data);        
    }

	public function auto($id="",$direct_landed_lead_id="")
	{
	   $group_access = $this->User_Access_Group_model->myCampaign("agent", $id)->get()->result_array();
       if (!$group_access) {
            $data["message"] = "No Access To Campaign";
            $this->load_view("prospects/message",$data,'operation/sidebar/sidebar');
         return false;
        }
   
        $campaign_data = $this->Campaign_model->getCampaign($id);
        if ($campaign_data[0]["status"] != 1) {
	   	$this->load_view("prospects/campaignnotlive",[]);
              return false;
	   }
		$nextlead = $this->Lead_model->assignNextleadToAgentAuto($id,$direct_landed_lead_id);
		if (!$nextlead) {
			$data["message"] = "No Lead available for calling. Please use manual dailer.";
			$this->load_view("prospects/message",$data,'operation/sidebar/sidebar');
			return false;
		}
		if ($nextlead == 2) {
			$data["message"] = "This Lead is not available for calling. Please check status of this Lead and then try again;";
			$this->load_view("prospects/message",$data,'operation/sidebar/sidebar');
			return false;
		}

		$nextlead  = $nextlead[0];
		$data["id"] = $id;
		
		$data["prospect_id"] = $nextlead["prospect_id"];
		$data["pprospect_id"] = $this->encrypt->encode($nextlead["prospect_id"]);
		$data["ptable"] = $this->encrypt->encode('prospects');
		$data["otherColumnstable"] = $this->encrypt->encode('prospect_other_info');
		$data["ctable"] = $this->encrypt->encode('companies');
		$data["stable"] = $this->encrypt->encode('bf_prospect_social_links');
		$data["pk_name"] = $this->encrypt->encode('id');
		$data["pk_sname"] = $this->encrypt->encode('prospect_id');
		$data["lead_id"] =  $nextlead["id"];
		$data["callbackdate"] =  $nextlead["callback"];
	    $d = $this->Prospects_model->details($nextlead["prospect_id"],"prospects")->get();
	    if ($d->num_rows() > 0) {
    	$data["userData"] = [];
    	foreach ($d->result_array()[0] as $key => $value) {
    	 	$data["userData"][$key] = array('name'=>$this->encrypt->encode($key),'text'=> $value);
    	} 
    	$data["ccompany_id"] = $this->encrypt->encode($id);
    	$data["oc"] = $this->Prospects_model->getallotherColumnEnabled($data["prospect_id"]);
    	echo $this->ajax__response_data_preperation("","","success" ,$data);
    }
	}

	public function updaterecord()
	{
		$this->updaterecord();
	}

	public function gethistory(){
		$input = $this->input->post();
		if (isset($input["prospect_id"]) && !empty($input["prospect_id"])) {
			$this->load->model('History_model');
			$data["history"] = $this->History_model->prospects_history(['bf_prospects','bf_prospects_technology','bf_prospect_other_info','bf_prospect_social_links'],$input["prospect_id"]);
			echo $this->ajax__response_data_preperation("","","success" ,$data);
		}
		
	}

}
