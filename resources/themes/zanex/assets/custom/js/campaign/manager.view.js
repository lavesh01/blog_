var htmldatatable_id = "#common_dataTable";
var action = [
                    { "class":"view primary","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"view", "href":site_url + "campaign/edit/", "title":"Edit"},
          { "class":"view primary","icon":"fa fa-keyboard icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "ContentDiscovery/manual/",
           "title":"Manual Data"},
           { "class":"view primary","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"view", "href": site_url + "ContentDiscovery/uploadrpf/",
           "title":"Data Upload"},
                    { "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/manual/", "title":"Mannual Dailer"},
          { "class":"view primary","icon":"fa fa-rocket icon-gradient bg-malibu-beach", "id":"view", "href": site_url + "quality/leads/",
           "title":"Quality"},
          { "class":"uploadrejection","icon":"fa fa-user  icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "sales/clientRejection/","title":"Upload Customer Rejection"},
          { "class":"campaigndata","icon":"fa fa-database  icon-gradient bg-premium-dark", "id":"view", "href": site_url + "campaign/leads/","title":"Lead Data"}
           
                ];
var aocolumnDefs =  [
           {    
                "aTargets": [5],
                //"mData": "first_name",
                "mRender": function (data, type, full) {
                  //console.log(data);
                   if ( data == "0") {
                    return '<div class="badge bg-pill bg-warning text-center">Draft</div>';
                            
                   }
                   else if ( data == "1") {
                   return '<div class="badge bg-pill bg-info text-center">Live</div>';
                   }
                   else if ( data == "2") {
                    return '<div class="badge bg-pill bg-success text-center">Completed</div>';
                   }
                }
            },
            {    
                "aTargets": [6],
                //"mData": "first_name",
                "mRender": function (data, type, full) {
                  var t = `<div class="widget-content p-0">
                                    <div class="widget-content-outer">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left pr-2">
                                                <div class="widget-numbers fsize-1 text-css">`+data+`%</div>
                                            </div>
                                            <div class="widget-content-right w-100">
                                                <div class="progress-bar-xs progress">
                                                    <div class="progress-bar bg-css" role="progressbar" aria-valuenow="`+data+`" aria-valuemin="0" aria-valuemax="100" style="width: `+data+`%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>`;
                   if ( parseInt(data) >= 0 && parseInt(data)  <= 25) {
                    return t.replace('css','danger');
                   }
                   else if ( parseInt(data)  > 25 && parseInt(data)  <= 50) {
                   return t.replace('css','warning');
                   }
                   else if ( parseInt(data)  > 50 && parseInt(data)  <= 75) {
                   return t.replace('css','info');
                   }
                   else if ( parseInt(data)  > 75 && parseInt(data)  <= 100) {
                   return t.replace('css','success');
                   }
                   else
                   {
                    return "Data Missing";
                   }
                }
            }

        ];
$(document).ready(function() {
  var send_data = [];
  send_data.push({'key':'status', 'value' : 1 });
  send_data.push({'key':'type', 'value' : $("#type").val() });
  enable_common_dataTable( 'campaign_ajax/campaign_manager' ,htmldatatable_id,action,aocolumnDefs,"",send_data);    
	open_common_htmlform_model("#popupbutton","campaign/htmlform/campaign-models-create");
} );


function rendertable()
{
  var send_data = [];
    send_data.push({'key':'status', 'value' : $("#cstatus").val() });
    send_data.push({'key':'type', 'value' : $("#type").val() });
    enable_common_dataTable( 'campaign_ajax/campaign_manager' ,htmldatatable_id,action,aocolumnDefs,"",send_data);    

}

$('.access_group').on('click', function () {
   var this_click = $(this).data("module");
   $("#access_group_text").text($(this).text() );
   $("#cstatus").val(this_click );
   rendertable();
});

$('.access_type').on('click', function () {
  var this_click = $(this).data("type");
   $("#access_type_text").text($(this).text() );
   $("#type").val(this_click ); 
   rendertable();   
});

$(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#modal_create_campaign').appendTo("body").modal('show');
    })
      
 
$('#save_btn').on('click', function () {

    var campaignname = $('#campaignname').val();
    var startdate = $('#startdate').val();
    var enddate = $('#enddate').val();
    var campaigngrade = $('#campaigngrade').val();
    var client_id = $('#client_id').val();
    var leads = $('#leads').val();
    var lead_cost = $('#lead_cost').val(); 
    var lead_company = $('#lead_company').val();
    var description = $('#description').val(); 

  
     if(campaignname=="" && startdate=="" && enddate=="" && campaigngrade=="" && client_id=="" && leads=="" && lead_cost=="" && lead_company=="" && description=="")
    {
      swal("Form Fields Missing","Enter Campaign Name, Enter Start Date, Enter End Date, Enter Campaign Grade, Enter client ID, Enter Leads Count, Enter Lead Cost, Enter Lead Company, Enter Description ");
      //return false;
    }
    else if(campaignname=="")
    {
      swal("Campaign Missing","Enter Campaign Name");
      return false;
    }
    else if(startdate=="")
    {
      swal("Start Date Missing","Enter Start Date");
      return false;
    }

    else if(enddate=="")
        {
          swal("End Date Missing","Enter End Date");
          return false;
        }

    else if(campaigngrade=="")
        {
          swal("Grade Missing","Enter Campaign Grade");
          return false;
        }

    else if(client_id=="")
        {
          swal("Client Missing","Enter Client ID");
          return false;
        }

    else if(leads=="")
        {
          swal("Leads Missing","Enter Lead Count");
          return false;
        }

    else if(lead_cost=="")
        {
          swal("Lead Cost Missing","Enter Lead Cost");
          return false;
        }

    else if(lead_company=="")
        {
          swal("Company Leads Missing","Enter Company Lead Count");
          return false;
        }
    else if(description=="")
    {
      swal("Description Missing","Enter Description");
      return false;
    }

    var send_data = $("#insert_Campaign_details").serialize();
    var adata = ajax_call("Campaign_ajax/insert_campaign_Details",send_data );
    if(adata.type=="info")
    {
       $('#modal_create_campaign').modal('show');
        return false;
         
    }
    else if(adata.type=="warning")
    {
       $('#campaignname').val('');
       $('#modal_create_campaign').modal('show');
       
         return false;

    }
    else if(adata.type=="success")
    {
       $('#campaignname').val('');
       $('#startdate').val('');
       $('#enddate').val('');
       $('#campaigngrade').val('');
       $('#client_id').val('');
       $('#leads').val('');
       $('#lead_cost').val('');
       $('#lead_company').val('');
       $('#description').val('');
       $('#modal_create_campaign').modal('hide');
       window.location.href = site_url + 'campaign/edit/' + adata.id;
         return false;
    }
    
    else
    {
      $('#modal_create_campaign').modal('show');
       
         return false;
    }

   
  });


});


  $('#update_btn').on('click', function () {
    var send_data = $("#update_Campaign_details").serialize();
    var adata = ajax_call("Sales_ajax/update_campaign_details",send_data );
    if(adata.type=="info")
    {
        $('#modal_update_campaign').modal('show');
        draw_table();
    return false;
    }
    else if(adata.type=="success")
    {
       $('#modal_update_campaign').modal('hide');
        draw_table();
    return false;
    }

    
  });

/*
var dt_test;
function draw_table(type="") {
 
  var action = [
          { "class":"view primary","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"view", "href":site_url + "campaign/edit/", "title":"Edit"},
          { "class":"view primary","icon":"fa fa-keyboard icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "ContentDiscovery/manual/",
           "title":"Manual Data"},
           { "class":"view primary","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"view", "href": site_url + "ContentDiscovery/index/",
           "title":"Data Upload"},
          { "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/manual/", "title":"Mannual Dailer"},
          { "class":"view primary","icon":"fa fa-rocket icon-gradient bg-malibu-beach", "id":"view", "href": site_url + "quality/leads/",
           "title":"Quality"},
          { "class":"uploadrejection","icon":"fa fa-user  icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "sales/clientRejection/","title":"Upload Customer Rejection"}
           
        ];
  var aocolumnDefs =  [
                   {    
                        "aTargets": [7],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                          //console.log(data);
                           if ( data == "0") {
                            return "draft";
                           }
                           else if ( data == "1") {
                            return "live";
                           }
                           else if ( data == "2") {
                            return "Completed";
                           }
                        }
                    }
                ];
  
  if (type=="") {
    dt_test = enable_common_dataTable( 'campaign_ajax/campaign_manager' ,htmldatatable_id,action,aocolumnDefs); 

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'campaign_ajax/campaign_manager' ,htmldatatable_id,action,aocolumnDefs); 

  }

}

*/
function checkNumericText()
{
    var leads=$('#leads').val();
    if(!/^[0-9]+$/.test(leads))
    {
      $('#leads').val("");
      $('#leads').focus();
      swal("Invalid..!", "Enter Numbers Only")
      return false;
    } 
} 

function checkNumericCost()
{
    var lead_cost=$('#lead_cost').val();
    if(!/^[0-9]+$/.test(lead_cost))
    {
      $('#lead_cost').val("");
      $('#lead_cost').focus();
      swal("Invalid..!", "Enter Numbers Only")
      return false;
    } 
} 


function checkNumericLeads()
{
    var lead_company=$('#lead_company').val();
    if(!/^[0-9]+$/.test(lead_company))
    {
      $('#lead_company').val("");
      $('#lead_company').focus();
      swal("Invalid..!", "Enter Numbers Only")
      return false;
    } 
} 


function checkNumericTextUpdate()
{
  var leads_u=$('#leads_u').val();
    if(!/^[0-9]+$/.test(leads_u))
    {
      $('#leads_u').val("");
      $('#leads_u').focus();
      swal("Invalid..!", "Enter Numbers Only")
      return false;
    } 
}


function checkNumericCostUpdate()
{
    var lead_cost_u=$('#lead_cost_u').val();
    if(!/^[0-9]+$/.test(lead_cost_u))
    {
      $('#lead_cost_u').val("");
      $('#lead_cost_u').focus();
      swal("Invalid..!", "Enter Numbers Only")
      return false;
    } 
} 

function checkNumericLeadsUpdate()
{
    var lead_company_u=$('#lead_company_u').val();
    if(!/^[0-9]+$/.test(lead_company_u))
    {
      $('#lead_company_u').val("");
      $('#lead_company_u').focus();
      swal("Invalid..!", "Enter Numbers Only")
      return false;
    } 
} 
