$("#save_quality_disposition_suppression").click(function (){
  
  var quality_dnc = $("input[name='quality_dnc']:checked").val();
  var quality_sub_disposition = $("#quality_sub_disposition").val();
  var quality_disposition = $("#quality_disposition").val();
  var quality_notes = $("#quality_notes").val();
  var quality_isqulified = $("input[name='quality_isqulified']:checked").val() ;
  var quality_sub_disposition = $("#quality_sub_disposition").val();
  var prospect_id = $("#prospect_id").val();
  var company_id = $("#company_id").val();
  var agent_consent = $("#agent_consent").val();
  var agent_web_verification = $("#agent_web_verification").val();
  var lead_id = $("#lead_id").val();
  var campaign_id = $("#campaign_id").val();
  var dnc_office_number = $("#dnc_office_number").val();
  var dnc_mobile_number = $("#dnc_mobile_number").val();
  //var client_alias_id = $("#client_alias_id").val();
  
  if (agent_disposition == "" || agent_disposition === null) { 
    Swal.fire({
              type: "danger",
              title: "Missing  Disposition"
            });
    return;
  }

  if ( agent_sub_disposition == "" || agent_sub_disposition === null ) { 
    Swal.fire({
              type: "danger",
              title: "Missing Sub Disposition"
            });
    return;
  }

  if ( agent_consent === "undefined" || agent_consent === null || agent_consent == "") { 
    agent_consent = 0;
  }


  if ( agent_web_verification === "undefined" || agent_web_verification === null || agent_web_verification == "") { 
    agent_web_verification = 0;
  }


  if (typeof  quality_isqulified === "undefined" || quality_isqulified === null || quality_isqulified == "") { 
    Swal.fire({
              type: "danger",
              title: "Is lead Qualified Or not? Please Select radio button"
            });
    return;
  }

  var send_data = $.param({"prospect_id":prospect_id,"lead_id":lead_id,"campaign_id":campaign_id, "dnc_mobile_number":dnc_mobile_number,
                          "dnc_office_number":dnc_office_number,"company_id":company_id,
                          "quality_dnc":quality_dnc, "quality_sub_disposition":quality_sub_disposition,
                          "quality_disposition":quality_disposition,"quality_notes":quality_notes,"quality_isqulified":quality_isqulified });
  var adata = ajax_call("lead_ajax/save_quality_disposition/",send_data );
  
}); 



function qualitygetSubDispositions()
{
      
  var quality_disposition = $('#quality_disposition').val();
     
  if(quality_disposition != '')
  {
   $.ajax({  
    url:site_url + "Quality/quality_sub_disposition",
    method:"POST",
    data:{quality_disposition:quality_disposition},
    success:function(data)
    {
     
     $('#quality_sub_disposition').html(data);
    }
   });
  }
  else
  {
   $('#quality_sub_disposition').html('<option value="">Select</option>');
  }
}




$( document ).ready(function() {
   $('a.inline_editable:contains("http")').each(function () {
            $(this).after('<a style="font-size: larger;padding-left: 20px;padding-top: 5px;" target="_blank" href="' + $(this).text() + '"<i class="fa fa-chevron-circle-right"></i><a>');
        });
});