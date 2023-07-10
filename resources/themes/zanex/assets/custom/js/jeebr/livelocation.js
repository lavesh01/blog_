 var action_api = [
     { "class":"apiaddinputedit","icon":"fa fa-clipboard icon-gradient bg-plum-plate", "id":"edit_", "href": "#",
        "title":"Copy"},
        { "class":"apiaddinputdelete","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href": "#",
        "title":"Add Input Fields"},
        
     ];

$('#save_btn').on('click', function () {
    var send_data = $("#form-livelocation").serialize();
    var adata = ajax_call("jeebr/Locationavailibilty/save/",send_data );
    if(adata.type=="success")
    {
      enable_common_dataTable( 'jeebr/Locationavailibilty/ajax_getall' ,"#edm_dataTable",action_api,"","");
       //renderFormInput($('#ref_id').val());
       return false;
    }
});

enable_common_dataTable( 'jeebr/Locationavailibilty/ajax_getall' ,"#edm_dataTable",action_api,"","");

$(document).on('click','.apiaddinputdelete',function(e){
     var delete_id = $(this);
     var id = delete_id.attr("id").replace("delete_","");
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
       block_ajax_ui();
       var send_data = $.param({"id": id });
       var adata = ajax_call("jeebr/Locationavailibilty/ajax_datadelete",send_data );
        if (adata.type == "success") {
            $('#edm_dataTable_'+id).remove();
            enable_common_dataTable( 'jeebr/Locationavailibilty/ajax_getall' ,"#edm_dataTable",action_api,"","",send_id);
            unblock_ajax_ui();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'User is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
          
        })
        unblock_ajax_ui();
      }

    })

  });


$(document).on('click','.apiaddinputedit',function(e){
     var edit_id = $(this);
     var id = edit_id.attr("id").replace("edit_","");
     var send_data = $.param({"id": id });
     var adata = ajax_call_no_alert("jeebr/Locationavailibilty/ajax_getsingleapirow",send_data );
     if (adata.type == "success") {
        $.each(adata.data, function(key, value) {
                fillatt(value,'[name="'+key+'"]',"val" );
            });   
     }
  });