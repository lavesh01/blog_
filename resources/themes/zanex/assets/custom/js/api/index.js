  var action = [
          { "class":"delete","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#", "title":"Delete"},
          { "class":"sync","icon":"fa fa-keyboard icon-gradient bg-mixed-hopes", "id":"sync_", "href": "#",
           "title":"Check status"},
           { "class":"apipush","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"upload_", "href": "#",
           "title":"Push Lead API"}
        ];
    var action_api = [
           { "class":"apiaddinput","icon":"fa fa-plus icon-gradient bg-premium-dark", "id":"apiaddinput_", "href": "#",
           "title":"Add Input Fields"},
           { "class":"apishowinput","icon":"fa fa-arrow-circle-right icon-gradient bg-sunny-morning", "id":"apishowinput_", "href":"#" ,
           "title":"View Input Fields"},
           { "class":"apiredirct","icon":"fa fa-link icon-gradient bg-plum-plate", "id":"apiredirct_", "href": site_url + '/Api/api/',
           "title":"Add Data"},
           { "class":"apidelete","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href": "#",
           "title":"Push Lead API"}
        ];

$("#inputype").change(function() {
    if ($("#inputype").val() =="select" || $("#inputype").val() =="selectmultiple" || $("#inputype").val() =="select2" || $("#inputype").val() =="selectmultiple2" ) {
      $("#placeholder").attr("placeholder","|| seperated values");
    } 
    else{
       $("#placeholder").attr("placeholder","placeholder");
    }
});





$(document).ready(function() {
    $("#add_user").click(function (argument) {
      $('#modal_create_api').appendTo("body").modal('show');
    })
});

$('#save_btn').on('click', function () {

    var name = $('#name').val();
    var startdate = $('#startdate').val();
    var enddate = $('#enddate').val();
    var send_data = $("#insert_api_details").serialize();
    var adata = ajax_call("Api/add_new_api",send_data );
    if(adata.type=="success")
    {
       enable_common_dataTable( 'Api/ajax_getallapi' ,"#api_dataTable",action_api,"","");
       //$("#insert_api_details").reset();
       $('#modal_create_api').modal('hide');
       return false;
    }
    
});

enable_common_dataTable( 'Api/ajax_getallapi' ,"#api_dataTable",action_api,"","");

$(document).on('click','.apiaddinput',function(e){

     var id = $(this).attr("id").replace("apiaddinput_","");
     $('#addinputmodal').appendTo("body").modal('show');
     $("#ref_id").val(id);
});

$(document).on('click','.apishowinput',function(e){

     var id = $(this).attr("id").replace("apishowinput_","");
     $("#ref_id").val(id);
     renderFormInput(id);

});

$('#add_new_field').on('click', function (e) {
      e.preventDefault();
    var id = $("#ref_id").val();
    var send_data = $("#addinputmodalform").serialize();
    var adata = ajax_call("Api/add_new_question/" + id,send_data );
    $("#form-question-output").empty();
    var  outputForm = $("#form-question-output");
    var form = new FormForm( outputForm, adata.api_inputs );
    form.render();
    question_delete_add_button();
  });


function renderFormInput(id) {

   var adata = ajax_call_no_alert("Api/form_question_data/" + id );
    $("#form-question-output").empty();
    var  outputForm = $("#form-question-output");
    outputForm.addClass('ui-sortable');
    var form = new FormForm( outputForm, adata );
    form.render();
    question_delete_add_button();
    if(adata.length == 0)
    {
      outputForm.html('No Records Found');
    }
    
}  

function getOrder(){
    var order= $(".form-group.ui-sortable-handle").map(function() {        
        return $(this).data("id") ;        
    }).get();
    //console.log(order);
    f='order='+order;
    $.ajax({
        type: "POST",
        data :f,
        cache: false,
        url: site_url+"Api/ajax_order_status",
        success: function(data){
            //success
        }
    });
    return order;
}

function sortable()
{
  var fixHelper = function(e, ui) {
    ui.children().each(function() {
      $(this).width($(this).width());
    });
    return ui;
  };

  $("#form-question-output").sortable({
    helper: fixHelper,
    update: function(event, ui) { 
            getOrder() 
        }
  }).disableSelection();
}


function question_delete_add_button() {
  var  outputForm = $("#form-question-output");
  var question_detele_html = '<span class="float-right question_detele"><i class="fa fa-trash icon-gradient bg-love-kiss"></i></span>';
  outputForm.find(".form-group").prepend(question_detele_html);
  outputForm.find(".form-group").addClass('ui-sortable-handle');
  sortable();
    $('.question_detele').click(function() {
      var id = $(this).closest(".form-group").data("id");
      var send_data = $.param({"id":id});
       
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
       
        var adata = ajax_call_no_alert("Api/delete_input/",send_data );
        if (adata.type == "success") {
            $(this).closest(".form-group").remove();
            renderFormInput( $("#ref_id").val());
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
}


/*
$(document).on('click','#Search_number_ctps',function(e){
    e.preventDefault();
     var send_data = $("#form_api").serialize();
     var adata = ajax_call("Api/add",send_data );
     if(adata.type == "success")
     {
      enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");
     }
});
//var dt = enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");

$(document).on('click','.delete',function(e){

     var id = $(this).attr("id").replace("delete_","");
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
       var adata = ajax_call("Api/ajax_delete",send_data );
        enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");
        unblock_ajax_ui();

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


$(document).on('click','.sync',function(e){
  block_ajax_ui();
  var id = $(this).attr("id").replace("sync_","");
  $.ajax({
      type: "POST",
      cache:false,
      dataType: "JSON",
      url: site_url + 'Api/getStatus/'+ id,
      success: function (data) {
        //console.log(data);

        
        Swal.fire({

          title: data.title,

          text: data.text,

          type: data.type,

          confirmButtonClass: data.confirmButtonClass,
          
        })
       if (data.type != "info") {enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");}
       unblock_ajax_ui();
      },
      error: function (data) {
        console.log("error");
         console.log(data);
        unblock_ajax_ui();
      }
  });
});

$(document).on('click','.apipush',function(e){

     var id = $(this).attr("id").replace("upload_","");
     Swal.fire({

      title: 'Are you sure?',

      text: "",

      type: 'warning',

      showCancelButton: true,

      confirmButtonColor: '#3085d6',

      cancelButtonColor: '#d33',

      confirmButtonText: 'Yes, push it!',

      confirmButtonClass: 'btn btn-warning',

      cancelButtonClass: 'btn btn-danger ml-1',

      buttonsStyling: false,

    }).then(function (result) {

      if (result.value) {
         block_ajax_ui();
         $.ajax({
            type: "POST",
            cache:false,
            dataType: "JSON",
            url: site_url + 'Api/putdataapi/'+ id,
            success: function (data) {
             enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");
             unblock_ajax_ui();
            },
            error: function (data) {
             unblock_ajax_ui();
            }
        });

      } else if (result.dismiss === Swal.DismissReason.cancel) {

        Swal.fire({

          title: 'Cancelled',

          text: 'Lead is not pushed :)',

          type: 'error',

          confirmButtonClass: 'btn btn-success',

        })

      }

    })

  });
*/

$(document).on('click','.apidelete',function(e){
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
       var adata = ajax_call("Api/ajax_apidelete",send_data );
       $('#api_dataTable_'+id).remove();
        //enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");
        unblock_ajax_ui();

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
