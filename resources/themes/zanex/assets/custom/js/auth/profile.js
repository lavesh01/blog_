

$("#update_userprofile_details").click(function (argument) {
argument.preventDefault();
 block_ajax_ui();
  var username = $("#username").val();
  var url =site_url + "/Auth_ajax/updateUserDetails/"  + username;
   
   var send_data = $("#user_profile_update_Details")[0];
   $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        data: new FormData(send_data),
        processData: false,
        contentType: false,
        success: function (data, status)
        {
            //console.log(data);

          if (data.type == "success") {
              //$('#icon-tabs').load(location.href + " #icon-tabs");
               Swal.fire({
                type: data.type,
                title: data.title,
                text: data.text,
                confirmButtonClass: data.confirmButtonClass,
              });
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
          console.log("error");
        }
        
    });

});





$("#update_userprofile_detailssss").click(function (argument) {

 block_ajax_ui();
  var display_name = $("#display_name").val();
  var url =site_url + "/Auth_ajax/updateUserDetailsUser/"  + display_name;
   event.preventDefault();
   var send_data = $("#user_profile_update_Detailss")[0];
   $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        data: new FormData(send_data),
        processData: false,
        contentType: false,
        success: function (data, status)
        {
            console.log(data);

          if (data.type == "success") {
             $('#icon-tabs').load(location.href + " #icon-tabs");
             swal("Profile Updated", "Details Updated Successfully", "success")
            
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
          console.log("error");
        }
        
    });

});

function checkEmailID()
{
  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var email=$('#email').val();
    if(!regex.test(email))
    {
      $('#email').val("");
      $('#email').focus();
      swal("Invalid..!", "Enter Valid Email ID")
      return false;
    } 
} 


function matchPassword()
{
    var new_password=$('#new_password').val();
    var confirm_password=$('#confirm_password').val();
    if(new_password!=confirm_password)
    {
        $('#confirm_password').val("");
        $('#confirm_password').focus();
        swal("Invalid..!", "new password and confirm password must be same")
        return false;
    }
}


function reset()
{
  $('#new_password').val('');
  $('#confirm_password').val('');
}

$('#update_user_password').on('click', function () {
    var send_data = $("#user_profile_update_Details").serialize();
    var adata = ajax_call("Auth_ajax/changeUserPassword",send_data);
    return false;
  });