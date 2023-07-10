
$(document).ready(function () {       
 

  $('#save_btn').on('click', function () {
    var send_data = $("#new_agentsub_disposition_form").serialize();
    var adata = ajax_call("users_ajax/add_agentsub_dispositions",send_data );
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