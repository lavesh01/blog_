var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_type", "href":"#","title":"Edit Type Details"},
                    { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Type Details"},
              ];   
enable_common_dataTable( 'Settings_ajax/module_details' ,htmldatatable_id,action);

 

 } );


//open modal popup of grade
$(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#typeModel').appendTo("body").modal('show');
    })
} );


//multiple module settings
 
 $(document).ready(function(){  
      var i=1;  
      $('#add').click(function(){  
           i++;  
           $('#dynamic_field').append('<tr id="row'+i+'"><td><input type="text" name="module[]" placeholder="Enter Module" class="form-control name_list" /></td><td><input type="text" name="name[]" placeholder="Enter Module Name" class="form-control name_list" /></td><td><input type="text" name="value[]" placeholder="Enter Module Value" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  
      });  
      $(document).on('click', '.btn_remove', function(){  
           var button_id = $(this).attr("id");   
           $('#row'+button_id+'').remove();  
      });  

      $('#submit').click(function(){            
           $.ajax({  
                url:site_url + "Settings_ajax/insertmodule_data",  
                method:"POST",  
                data:$('#add_name').serialize(),  
                success:function(data)  
                {  
                  if(data=="1")
                  {
                      swal("Module Added", "Module Data Added Successfully","success");
                      $('#add_name')[0].reset(); 
                      draw_table();
                      $('#typeModel').modal('hide');
                      return false;
                  }
                  else
                  {

                     

                   }  
                  }
           });  
      });  
      
 });  




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
        var adata = ajax_call("Settings_ajax/delete_module",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Module is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});



$(document).on('click','.edit_type',function(){
  var module_id = $(this).attr("id").replace("edit_type","");
   $('#module_id').val(module_id);
    $.ajax({
    url:site_url + "Settings_ajax/fetch_modules",
    method:"POST",
    data:{module_id:module_id},
    dataType:"json", 
     beforeSend: function() {
       $('#name_list').val('');
       $('#module_list').val('');
       $('#value_list').val('');
    },
    success:function(res)
    {
    $('#name_list').val(res.data.name);
    $('#module_list').val(res.data.module);
    $('#value_list').val(res.data.value);
 
    }
   });
  $('#update_type').appendTo("body").modal('show');
 
});

$('#update_type_details').on('click', function () {
    var send_data = $("#update_type_form_details").serialize();
    var adata = ajax_call("Settings_ajax/update_moduledetails",send_data );
    if(adata.type == "success")
    {
       $('#update_type').modal('hide');
        $('#name_list').val('');
       $('#module_list').val('');
       $('#value_list').val('');
       draw_table();
       return false;
    }
    else
    {
        $('#update_type').modal('show');
       return false;
    }
    
  });


//Auto Refreshing Data table function
var dt_test;
function draw_table(type="") {
 var action = [
                    { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_type", "href":"#","title":"Edit Type Details"},
                    { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Type Details"},
              ]; 
  if (type=="") {
    dt_test = enable_common_dataTable( 'Settings_ajax/module_details' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'Settings_ajax/module_details' ,htmldatatable_id,action);

  }

}
