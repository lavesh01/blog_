$('#save_btn').on('click', function (e) {
	e.preventDefault();
    var send_data = $("#new_user_form").serialize();
    var adata = ajax_call("users_ajax/add_new_admin",send_data );
    console.log(adata);
    return false;
  });




$('#add_user').on('click', function (e) {
	$('#userModel').appendTo("body").modal('show');
  });