
 $('#save_btn').on('click', function () {
    var send_data = $("#new_user_form").serialize();
    var adata = ajax_call("users_ajax/add_new_customer",send_data );
    
    return false;
  });



$('#add_user').on('click', function (e) {
	$('#userModel').appendTo("body").modal('show');
});


