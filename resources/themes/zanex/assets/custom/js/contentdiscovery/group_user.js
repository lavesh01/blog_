var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"view_user","icon":"fa fa-eye icon-gradient bg-happy-green", "id":"view", "href":"#","title":"view Users"},
                    { "class":"assign_campaign","icon":"fa fa-users icon-gradient bg-mixed-hopes", "id":" ", "href":"#","title":"Assign Campaign"},
              ];   
enable_common_dataTable( 'ContentDiscovery/groupuserlist' ,htmldatatable_id,action);

 

 } );

//Select Multiple function

(function(window, document, $) {
    'use strict';

 select2_ajax(".select2_contentcampaign", "/Udc/Udc/campaign", "Select Campaign Name");

})(window, document, jQuery);

$(document).on('click','.view_user',function(){
  var group_id = $(this).attr("id").replace("view","");
  var group_data = [{ "group_id2":group_id}, { "group_id":group_id}];
   $('#group_id').val(group_id);
  $('#groupusermodel').appendTo("body").modal('show');
  var action = [
                 { "class":"delete_users","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Users"},
                
               ];
  enable_common_dataTable( 'ContentDiscovery/groupusersListing' ,"#groupusers_data",action,{},"",group_data);
 
});



$(document).on('click','.delete_users',function(){

 $("#ajax_id").val($(this).attr('id').replace("delete_",""));
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!',
      confirmButtonClass: 'btn btn-warning',
      cancelButtonClass: 'btn btn-danger ml-1',
      buttonsStyling: false,
    }).then(function (result) {
      if (result.value) {
        var send_data = $("#ajax_form").serialize();
        var adata = ajax_call("ContentDiscovery/delete_group_users",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Content Discovery User is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});


$(document).on('click','.assign_campaign',function(){

  var group_id = $(this).attr("id").replace("assign_campaign","");
  var group_data = [{ "group_id2":group_id}, { "group_id":group_id}];
   $('#groupID').val(group_id);
  $('#groupcampaignmodel').appendTo("body").modal('show');


});  


$(document).ready(function () {       
 
  $('#assign_campaign_togroup').on('click', function () {
   var campaign_id = $('#campaign_id').val(); 
   if(campaign_id=="")
    {
      swal("Campaign Name Missing","Select Campaign Name");
      return false;
    }

    var send_data = $("#camp_group_details").serialize();
    var adata = ajax_call("ContentDiscovery/assignCampaignToGroupData",send_data );
    if(adata.type == "failed")
    {
       $('#campaign_id').val(''); 
       $('#groupcampaignmodel').modal('show'); 
       return false;
        
    }
    else if(adata.type == "success")
    {
       $('#groupcampaignmodel').modal('hide');
       $('#campaign_id').val('');
       draw_table();
       return false;
    }
    else if(adata.type == "error")
    {
       $('#groupcampaignmodel').modal('show');
       return false;
    }  
    else
    {
        $('#groupcampaignmodel').modal('show');
        return false;
    } 
   
  });
});




//Auto Refreshing Data table function
var dt_test;
function draw_table(type="") {
  var action = [
                    { "class":"view_user","icon":"fa fa-eye icon-gradient bg-happy-green", "id":"view", "href":"#","title":"view Users"},
                    { "class":"assign_campaign","icon":"fa fa-users icon-gradient bg-mixed-hopes", "id":" ", "href":"#","title":"Assign Campaign"},
              ];   
 
  if (type=="") {
    dt_test = enable_common_dataTable( 'ContentDiscovery/groupuserlist' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'ContentDiscovery/groupuserlist' ,htmldatatable_id,action);

  }

}