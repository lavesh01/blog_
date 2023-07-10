var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {


	var action = ""
  var campaign_id = $("#Campaign_id").val();
  var send_rejection_data  = $.param({'campaign_id':campaign_id});
  enable_common_dataTable( 'Sales_ajax/clientRejectionLlist',htmldatatable_id,action,"",send_data);

 } );


//Open Modal Popup
$(document).ready(function() {
    
      $("#upload_rejection").click(function (argument) {
      $('#client_rejection_modal').appendTo("body").modal('show');
    })



 $('#submit_rejection').on('click', function () 
{
    var email = $('#email').val();
    var rejection_reason = $('#rejection_reason').val();
    var notes = $('#notes').val();
    
  
     if(email=="")
    {
      swal("Email ID Missing","Enter Email ID");
      return false;
    }else
    {
      var regEx = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      var validEmail = regEx.test(email);
      if (!validEmail) {
        swal("Email ID Missing","Enter Correct Email ID");
        return false;
      }
    }

   if(rejection_reason=="")
    {
      swal("Reason Missing","Enter Rejection Reason");
      return false;
    }
   if(notes=="")
    {
      swal("Notes Missing","Enter Rejection Notes");
      return false;
    }

      var send_data = $("#new_user_form").serialize();
      var adata = ajax_call("Sales_ajax/update_rejection_status",send_data );
       if(adata.type=="info")
       {
          $('#client_rejection_modal').modal('show');
 
      }
      else if(adata.type=="warning")
       {

          $('#email').val('');
          $('#client_rejection_modal').modal('show');

       }
       else if(adata.type=="success")
       {
          $('#email').val('');$('#rejection_reason').val('');$('#notes').val('');
          $('#client_rejection_modal').modal('hide');
           draw_table();
            return false;
       }


});


} );

var htmldatatable_id = "#common_dataTable";
var dt_test;
function draw_table(type="") {
 

  var campaign_id = $("#Campaign_id").val();
  var send_rejection_data  = $.param({'campaign_id':campaign_id});
  var action = ""
  if (type=="") {
    dt_test = enable_common_dataTable( 'Sales_ajax/clientRejectionLlist' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'Sales_ajax/clientRejectionLlist' ,htmldatatable_id,action);

  }

}



