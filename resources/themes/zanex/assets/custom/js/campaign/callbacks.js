$(document).ready(function() {
    var action_assignedleads = [];
var aocolumnDefs_assignedleads =  [
        {
          "aTargets": [0],
          //"mData": "first_name",
          "mRender": function (data, type, full) {
            return '<a target="_blank" title="Open In New Tab For Calling" href="'+site_url+'Agent/index/'+full.campaign_id+'/'+ data +'" data-tooltip="tooltip" data-placement="top" class="fonticon-wrap new_tab_open_lead_calling" id="new_tab_open_lead_calling61"><i class="fa fa-phone icon-gradient bg-happy-fisher"></i></a>';
            }
          },

        {    
            "aTargets": [1],
            "targets": [1],
            "bVisible":false,
            "visible":false,
        },
        {    
            "aTargets": [2],
            "targets": [2],
            "bVisible":false,
            "visible":false,
        }
    ];

  var send_data = [];
  send_data.push({'key':'campaign_id', 'value' : $("#campaign_id").val()});
  var url = "";
  if ($("#campaign_id").length !== 0 && $("#campaign_id").val() != "" ) {
    enable_common_dataTable( 'Lead_ajax/campaign_callback_leads/' ,"#edm_dataTable",action_assignedleads,aocolumnDefs_assignedleads,"datatabl_int()",send_data);
  }
  else
  {
    enable_common_dataTable( 'Lead_ajax/all_campaign_callback_leads/' ,"#edm_dataTable",action_assignedleads,aocolumnDefs_assignedleads,"datatabl_int()",send_data);
  }
});


