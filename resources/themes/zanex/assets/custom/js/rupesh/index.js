  var action = [
          { "class":"delete","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#", "title":"Delete"},
          { "class":"sync","icon":"fa fa-keyboard icon-gradient bg-mixed-hopes", "id":"sync_", "href": "#",
           "title":"Check status"},
           { "class":"apipush","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"upload_", "href": "#",
           "title":"Push Lead API"},
        
        ];

$(document).on('click','#Search_number_ctps',function(e){
    e.preventDefault();
     var send_data = $("#form_api").serialize();
     var adata = ajax_call("Api/add",send_data );
     if(adata.type == "success")
     {
      enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");
     }
});


var dt = enable_common_dataTable( 'Api/ajax_getall' ,"#edm_dataTable",action,"","");
   


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