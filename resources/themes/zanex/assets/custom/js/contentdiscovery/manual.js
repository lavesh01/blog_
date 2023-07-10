$('#prospect_next_btn').on('click', function (e) {
	e.preventDefault();
     
    block_ajax_ui();
    var send_data = $("#prospect_form").serialize();
    var adata = ajax_call("Prospects/save_prospect/"+$('#campaign_id').val(),send_data );
    if (adata.type == "success") {
       $("#prospect_form")[0].reset();
       $.ajax({
       url:site_url + "Lead_ajax/lead_detail_counts/"+$('#campaign_id').val(),
       method:"POST",
       dataType:"json", 
       success:function(res)
       {
          $("#total_qualified_lead").text(res.total_qualified_lead);
          $("#getAvailabletocall").text(res.getAvailabletocall);
          $("#disposed_lead").text(res.disposed_lead);
          $("#total_qualified_lead").text(res.disqualified_lead);
          unblock_ajax_ui();
       }
      }); 
    }
    unblock_ajax_ui();
    return false;
});

/*
function getState(){
  var country_id = $('#p_country').val();
  if(country_id != '')
  {
   $.ajax({
    url:site_url + "sales_ajax/fetch_state",
    method:"POST",
    data:{country_id:country_id},
    success:function(data)
    {
     
     $('#p_state').html(data);
    }
   });
  }
  else
  {
   $('#p_state').html('<option value="">Select</option>');
  }
 }
*/