var send_id = [];
send_id.push({"key":"id","value":$('#ref_id').val()});

    var action_api = [
        { "class":"apiaddinputedit","icon":"fa fa-edit icon-gradient bg-plum-plate", "id":"edit_", "href": "#",
           "title":"Edit"},
           { "class":"apiaddinputdelete","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href": "#",
           "title":"Add Input Fields"},
           
        ];

enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action_api,"","",send_id);

$(document).ready(function() {
    renderFormInput($('#ref_id').val());
});


$('#export_btn').on('click', function () {
    var send_data = $.param({"id": $('#ref_id').val() });
     ajax_call("Api/ajax_exportall",send_data  );

});
$('#importtemplate_btn').on('click', function () {
    block_ajax_ui();
    var send_data = $.param({"id": $('#ref_id').val() });
    var adata = ajax_call_no_alert("Api/generateimporttemplate",send_data  );
    if(adata.type=="success")
    {
        var win = window.open(adata.url, '_blank');
        if (win) {
            //Browser has allowed it to be opened
            win.focus();
        } else {
            //Browser has blocked it
            alert('Please allow popups for this website');
        }
    }
    unblock_ajax_ui();
});


function renderFormInput(id) {
   var adata = ajax_call_no_alert("Api/form_question_data/" + id );
    $("#form-question-output").empty();
    var  outputForm = $("#form-question-output");
    var form = new FormForm( outputForm, adata );
    form.render();
} 

$('#save_btn').on('click', function () {
    var send_data = $("#form-question-output").serialize();
    var adata = ajax_call("Api/save_values/"+$('#ref_id').val(),send_data );
    if(adata.type=="success")
    {
       enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable","","","",send_id);
       renderFormInput($('#ref_id').val());
       return false;
    }
});

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
       var adata = ajax_call("Api/ajax_apidatadelete",send_data );
        if (adata.type == "success") {
            $('#edm_dataTable_'+id).remove();
            enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action_api,"","",send_id);
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
     var send_data = $.param({"id": id , "ref_id":$("#ref_id").val()});
     var adata = ajax_call_no_alert("Api/ajax_getsingleapirow",send_data );
     if (adata.type == "success") {
        for (var i = adata.data.length - 1; i >= 0; i--) {
            
            $.each(adata.data[i], function(key, value) {
                fillatt(value,'[name="'+key+'"]',"val" );
            });
        }   
     }
  });



$(document).on('click','#importdata_btn',function(e){
  $("#upload_prospect_file").attr('disabled',false);
  $('#modalbulkupload').appendTo("body").modal('show');
})



 $("#upload_prospect_file").click(function (argument) {
   block_ajax_ui("body");
   $("#upload_prospect_file").attr('disabled',true);
   var url =site_url + "api/upload_api_bulk/" +  $("#ref_id").val() ;
   event.preventDefault();
   var send_data = new FormData($("#form_prospet_bulk_upload")[0]);

   $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        data: send_data,
        processData: false,
        contentType: false,
        success: function (data, status)
        {
          if (data.type == "success") {
            $("#exampleFile").val("");
            Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
              confirmButtonClass: data.confirmButtonClass,
            });
            enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action_api,"","",send_id);
          }
          else
          {
            Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
            });
          }
          unblock_ajax_ui("body");
          $("#upload_prospect_file").attr('disabled',false);;
        },
        error: function (xhr, desc, err)
        {
          unblock_ajax_ui("body");
          $("#upload_prospect_file").attr('disabled',false);;
          Swal.fire({
              type: "danger",
              title: "Pleas contact help desk.",
              text: "Please Check your file and try re-uploading",
              
            });
        }
    });
    });