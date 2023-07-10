var id = "";
$(document).ready(function() {

	id = $("#campaign_id").val();
	var direct_landed_lead_id = $("#direct_landed_lead_id").val();
	$("#next_lead_reload").click(function (argument) {
	   nextleadpage(id);
	});
	nextleadpage(id,direct_landed_lead_id);
	$(".campaignscript").append("<pre style='min-height: 800px;'>" + globalpagejson.script + "</pre>");

});

var action_assignedleads = [
 		{ "class":"new_tab_open_lead_calling","icon":"fa fa-phone icon-gradient bg-happy-fisher", "id":"new_tab_open_lead_calling", "href":site_url + 'Agent/index/' + $('#campaign_id').val()+"/","title":"Open In New Tab For Calling"},
        { "class":"unassign_user_lead","icon":"fa fa-recycle  icon-gradient bg-ripe-malin", "id":"unassign_user_lead", "href":"#","title":"Unassign - Move it Calling Pool."},
        { "class":"delete_users","icon":"fa fa-list icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Users"},    
      ];
var aocolumnDefs_assignedleads =  [
               {    
                    "aTargets": [1],
                    //"mData": "first_name",
                    "mRender": function (data, type, full) {
                    	
                       if ( data == "" || data == null || data === undefined) {
                        return '<input type="checkbox" class="skipped_checkox" data-toggle="toggle" data-on="Skipped" data-off="InQueue" data-offstyle="success" data-onstyle="danger" data-size="mini">';
                       }
                       else {
                       	return '<input type="checkbox" checked class="skipped_checkox"   data-toggle="toggle"  data-on="Skipped" data-off="InQueue" data-offstyle="success" data-onstyle="danger" data-size="mini">';
                       }
                    }
                }
            ];


function nextleadpage(id,direct_landed_lead_id="")
{	$("#timelinetab").attr("data-clicked",0);
	$("#tab-71").html("");
	block_ajax_ui('#main-content-page');
	jQuery.ajax({
	    type: "POST",
	    url: site_url+"Agent/auto/"+id+"/"+direct_landed_lead_id,
	    dataType: "json",
	    success: function(posted) {
	    	
	        if(posted != false) {
	        	if (posted.hasOwnProperty('html')) {
	        		var msg = '<div id="msg>'  + posted.html + '</div>';
	        		$("#main-content-page").append(msg)
	        		$("#user-profile").hide()
	        		$("#msg").show()
	        	}
	        	else {
	        		$("#user-profile").show()
	        		$("#msg").hide()
	        	
	        		

		        	fillatt(posted.prospect_id,'#prospect_id', 'val');
		        	fillatt(posted.lead_id,'#lead_id', 'val');
		        	fillatt(posted.userData.company_id.text,'#company_id', 'val');
		        	fillatt(posted.userData.Company.text,'.company', 'text');
					fillatt(posted.userData.Employee.text,'.Employee', 'text');
					fillatt(posted.userData.Industry.text,'.Industry', 'text');
					fillatt(posted.userData.Revenue.text,'.Revenue', 'text');

					var eurl = site_url+'Prospects/updaterecord';
					var param={"table":posted.ptable, "type":"text",
								"mode":"inline","pk":posted.pprospect_id,
								"url":eurl, "pk_name": posted.pk_name,
								"id":posted.pprospect_id,
							};
					

					fillatt(posted.userData.first_name.text,'.first_name', 'text');
					fillatt(posted.userData.last_name.text,'.last_name', 'text');
					fillatt(posted.userData.title.text,'.title', 'editable',mergeparameditable(param,posted.userData.title));
					fillatt(posted.userData.address_1.text,'.address_1', 'editable',mergeparameditable(param,posted.userData.address_1));
					fillatt(posted.userData.address_2.text,'.address_2', 'editable',mergeparameditable(param,posted.userData.address_2));
					fillatt(posted.userData.city.text,'.city', 'editable',mergeparameditable(param,posted.userData.city));
					fillatt(posted.userData.direct_number.text,'.direct_number', 'editable',mergeparameditable(param,posted.userData.direct_number));
					fillatt(posted.userData.domain_name.text,'.domain_name', 'editable',mergeparameditable(param,posted.userData.domain_name));
					fillatt(posted.userData.email_id.text,'.email_id', 'editable',mergeparameditable(param,posted.userData.email_id));
					//fillatt(posted.userData.job_info.text,'.job_info', 'editable',mergeparameditable(param,posted.userData.job_info));
					fillatt(posted.userData.middle_name.text,'.middle_name', 'editable',mergeparameditable(param,posted.userData.middle_name));
					fillatt(posted.userData.mobile_number.text,'.mobile_number', 'editable',mergeparameditable(param,posted.userData.mobile_number));
					fillatt(posted.userData.office_number.text,'.office_number', 'editable',mergeparameditable(param,posted.userData.office_number));
					fillatt(posted.userData.prospect_technology.text,'.prospect_technology', 'editable',mergeparameditable(param,posted.userData.prospect_technology));
					fillatt(posted.userData.zip.text,'.zip', 'editable',mergeparameditable(param,posted.userData.zip));
					fillatt(posted.userData.src.text,'.src', 'editable',mergeparameditable(param,posted.userData.src));
					

					var aa = mergeparameditable(param,posted.userData.job_functions_id);
					aa.adata = udc_function;
					fillatt(posted.userData.job_functions_id.text,'.inline_editable_job_level', 'editableselect',aa);
					var bb = mergeparameditable(param,posted.userData.job_level_id);
					bb.adata = udc_level;
					fillatt(posted.userData.job_level_id.text,'.inline_editable_job_functions', 'editableselect',bb);
					var cc = mergeparameditable(param,posted.userData.country);
					cc.adata = udc_country;
					fillatt(posted.userData.country.text,'.inline_editable_country', 'editableselect',cc);
					
					var sparam={"table":posted.stable, "type":"text",
								"mode":"inline","pk":posted.pprospect_id,
								"url":eurl, "pk_name": posted.pk_sname,
								"id":posted.pprospect_id,
							};
					fillatt(posted.userData.linkedin.text,'.slinkedin', 'editable',mergeparameditable(sparam,posted.userData.linkedin));
					fillatt(posted.userData.facebook.text,'.facebook', 'editable',mergeparameditable(sparam,posted.userData.facebook));
					fillatt(posted.userData.instagram.text,'.instagram', 'editable',mergeparameditable(sparam,posted.userData.instagram));
					fillatt(posted.userData.snapchat.text,'.snapchat', 'editable',mergeparameditable(sparam,posted.userData.snapchat));
					
					fillatt(posted.userData.state.text,'.state', 'editable',mergeparameditable(sparam,posted.userData.state));
					fillatt(posted.userData.tiktok.text,'.tiktok', 'editable',mergeparameditable(sparam,posted.userData.tiktok));
					fillatt(posted.userData.twitter.text,'.twitter', 'editable',mergeparameditable(sparam,posted.userData.twitter));
					

					fillatt(posted.userData.nic.text,'.nic', 'text',mergeparameditable(param,posted.userData.nic));					
					fillatt(posted.userData.company_address.text,'.company_address', 'html',mergeparameditable(param,posted.userData.company_address));
					fillatt(posted.userData.company_city.text,'.company_city', 'html',mergeparameditable(param,posted.userData.company_city));
					fillatt(posted.userData.company_country.text,'.company_country', 'html',mergeparameditable(param,posted.userData.company_country));
					//fillatt(posted.userData.company_id.text,'.company_id', 'html',mergeparameditable(param,posted.userData.company_id));
					fillatt(posted.userData.company_src.text,'.company_src', 'html',mergeparameditable(param,posted.userData.company_src));
					fillatt(posted.userData.company_state.text,'.company_state', 'html',mergeparameditable(param,posted.userData.company_state));
					fillatt(posted.userData.company_technology.text,'.company_technology', 'html',mergeparameditable(param,posted.userData.company_technology));
					fillatt(posted.userData.company_zip.text,'.company_zip', 'html',mergeparameditable(param,posted.userData.company_zip));
					fillatt(posted.userData.sic.text,'.sic', 'html',mergeparameditable(param,posted.userData.sic));
					fillatt(posted.userData.revenuelink.text,'.revenuelink', 'html',mergeparameditable(param,posted.userData.revenuelink));

					varificationbadges(posted.userData.iscallverified.text,'.iscallverified','Call Verified')
					varificationbadges(posted.userData.iswebverified.text,'.iswebverified','Web Verified')
					varificationbadges(posted.userData.isemailverified.text,'.isemailverified','Email Verified')

					var otherparam={"table":posted.otherColumnstable, "type":"text",
								"mode":"inline","pk":posted.pprospect_id,
								"url":eurl, "pk_name": posted.pk_name,
								"id":posted.pprospect_id,
							};
					for (var i = 0; i < posted.oc.length; i++) {
						fillatt(posted.oc[i].value,'.'+posted.oc[i].attribue_name, 'editable',mergeparameditable(otherparam,posted.oc[i]));
					}
				
				}
	        	unblock_ajax_ui('#main-content-page');
	        } else {
	            $('#main-content-page').html("Please try reloading page!!");
	            unblock_ajax_ui('#main-content-page');
	        }
	    }
	});

}



function mergeparameditable(_param,_data) {
	if (_data.text == "null") {_data.text = ""}
	return  $.extend({}, _param, _data);
}

$(document).on('click','#timelinetab',function(){
	  var clicked = $("#timelinetab").attr("data-clicked");
	  if (clicked == "0") {
	  	var send_data = "prospect_id="+$("#prospect_id").val();
		var adata = ajax_call("Agent/gethistory",send_data,false,2);
		if (adata.type == "success") {
			$("#timelinetab").attr("data-clicked",1);
			$("#tab-71").html(printhistory(adata.history));
	    }
	  }
});

$(document).on('click','.follow',function(){
	  var href = $(this).closest('.media').find('.inline_editable').text();
	  if (href != "Empty" && (href.indexOf("http://") > 0 || href.indexOf("https://")) > 0)
	  {
	  	 window.open(href);
	  }
});

$(document).on('click','#similar_company_contacts',function(){
	  var send_data = [];
	  send_data.push({'key':'campaign_id', 'value' : $("#campaign_id").val()});
	   send_data.push({'key':'company_id', 'value' : $("#company_id").val() });
	   enable_common_dataTable( 'Lead_ajax/similar_company_contacts_leads/' ,"#similarcontact_dataTable",action_assignedleads,aocolumnDefs_assignedleads,"datatabl_int()",send_data);
	   $('#similarcontactModel').appendTo("body").modal('show');
});




$(document).on('click','#save_callback',function(){
	$('#CallBackModel').appendTo("body").modal('show');
});

$(document).on('click','#schedule_callback',function(){

	var send_data = "campaign_id="+$("#campaign_id").val()+"&lead_id="+$("#lead_id").val()+"&schedule_callback="+$("#inputcallback").val();
	var adata = ajax_call("Lead_ajax/schedule_callback",send_data,false,2);
	if (adata.type == "success") {
		$('#CallBackModel').modal('toggle');
    	$("#notifications_callback").show();
    	$("#notifications_callback_date").text($("#inputcallback").val());
    }
	
});

$(document).on('click','#skipped_company_contacts',function(){

	var send_data = "campaign_id="+$("#campaign_id").val()+"&lead_id="+$("#lead_id").val()+"&type=yes";
	var adata = ajax_call("Lead_ajax/skip_contacts_leads",send_data,false,2);
    if (adata.type == "success") {
    	nextleadpage($("#campaign_id").val());
    }
});

$(document).on('click','#assigned_leads',function(){
	  var send_data = [];
	  send_data.push({'key':'campaign_id', 'value' : $("#campaign_id").val()});
	   enable_common_dataTable( 'Lead_ajax/assigned_leads/' ,"#assignedModel_dataTable",action_assignedleads,aocolumnDefs_assignedleads,"datatabl_int()",send_data);
	   $('#assignedModel').appendTo("body").modal('show');
});



function datatabl_int()
{
	$('input[type=checkbox][data-toggle^=toggle]').bootstrapToggle();

	$(".skipped_checkox").change(function() {
	  var send_data = "";
      if(this.checked) {
          send_data = "campaign_id="+$("#campaign_id").val()+"&lead_id="+$(this).closest('tr').data('id')+"&type=yes";
      }
      else
      {
        send_data = "campaign_id="+$("#campaign_id").val()+"&lead_id="+$(this).closest('tr').data('id')+"&type=no";
      }
      var adata = ajax_call("Lead_ajax/skip_contacts_leads",send_data,false,2);
	});

	$(".unassign_user_lead").click(function (argument) {
		var unassignedid =$(this).closest('tr').data('id');
	   Swal.fire({
	      title: 'Are you sure?',
	      text: "You won't be able to revert this!",
	      type: 'warning',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: 'Yes, Move it Calling Pool!',
	      confirmButtonClass: 'btn btn-warning',
	      cancelButtonClass: 'btn btn-danger ml-1',
	      buttonsStyling: false,
	    }).then(function (result) {
	      if (result.value) {
	        var send_data = "campaign_id="+$("#campaign_id").val()+"&lead_id="+unassignedid+"&type=no";
	        var adata = ajax_call("Lead_ajax/unassign_user_lead",send_data,false,2);
	        if (adata.type == "success") {
	          $("#assignedModel_dataTable_" + unassignedid).remove();
	        }
	      } 
	    })
	});
	//unassign_user_lead
	$(".new_tab_open_lead_calling").click(function (e) {
		e.preventDefault(); 
	    var url = $(this).attr('href'); 
	    window.open(url, '_blank');
	});

	document.getElementById("inputcallback").setAttribute("min", new Date().toISOString().split("T")[0]+'T00:00');
}



function varificationbadges(data,selector, displaytext)
{
	if (data == 1) {
		fillatt('<i class="fa fa-check"></i> '+displaytext,selector, 'html');
		$(selector).removeClass('bg-danger-gradient');
		$(selector).addClass('bg-success-gradient');
	}
	else{
		fillatt('<i class="fa fa-times"></i> '+displaytext,selector, 'html');
		$(selector).addClass('bg-danger-gradient');
		$(selector).removeClass('bg-success-gradient');
	}
}


