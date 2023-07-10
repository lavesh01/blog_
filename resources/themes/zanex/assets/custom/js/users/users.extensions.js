var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {



	var action = [
        { "class":"delete_user_extension","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Users"},
        
		];
        
enable_common_dataTable( 'users_ajax/user_extensions' ,htmldatatable_id,action);

 } );




//Delete Users
$(document).on('click','.delete_user_extension',function(){

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
        var adata = ajax_call("Users_ajax/delete_user_extensions",send_data);
        
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Extension is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })



}); 



var dt_test;
function draw_table(type="")
{
   var action = [
        { "class":"delete_user_extension","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Users"},
        
    ];
  if (type=="") {
    dt_test = enable_common_dataTable( 'users_ajax/user_extensions' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'users_ajax/user_extensions' ,htmldatatable_id,action);

  }

}