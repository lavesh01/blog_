$("#upload_prospect_file").click(function (argument) {
    if ($("#datasource").val() == "") {
      Swal.fire({
              type: "warning",
              title: "Please Select Datasource",
            });
      return false;
    }
   block_ajax_ui();
   
   var url =site_url + "Landingpage/upload_html_file/";
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
            window.location.reload();       
          }
          else
          {
            Swal.fire({
              type: data.type,
              title: data.title,
              text: data.text,
              confirmButtonClass: data.confirmButtonClass,
            });
          }
          unblock_ajax_ui();
        },
        error: function (xhr, desc, err)
        {
          unblock_ajax_ui();
          Swal.fire({
              type: "error",
              title: xhr.responseText ,
              text: "",
            });
        }
    });
   return false;
});


// Datatables

$( document ).ready(function() {

    $('#example').DataTable({
            scrollCollapse: true,
            paging:         true,
            "searching": true,
            "info": true
        });

    document.addEventListener("DOMContentLoaded", () => {
    var input = document.getElementById("unique_url");
    input.oninput = function (e) {
          e.target.value = e.target.value.replace(' ', '-');
        }
    });


//Delete Users
$(document).on('click','.delete_users',function(){

 var delete_id = $(this).attr('id').replace("delete_","");
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
        var send_data = $.param({"delete_id":delete_id}) ;
        var adata = ajax_call("Landingpage/delete/"+delete_id,send_data);
        if (adata.type == "success") {
         window.location.reload();  
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

});

