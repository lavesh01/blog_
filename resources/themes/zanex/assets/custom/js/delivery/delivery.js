var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"view_details","icon":"fa fa-eye icon-gradient bg-happy-green", "id":"view_campaign", "href":site_url + "delivery/campaignLeadDetails/","title":"View Campaign Lead Activity"},
                    { "class":"delivered_details","icon":"fa fa-truck icon-gradient bg-success", "id":"view_campaign", "href":site_url + "delivery/campaignDeliveredLeadDetails/","title":"View Delivered Lead Activity"},
                    { "class":"rejected_details","icon":"fa fa-ban icon-gradient bg-love-kiss", "id":"view_campaign", "href":site_url + "delivery/campaignRejectedLeadDetails/","title":"Rejected Lead List"},
              ];   
enable_common_dataTable( 'delivery/campaignDetails' ,htmldatatable_id,action);

 

 } );

var htmldatatable_id1 = "#lead_dataTable";
$(document).ready(function() {

     var campaign_id = $('#campaign_id').val();
     var lead_data = [{ "campaign_id":campaign_id}, { "campaign_id":campaign_id}];
  var action = [
                    { "class":"view_lead_details","icon":"fa fa-eye icon-gradient bg-happy-green", "id":"view_campaign", "href":site_url + "quality/leadWorkReportDetails/","title":"View Lead Details"},
              ];   
enable_common_dataTable( 'delivery/campaignQualifiedLeadDetails' ,htmldatatable_id1,action,{},"",lead_data);

 

 } );


//Change Status OF campaign Lead To Delivered
$(document).ready(function () {       
   
   $('#change_status_onclick').on('click', function () {

      var campaign_id=$('#campaign_id').val();
      var status=$('#status').val();
      var total_leads=$('#total_leads').val();
      var delivered_leads=$('#delivered_leads').val();
      var total_delivery=$('#total_delivery').val();
              $.ajax({
       url:site_url + "delivery/change_status",
       method:"POST",
       data:{status:status,campaign_id:campaign_id,total_leads:total_leads,delivered_leads:delivered_leads,total_delivery:total_delivery},
       beforeSend: function() {
   
          $('#loading').show();
          $('#change_status_onclick').hide();
   
       },
       success:function(data)
       {
          
         if(data=="1")
         {
             $('#loading').hide();
             $('#change_status_onclick').show();
            location.reload();
            swal("Status Updated", "Leads Delivered Successfully", "success")
   
         } else{
   
           $('#loading').hide();
           $('#change_status_onclick').show();
           swal("Error", "Please Try Again", "warning")
         }
   
       }
      });



     });
 });  


var htmldatatable_id2 = "#delivered_dataTable";
$(document).ready(function() {

     var campaign_id = $('#campaign_id').val();
     var lead_data = [{ "campaign_id":campaign_id}, { "campaign_id":campaign_id}];
  var action = [
                    { "class":"view_lead_details","icon":"fa fa-eye icon-gradient bg-happy-green", "id":"view_campaign", "href":site_url + "quality/leadWorkReportDetails/","title":"View Lead Details"},
                    { "class":"client_rejection","icon":"fa fa-ban icon-gradient bg-love-kiss", "id":"rejection", "href":"#","title":"Upload Client Rejection"},
              ];   
enable_common_dataTable( 'delivery/campaignDeliveredLeadsList' ,htmldatatable_id2,action,{},"",lead_data);

 

 } );


//rejection modal popup
$(document).on('click','.client_rejection',function(){

   var leadID = $(this).attr("id").replace("rejection","");
   $('#leadID').val(leadID);
   $('#rejectionmodel').appendTo("body").modal('show');


  });

//upload rejection of particular leads
 $('#save_rejection_details').on('click', function () {

   var reason = $('#reason').val();
    if(reason=="")
    {
      swal("Reason Missing","Enter Reason");
      return false;
    }

    var send_data = $("#rejection_form").serialize();
    var adata = ajax_call("delivery/saveRejectionLeadDetails",send_data );
    if(adata.type=="success")
    {
       $('#rejectionmodel').modal('show');
        draw_table();   
       return false;
     
    }

});

 //auto refresh data tables
var dt_test;
 function  draw_table(type="")
 {
     var campaign_id = $('#campaign_id').val();
     var lead_data = [{ "campaign_id":campaign_id}, { "campaign_id":campaign_id}];
     var action = [
                    { "class":"view_lead_details","icon":"fa fa-eye icon-gradient bg-happy-green", "id":"view_campaign", "href":site_url + "quality/leadWorkReportDetails/","title":"View Lead Details"},
                    { "class":"client_rejection","icon":"fa fa-ban icon-gradient bg-love-kiss", "id":"rejection", "href":"#","title":"Upload Client Rejection"},
              ];   

 
  if (type=="") {
    dt_test = enable_common_dataTable( 'delivery/campaignDeliveredLeadsList' ,htmldatatable_id2,action,{},"",lead_data);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'delivery/campaignDeliveredLeadsList' ,htmldatatable_id2,action,{},"",lead_data);

  }
 }


 var htmldatatable_id3 = "#rejected_dataTable";
$(document).ready(function() {

     var campaign_id = $('#campaign_id').val();
     var lead_data = [{ "campaign_id":campaign_id}, { "campaign_id":campaign_id}];
  var action = [
                    { "class":"view_lead_details","icon":"fa fa-eye icon-gradient bg-happy-green", "id":"view_campaign", "href":site_url + "quality/leadWorkReportDetails/","title":"View Lead Details"},
              ];   
enable_common_dataTable( 'delivery/campaignRejectedLeadsList' ,htmldatatable_id3,action,{},"",lead_data);

 

 } );


//Drag drop tables function
   $(function() {
    $("#delivered_dataTable tbody").sortable({
      cursor: "move",
      placeholder: "sortable-placeholder",
      helper: function(e, tr)
      {
        var $originals = tr.children();
        var $helper = tr.clone();
        $helper.children().each(function(index)
        {
        // Set helper cell sizes to match the original sizes
        $(this).width($originals.eq(index).width());
        });
        return $helper;
      }
    }).disableSelection();
  });




  //open modal popup of rearrange order
$(document).ready(function() {
    
      $("#rearrange_order").click(function (argument) {
      $('#reorderModel').appendTo("body").modal('show');
    })
} );
 

 //Insert delivery reorder sequence in table
 /*$(document).ready(function(){  
       $('#save_type_details').click(function(){   
       alert($('#type_form_details').serialize());         
           $.ajax({  
                url:site_url + "delivery/insertmodule_data",  
                method:"POST",  
                data:$('#type_form_details').serialize(),  
                success:function(data)  
                {  

                   alert(data);

                  if(data=="1")
                  {
                      swal("Order Sequence Added", "Sequence Added Successfully","success");
                      $('#type_form_details')[0].reset(); 
                     location.reload();
                      $('#reorderModel').modal('hide');
                      return false;
                  }
                  else
                  {

                     

                   }  
                  }
           });  
      }); 
  });      */  