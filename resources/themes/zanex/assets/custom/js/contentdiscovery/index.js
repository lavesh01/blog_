$("#upload_prospect_file").click(function (argument) {
    if ($("#datasource").val() == "") {
      Swal.fire({
              type: "warning",
              title: "Please Select Datasource",
            });
      return false;
    }
   block_ajax_ui();
   var campaign_id = $("#campaign_id").val();
   var url =site_url + "Prospects/upload_prospect_bulk/"  + campaign_id;
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
        }
    });
   return false;
});


$(".checkbox_datatable").change(function() {
      if(this.checked) {
          ajax_call('ContentDiscovery/enableuploadedlist', "name="+$(this).attr("id")+"&select=2" );
      }
      else
      {
        ajax_call('ContentDiscovery/enableuploadedlist', "name="+$(this).attr("id")+"&select=1" );
      }
  });