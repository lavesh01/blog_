//
$(document).ready(function() {
  $(".enable_lead").hide();
  $("#div_campaign_custom_quetions").hide();
});
function  formrenerdingquestion(data) {
     $("#form-question-output").text("");
     var  outputForm = $("#form-question-output");
     if (data.length > 0) {
        form = new FormForm( outputForm, data );
        form.render();
        $("#div_campaign_custom_quetions").show();
     }
     else{
      $("#form-question-output").text("No Question");
      $("#div_campaign_custom_quetions").hide();
     }
}
ajax_call_no_alert("campaign_ajax/form_question_data/" +$("#campaign_id").val(),"",true,"JSON","formrenerdingquestion(adata)");


$('#campaign_custom_quetions').on('click', function (e) {
	e.preventDefault();
    var send_data = $("#form-question-output").serialize();
    var adata = ajax_call("Agent_ajax_dailer/replaceformquestopn/"+ $('#campaign_id').val()+ '/'+$("#lead_id").val(),send_data );

    if (adata.type == "success") {

	    
    }
    return false;
});


function refresh_count()
{
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
          
          var newurl = site_url+ 'Agent/manual/' + $('#campaign_id').val()+ '/' + $("#prospect_id").val() + '/'+$("#lead_id").val();
          window.history.pushState({path:newurl},'',newurl);
          enable_lead_calling_disposition();
          
          unblock_ajax_ui();
       }
      });
}
$('#prospect_next_btn').on('click', function (e) {
   e.preventDefault();
     
    block_ajax_ui();
    var send_data = $("#prospect_form").serialize();
    var adata = ajax_call("Prospects/save_prospect/"+$('#campaign_id').val(),send_data );
    if (adata.type == "success" || adata.type == "info") {
       
       $("#prospect_id").val(adata.prospect_id);
       $("#lead_id").val(adata.leadid);
       refresh_count();
       $("#reset-btn").hide();
      $("#prospect_next_btn").hide();
    }
    unblock_ajax_ui();
    return false;
});


function reset_forms_for_new_lead()
{
    

    $('#prospect_form').trigger("reset");
    $('#form-question-output').trigger("reset");
    $('#form_dispostion').trigger("reset");
    $("#reset-btn").show();
    $("#prospect_next_btn").show();
    $(".enable_lead").hide();
    $("#tabid_0").removeClass('show active');
    $("#tabid_2").removeClass('show active');
    $("#tabid_3").removeClass('show active');
    $('.tab-pane').removeClass('show active');
    $("#tabid_0").addClass('show active');
    $("#tab-content-0").addClass('show active');
    $("#tab-call-0").addClass('show active');
      $("#audio_li").html('');

    var newurl = site_url+ 'Agent/manual/' + $('#campaign_id').val();
    window.history.pushState({path:newurl},'',newurl);
}
$("#agent_tech_tag").tagging();


function enable_lead_calling_disposition() {
	$('.enable_lead').show();
}

$("#save_disposition_suppression").click(function (){
	/*
  if ($("#audio_li li" ).length == 0) {
		Swal.fire({
              type: "danger",
              text: "Uplaod audio file or dial before submitting lead",
              title: "Audio Missing"
            });
		return;
	}
  */
	var agent_dnc = $("input[name='agent_dnc']:checked").val()
	var agent_sub_disposition = $("#agent_sub_disposition").val()
	var agent_disposition = $("#agent_disposition").val()
	var agent_consent = $("input[name='agent_consent']:checked").val()
	var agent_web_verified = $("input[name='agent_web_verified']:checked").val()
	var agent_notes = $("#agent_notes").val()
	var agent_tech_tag = $("#agent_tech_tag" ).tagging( "getTags" );
	var prospect_id = $("#prospect_id").val();
	var lead_id = $("#lead_id").val();
	var campaign_id = $("#campaign_id").val();
	var client_alias_id = $("#client_alias_id").val();
	if (agent_disposition == "" || agent_disposition === null) { 
		Swal.fire({
              type: "danger",
              title: "Missing Disposition"
            });

		return;
	}

	if (typeof  agent_sub_disposition == "" || agent_sub_disposition === null) { 
		Swal.fire({
              type: "danger",
              title: "Missing Sub Disposition"
            });
        return;
	}

	if (typeof  agent_dnc === "undefined" || agent_dnc === null) { 
		agent_dnc = 0;
	}

	if (typeof  agent_consent === "undefined" || agent_consent === null) { 
		agent_consent = 0;
	}

	if (typeof  agent_web_verified === "undefined" || agent_web_verified === null) { 
		agent_web_verified = 0;
	}

	var send_data = $.param({"agent_dnc":agent_dnc,"agent_sub_disposition":agent_sub_disposition,"agent_disposition":agent_disposition,
							"agent_consent":agent_consent, "agent_web_verified":agent_web_verified, "agent_notes":agent_notes,
							"agent_tech_tag":agent_tech_tag, "prospect_id":prospect_id,"lead_id":lead_id,"client_alias_id":client_alias_id
							  });
	var data = ajax_call_no_alert("Agent_ajax_dailer/save_lead_disposition/"+$("#campaign_id").val(),send_data );
   if (data.type == "success") {
      refresh_count();
      

          Swal.fire({

     type: data.type,
      title: data.title,
      text: data.text,

      showCancelButton: true,

      confirmButtonColor: '',

      cancelButtonColor: '#d33',

      confirmButtonText: 'Add more lead?',

      confirmButtonClass: 'btn btn-info',

      cancelButtonClass: 'btn btn-success ml-1',

      buttonsStyling: false,

    }).then(function (result) {

      if (result.value) {
        reset_forms_for_new_lead();
      } 

    })
   }
	//console.log(adata);
});	


$("#save_audio_files").click(function (argument) {
   block_ajax_ui();
   var campaign_id = $("#Campaign_id").val();
   //var url =site_url + "/Agent_ajax_dailer/upload_audio/"  + campaign_id;
   var url =site_url + "Agent_ajax_dailer/upload_audio/"  + campaign_id;
   event.preventDefault();
   var send_data = $("#form_audio_upload")[0];
   var prospect_id = $("#prospect_id").val();
   var lead_id = $("#lead_id").val();
   //send_data.append("prospect_id",prospect_id);
   //send_data.append("lead_id",lead_id);
   //send_data =  send_data.append("prospect_id",5);
   //send_data =  send_data.append("lead_id",60);
   var send_data = new FormData(send_data);
   send_data.append("prospect_id",prospect_id);
   send_data.append("lead_id",lead_id);
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
            add_external_supp_li(site_url + data.url, data.mime_type);
            $("#file_suppression").val("");
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

});


function add_external_supp_li(filepath,mime_type) {
   var li =  '<li class="list-group-item"><div class="widget-content p-0">'+
    '<div class="widget-content-wrapper">'+
    '<div class="widget-content-left flex2"><div class="widget-heading">'+
    '<audio controls style="width:250px;">'+
  '<source src="'+filepath+'" type="'+mime_type+'">'+
   'Your browser does not support the audio element.'+
  '</audio>'+
    '</div></div></div></div></li>';
    $("#audio_li").html(li);
   
}


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


function getSubDispositions()
{
      
  var agent_disposition = $('#agent_disposition').val();
     
  if(agent_disposition != '')
  {
   $.ajax({  
    url:site_url + "Agent_ajax_dailer/fetch_sub_dispositions",
    method:"POST",
    data:{agent_disposition:agent_disposition},
    success:function(data)
    {
     
     $('#agent_sub_disposition').html(data);
    }
   });
  }
  else
  {
   $('#agent_sub_disposition').html('<option value="">Select</option>');
  }
}




$(".callnow").on("click", function (event) {
    var calling_number = $(this).parent("div").parent(".row").find('input').val(); //$(this).parent(".input-group").find('input').val();
    $('#calling_number').val(calling_number);
    //alert(calling_number);
    if (calling_number == "" || validatePhoneNumber(calling_number) == false) {
      Swal.fire({
              type: "error",
              title: "Not A Valid Phone Number",
              confirmButtonClass: "danger",
            });
      return false;
    }
    var send_data = $.param({"log":"nolog", "type":'Number', "txt_Search_number_ctps":calling_number});

    var adata_dnc = ajax_call_no_alert("Dnc/ajax_search/",send_data);
    if (adata_dnc.return == 1)
    {
      Swal.fire({
              type: "error",
              title: "Number is in DNC",
              confirmButtonClass: "danger",
            });
       return false;
    }
    

      let data = { message: "DIAL_NUMBER", phoneNumber: $("#calling_number").val(), lead_id: $("#lead_id").val() , 
                provider: "moitel", customer_id :$("#customer_id").val() , user_id :$("#user_id").val() };
      let iframe = document.getElementById('webphoneframe'); 
      iframe.contentWindow.postMessage (data, 'https://dialer.moitele.com');
});

$(".callnowbar").on("click", function (event) {
    var calling_number = $(this).parent("div").parent(".row").find('input').val(); //$(this).parent(".input-group").find('input').val();
    $('#calling_number').val(calling_number);
    //alert(calling_number);
    if (calling_number == "" || validatePhoneNumber(calling_number) == false) {
      Swal.fire({
              type: "error",
              title: "Not A Valid Phone Number",
              confirmButtonClass: "danger",
            });
      return false;
    }
    var send_data = $.param({"log":"nolog", "type":'Number', "txt_Search_number_ctps":calling_number});

    var adata_dnc = ajax_call_no_alert("Dnc/ajax_search/",send_data);
    if (adata_dnc.return == 1)
    {
      Swal.fire({
              type: "error",
              title: "Number is in DNC",
              confirmButtonClass: "danger",
            });
       return false;
    }

      let data = { message: "DIAL_NUMBER", phoneNumber: $("#calling_number").val(), lead_id: $("#lead_id").val() , 
                provider: "moitel", customer_id :$("#customer_id").val() , user_id :$("#user_id").val() };
      let iframe = document.getElementById('webphoneframe'); 
      iframe.contentWindow.postMessage (data, 'https://dialer.moitele.com');
});


$(document).on('click','#save_callback',function(){
  $('#CallBackModel').appendTo("body").modal('show');
});

$(document).on('click','#schedule_callback',function(){

  var send_data = "campaign_id="+$("#campaign_id").val()+"&lead_id="+$("#lead_id").val()+"&schedule_callback="+$("#inputcallback").val();
  var adata = ajax_call("Lead_ajax/schedule_callback",send_data,false,2);
  if (adata.type == "success") {
    $('#CallBackModel').modal('toggle');
     reset_forms_for_new_lead();
    }
  
});