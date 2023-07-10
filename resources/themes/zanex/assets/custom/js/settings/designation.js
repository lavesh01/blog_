var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"edit_user_data","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_user_data", "href":"#","title":"Edit User Details"},
                    { "class":"delete_user_data","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete User Details"},
              ];   
enable_common_dataTable( 'Settings_ajax/user_designation_details' ,htmldatatable_id,action);

 

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
      $('#userDesignationModal').appendTo("body").modal('show');
    })
} );

//Save grade model function
$(document).ready(function () {       
 
  $('#save_user_details').on('click', function () {

   var designation = $('#designation').val();
   var points = $('#points').val();
    if(designation=="" || points=="")
    {
      swal("Form Fields Missing","Enter Designation, Enter Points");
      return false;
    }
    else if(designation=="")
    {
      swal("Designation Missing","Enter Designation");
      return false;
    }
    else if(points=="")
    {
      swal("Points Missing","Enter Points");
      return false;
    }

    var send_data = $("#user_form_details").serialize();
    var adata = ajax_call("Settings_ajax/add_userdesignation_details",send_data );
    if(adata.type == "failed")
    {
       $('#designation').val(''); 
       $('#userDesignationModal').modal('show'); 
       return false;
        
    }
    else if(adata.type == "success")
    {
       $('#userDesignationModal').modal('hide');
       $('#designation').val('');
       $('#points').val('');
       draw_table();
       return false;
    }
    else if(adata.type == "error")
    {
       $('#userDesignationModal').modal('show');
       return false;
    }  
    else
    {
        $('#userDesignationModal').modal('show');
        return false;
    } 
   
  });
});  





//Auto Refreshing Data table function
var dt_test;
function draw_table(type="") {
 var action = [
                    { "class":"edit_user_data","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_user_data", "href":"#","title":"Edit User Details"},
                    { "class":"delete_user_data","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete User Details"},
              ];   

  if (type=="") {
    dt_test = enable_common_dataTable( 'Settings_ajax/user_designation_details' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'Settings_ajax/user_designation_details' ,htmldatatable_id,action);

  }

}


//fetch Grade Model
$(document).on('click','.edit_user_data',function(){
  var designation_id = $(this).attr("id").replace("edit_user_data","");
   $('#designation_id').val(designation_id);
    $.ajax({
    url:site_url + "Settings_ajax/fetch_user_designation",
    method:"POST",
    data:{designation_id:designation_id},
    dataType:"json", 
     beforeSend: function() {
       $('#designation_u').val('');
       $('#points_u').val('');
    },
    success:function(res)
    {
    $('#designation_u').val(res.data.designation);
    $('#points_u').val(res.data.points);
 
    }
   });
  $('#update_grade').appendTo("body").modal('show');
 
});

//Update grade script
$('#update_grade_details').on('click', function () {
    
   var designation_u = $('#designation_u').val();
   var points_u = $('#points_u').val();
    if(designation_u=="" && points_u=="")
    {
      swal("Form Fields Missing","Enter Designation, Enter Points");
      return false;
    }
    else if(designation_u=="")
    {
      swal("Designation Missing","Enter Designation");
      return false;
    }
    else if(points_u=="")
    {
      swal("Points Missing","Enter Points");
      return false;
    }

    var send_data = $("#update_designation_form_details").serialize();
    var adata = ajax_call("Settings_ajax/update_designation_details",send_data );
    if(adata.type == "success")
    {
       $('#update_grade').modal('hide');
        $('#designation_u').val('');
         $('#points_u').val('');
       draw_table();
       return false;
    }
    else
    {
        $('#update_grade').modal('show');
       return false;
    }
    
  });

