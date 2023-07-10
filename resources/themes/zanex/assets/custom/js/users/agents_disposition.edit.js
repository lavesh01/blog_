
$(document).ready(function () {       
 

  $('#update_btn').on('click', function () {
    var send_data = $("#edit_agents_disposition").serialize();
    var adata = ajax_call("users_ajax/update_agent_disposition",send_data );
    console.log(adata);
    return false;
  });

});

$(document).ready(function() {
    //enable_common_dataTable();
    //open_common_htmlform_model("#popupbutton","Campaign_settings/htmlform/campaign-models-type");

    $("#add_user").click(function (argument) {
      $('#agentModel').appendTo("body").modal('show');
    })
} );

