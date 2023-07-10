var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"edit_group","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_group", "href":"#","title":"Edit Group Details"},
                    { "class":"delete_group","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Group Details"},
              ];   
enable_common_dataTable( 'Settings_ajax/campaign_group_details' ,htmldatatable_id,action);

 

 } );

//Delete modal popup
$(document).on('click','.delete_user_data',function(){

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
        var adata = ajax_call("Settings_ajax/delete_user_data",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Designation is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});





//open modal popup of grade
$(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#campaign_group').appendTo("body").modal('show');
    })
} );

//Save grade model function
$(document).ready(function () {       
 
  $('#save_group_details').on('click', function () {
   var group_name = $('#group_name').val(); 
   if(group_name=="")
    {
      swal("Group Name Missing","Enter Group Name");
      return false;
    }

    var send_data = $("#user_form_details").serialize();
    var adata = ajax_call("Settings_ajax/add_campaign_group_details",send_data );
    if(adata.type == "failed")
    {
       $('#group_name').val(''); 
       $('#campaign_group').modal('show'); 
       return false;
        
    }
    else if(adata.type == "success")
    {
       $('#campaign_group').modal('hide');
       $('#group_name').val('');
       draw_table();
       return false;
    }
    else if(adata.type == "error")
    {
       $('#campaign_group').modal('show');
       return false;
    }  
    else
    {
        $('#campaign_group').modal('show');
        return false;
    } 
   
  });
});  





//Auto Refreshing Data table function
var dt_test;
function draw_table(type="") {
  var action = [
                    { "class":"edit_group","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_group", "href":"#","title":"Edit Group Details"},
                    { "class":"delete_group","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Group Details"},
              ]; 

  if (type=="") {
    dt_test = enable_common_dataTable( 'Settings_ajax/campaign_group_details' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'Settings_ajax/campaign_group_details' ,htmldatatable_id,action);

  }

}


//fetch Grade Model
$(document).on('click','.edit_group',function(){
  var group_id = $(this).attr("id").replace("edit_group","");
   $('#designation_id').val(group_id);
    $.ajax({
    url:site_url + "Settings_ajax/fetch_campaign_groups",
    method:"POST",
    data:{group_id:group_id},
    dataType:"json", 
     beforeSend: function() {
       $('#group_name_u').val('');
    },
    success:function(res)
    {
    $('#group_name_u').val(res.data.group_name);
    }
   });
  $('#update_grade').appendTo("body").modal('show');
 
});

//Update grade script
$('#update_grade_details').on('click', function () {
    
   var group_name_u = $('#group_name_u').val();
   if(group_name_u=="")
    {
      swal("Group Name Missing","Enter Group Name");
      return false;
    }
    var send_data = $("#update_designation_form_details").serialize();
    var adata = ajax_call("Settings_ajax/update_campgroup_details",send_data );
    if(adata.type == "success")
    {
       $('#update_grade').modal('hide');
        $('#group_name_u').val('');
       draw_table();
       return false;
    }
    else
    {
        $('#update_grade').modal('show');
       return false;
    }
    
  });

