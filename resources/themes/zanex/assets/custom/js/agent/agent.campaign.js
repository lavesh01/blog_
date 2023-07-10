var htmldatatable_id = "#common_dataTable";
$(document).ready(function() {
	var action = [
					
					{ "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/manual/", "title":"Mannual Dailer"},
          { "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/automatic/", "title":"Automatic Dailer"}
          
				];
	var aocolumnDefs =  [
                   {    
                        "aTargets": [7],
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
    enable_common_dataTable( 'campaign_ajax/campManager' ,htmldatatable_id,action,aocolumnDefs);
} );


//open campaign model
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


});


//auto refresh data table functions

var dt_test;
function draw_table(type="") {
 
  var action = [
          
          { "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/manual/", "title":"Mannual Dailer"},
          { "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/automatic/", "title":"Automatic Dailer"}
          
        ];
  var aocolumnDefs =  [
                   {    
                        "aTargets": [7],
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
     enable_common_dataTable( 'campaign_ajax/campManager' ,htmldatatable_id,action,aocolumnDefs);
  }
  else
  {
    dt_test.destroy();
     enable_common_dataTable( 'campaign_ajax/campManager' ,htmldatatable_id,action,aocolumnDefs);
  }

}