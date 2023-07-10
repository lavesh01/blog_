

  var action = [

        { "class":"edit_users","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_dispositions", "href":"#","title":"Edit Users"},
        { "class":"delete_users","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Users"},
        
    ];
        
    var aocolumnDefs =  [];

enable_common_dataTable( 'cron/viewExportedData' ,"#edm_dataTable",action,aocolumnDefs);



//Add User Extension
$(document).on('click','.add_extensiopn',function(){
  var extension_id = $(this).attr("id").replace("add_extensiopn","");
   $('#extension_id').val(extension_id);

   $.ajax({
    url:"Users_ajax/fetch_userExtensionData",
    method:"POST",
    data:{extension_id:extension_id},
    dataType:"json", 
    beforeSend: function() {
       $('#ip_address').val('');
       $('#port').val('');
       $('#path').val('');
       $('#extension').val('');
       $('#name').val('');
       $('#passwordd').val('');
    },
    success:function(res)
    {
    $('#ip_address').val(res.data.ip_address);
    $('#port').val(res.data.port);
    $('#path').val(res.data.path);
    $('#extension').val(res.data.extension);
    $('#name').val(res.data.name);
    $('#passwordd').val(res.data.password);
    }
   }); 


   $('#extension_model').appendTo("body").modal('show');

 }); 

//Delete Users
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
        var adata = ajax_call("Users_ajax/delete_users",send_data);
        
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'User is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })



}); 
