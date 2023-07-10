var htmldatatable_id = "#sales_dataTable";
$(document).ready(function() {
 
	
	var action = [
          { "class":"editCampaign","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"ec", "href": "#", "title":"Edit Campaign"},
          { "class":"uploaddocument","icon":"fa fa-upload  icon-gradient bg-sunny-morning", "id":"up", "href": "#","title":"Upload Document"},
          { "class":"uploadrejection","icon":"fa fa-ban  icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "sales/clientRejection/","title":"Upload Customer Rejection"},

				];
	var aocolumnDefs =  [

                     {    
                        "aTargets": [1],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) { 
                            return '<input type="checkbox" class="delete_checkbox" value="' + data +'">';  
                        }
                      },
 
                   {    
                        "aTargets": [8],
                        "mRender": function (data, type, full) {
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
                    },
                   
                ];

                
enable_common_dataTable( 'sales_ajax/getmyCampaignList' ,htmldatatable_id,action,aocolumnDefs);
} );


$(document).on('click','.editCampaign',function(){
  var campaign_id = $(this).attr("id").replace("ec","");
  $("#Campaign_id").val(campaign_id);
  return false;
});


$(document).on('click','.uploaddocument',function(){
  var campaign_id = $(this).attr("id").replace("up","");
  $("#Campaign_id").val(campaign_id);
  $("#asset_list").html("");
  $('#uploadDocModel').appendTo("body").modal('show');
   
   
  var adata = ajax_call_no_alert("sales_ajax/getassets/" + campaign_id ,{} );
  if (adata.type == "success") {
    var ass = adata.getAssets;
    $.each(ass, function(i, item) {
       $("#asset_list").append('<li class="list-group-item"><a href="' + item.url  + '" target="_blank" >'+ item.client_name + '</a></li>');
    });
  }
  return false;
});



Dropzone.options.dpAcceptFiles = {
    paramName: "file", // The name that will be used to transfer the file
    maxFilesize: 1, // MB
    //acceptedFiles: 'image/*',
    url: site_url + "campaign_ajax/upload",
    init: function() {
        this.on("sending", function(file, xhr, formData) {
          var campaign_id = $("#Campaign_id").val();
          formData.append("campaign_id", campaign_id);
        });
      },    
    success: function(file, response){
        $("#asset_list").prepend('<li class="list-group-item"><a href="' + response.url  + '" target="_blank" >'+ response.client_name + '</a></li>');
    }
}



$(document).on('click','.editCampaign',function(){

var campaign_id = $(this).attr("id").replace("ec","");

  $('#campaign_id').val(campaign_id);

   $.ajax({
    url:site_url + "Sales_ajax/fetch_CampaignData",
    method:"POST",
    data:{campaign_id:campaign_id},
    dataType:"json", 
    beforeSend: function() {
       $('#campaignname_u').val('');
       $('#startdate_u').val('');
       $('#enddate_u').val('');
       $('#campaigngrade_u').val('');
       $('#client_id_u').val('');
       $('#leads_u').val('');
       $('#lead_cost_u').val('');
       $('#description_u').val('');
    },
    success:function(res)
    {
    $('#campaignname_u').val(res.data.campaign_name);
    $('#startdate_u').val(res.data.start_date);
    $('#enddate_u').val(res.data.end_date);
    $('#campaigngrade_u').val(res.data.campaign_grade_id);
    $('#client_id_u').val(res.data.client_id);
    $('#leads_u').val(res.data.total_lead);
    $('#lead_cost_u').val(res.data.lead_cost);
    $('#description_u').val(res.data.description);
    }
   }); 


  $('#modal_update_campaign').appendTo("body").modal('show');
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
      return false;
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
    var adata = ajax_call("Sales_ajax/insert_campaign_Details",send_data );
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
        draw_table();
         return false;
    }
    
    else
    {
      $('#modal_create_campaign').modal('show');
       
         return false;
    }

   
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




});


var htmldatatable_id = "#sales_dataTable";
var dt_test;
function draw_table(type="") {
 
  var action = [

           { "class":"editCampaign","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"ec", "href": "#", "title":"Edit Campaign"},
           { "class":"uploaddocument","icon":"fa fa-upload  icon-gradient bg-sunny-morning", "id":"up", "href": "#","title":"Upload Document"},
           { "class":"uploadrejection","icon":"fa fa-ban  icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "sales/clientRejection/","title":"Upload Customer Rejection"},
           ];
  var aocolumnDefs =  [
    {    
                        "aTargets": [1],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) { 
                            return '<input type="checkbox" class="delete_checkbox" value="' + data +'">';  
                        }
                      },
                   {    
                        "aTargets": [8],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                          console.log(data);
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
    dt_test = enable_common_dataTable( 'sales_ajax/getmyCampaignList' ,htmldatatable_id,action,aocolumnDefs); 

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'sales_ajax/getmyCampaignList' ,htmldatatable_id,action,aocolumnDefs); 

  }

}


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


//delete multiple records
$(document).ready(function(){

 $(document).on('click','.delete_checkbox',function(){
  if($(this).is(':checked'))
  {
   $(this).closest('tr').addClass('removeRow');
  }
  else
  {
   $(this).closest('tr').removeClass('removeRow');
  }
 });

 $('#delete_all').click(function(){
  var checkbox = $('.delete_checkbox:checked');
  if(checkbox.length > 0)
  {
   var checkbox_value = [];
   $(checkbox).each(function(){
    checkbox_value.push($(this).val());
   });
   $.ajax({
    url:site_url + "Sales_ajax/delete_allCampaignData",
    method:"POST",
    data:{checkbox_value:checkbox_value},
    success:function()
    {
        swal("Record Deleted", "Selected Records Deleted Successfully", "success");
         draw_table();
    }
   })
  }
  else
  {
   alert('Select atleast one records');
  }
 });

});