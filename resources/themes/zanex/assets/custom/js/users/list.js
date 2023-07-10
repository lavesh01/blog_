

$(document).ready(function () {       

 $('.delete_class').on('click', function () {

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

        var adata = ajax_call("users_ajax/delete_user",send_data);

        console.log(adata.type);

        if (adata.type == "success") {

          $("#dttr_" + $("#ajax_id").val()).remove();

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



  $('#save_btn').on('click', function () {

    var send_data = $("#new_user_form").serialize();

    var adata = ajax_call("users_ajax/add_new_user",send_data );

    console.log(adata);

    return false;

  });



});







$(document).ready(function() {

    


      $("#add_user").click(function (argument) {

      $('#userModel').appendTo("body").modal('show');

    })

} );