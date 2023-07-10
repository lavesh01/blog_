var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_type", "href":"#","title":"Edit Type Details"},
                    { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Type Details"},
              ];   
enable_common_dataTable( 'Settings_ajax/type_details' ,htmldatatable_id,action);

 

 } );

//Delete modal popup
$(document).on('click','.delete_type',function(){

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
        var adata = ajax_call("Settings_ajax/delete_type",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Grade is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});





//open modal popup of grade
$(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#typeModel').appendTo("body").modal('show');
    })
} );

//Save grade model function
$(document).ready(function () {       
 
  $('#save_type_details').on('click', function () {
    
    var name = $('#name').val();
    
    if(name=="")
    {
      swal("Name Missing","Enter Name");
      return false;
    }

    var send_data = $("#type_form_details").serialize();
    var adata = ajax_call("Settings_ajax/add_type_details",send_data );
    if(adata.type == "info")
    {
       $('#name').val('');  

        return false;
    }
    else if(adata.type == "warning")
    {
       $('#name').val('');  
       
        return false;
    }
    else if(adata.type == "success")
    {
       $('#typeModel').modal('hide');
       $('#name').val('');  
        draw_table();
        return false;
    }
    draw_table();
    return false;
  });
});  





//Auto Refreshing Data table function
var dt_test;
function draw_table(type="") {
 var action = [
                    { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_type", "href":"#","title":"Edit Type Details"},
                    { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Type Details"},
              ]; 
  if (type=="") {
    dt_test = enable_common_dataTable( 'Settings_ajax/type_details' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'Settings_ajax/type_details' ,htmldatatable_id,action);

  }

}


//fetch Grade Model
$(document).on('click','.edit_type',function(){
  var type_id = $(this).attr("id").replace("edit_type","");
   $('#type_id').val(type_id);
    $.ajax({
    url:"Settings_ajax/fetch_types",
    method:"POST",
    data:{type_id:type_id},
    beforeSend: function() {
       $('#type_name').val('');
    },
    success:function(dataresult)
    {
   
     $('#type_name').val(dataresult);

    
    }
   });
  $('#update_type').appendTo("body").modal('show');
 
});

//Update grade script
$('#update_type_details').on('click', function () {

   var type_name = $('#type_name').val();
    if(type_name=="")
    {
      swal("Name Missing","Enter Name");
      return false;
    }
    

    var send_data = $("#update_type_form_details").serialize();
    var adata = ajax_call("Settings_ajax/update_typedetails",send_data );
    if(adata.type== "info")
    {
       $('#update_type').modal('show');
       draw_table();
       return false;
    }
    else if(adata.type == "success")
    {
       $('#update_type').modal('hide');
        $('#type_name').val('');
       draw_table();
       return false;
    }
    else
    {
        $('#update_type').modal('show');
       draw_table();
       return false;
    } 
  });

