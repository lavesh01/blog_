
var aocolumnDefs =   [ ];
var action = [];


$(document).ready(function() {
    select2_ajax("#txt_Search_company", "/Prospects/company_search", "Select Company");
    select2_ajax("#campaignname_select", "/Campaign_ajax/ajax_select2_campaign_name", "Select Campaign");
    $('#agent_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
    $('#agent_sub_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
    $('.search-box-sel-all').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
    $('.search-box-sel-all_sub_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
    leadSearch();
});



$('#Search_prospect').on('click', function () {
    leadSearch();
});


function leadSearch(argument) {
    checkbox_datatable = [];
    //$("#selectAll").prop('checked', false);
    var send_data = [];
    if ($('#campaign_id').length !== 0 ){
        send_data.push({'key':'campaignname_select', 'value' : $("#campaign_id").val()});
    }
    else
    {
        if ($('#campaignname_select').length !== 0 ){
            send_data.push({'key':'campaignname_select', 'value' : sumoselectretunvaue('#campaignname_select')});
        }
    }
    if ($('#agent_disposition').length !== 0 ){
        send_data.push({'key':'agent_disposition', 'value' : sumoselectretunvaue('#agent_disposition')});
    }
    if ($('#agent_sub_disposition').length !== 0 ){
        send_data.push({'key':'agent_sub_disposition', 'value' : sumoselectretunvaue('#agent_sub_disposition')});
    }
    if ($('#select_job_level').length !== 0 ){
        send_data.push({'key':'select_job_level', 'value' : sumoselectretunvaue('#select_job_level')});
    }
    if ($('#select_job_function').length !== 0 ){
        send_data.push({'key':'select_job_function', 'value' : sumoselectretunvaue('#select_job_function')});
    }
    if ($('#select_industry').length !== 0 ){
        send_data.push({'key':'select_industry', 'value' : sumoselectretunvaue('#select_industry')});
    }
    if ($('#select_employee').length !== 0 ){
        send_data.push({'key':'select_employee', 'value' : sumoselectretunvaue('#select_employee')});
    }
    if ($('#select_country').length !== 0 ){
        send_data.push({'key':'select_country', 'value' : sumoselectretunvaue('#select_country')});
    }
    if ($('#select2_revenue').length !== 0 ){
        send_data.push({'key':'select2_revenue', 'value' : sumoselectretunvaue('#select2_revenue')});
    }
    if ($('#txt_Search_number_ctps').length !== 0 ){
        send_data.push({'key':'txt_Search_number_ctps' , 'value' : $('#txt_Search_number_ctps').val()});
    }
    if ($('#txt_company_tech').length !== 0 ){
        send_data.push({'key':'txt_company_tech' , 'value' : $('#txt_company_tech').val()});
    }
    if ($('#txt_Prospect_tech').length !== 0 ){
        send_data.push({'key':'txt_Prospect_tech' , 'value' : $('#txt_Prospect_tech').val()});
    }
    if ($('#quality_disposition').length !== 0 ){
        send_data.push({'key':'quality_disposition', 'value' : sumoselectretunvaue('#quality_disposition')});
    }
    if ($('#quality_sub_disposition').length !== 0 ){
        send_data.push({'key':'quality_sub_disposition', 'value' : sumoselectretunvaue('#quality_sub_disposition')});
    }
    if ($('#select2_campaign_status').length !== 0 ){
        send_data.push({'key':'select2_campaign_status', 'value' : sumoselectretunvaue('#select2_campaign_status')});
    }
    if ($('#campaignname_select').length !== 0 ){
        send_data.push({'key':'campaignname_select', 'value' : sumoselectretunvaue('#campaignname_select')});
    }
    if ($('#select_agent_username').length !== 0 ){
        send_data.push({'key':'select_agent_username', 'value' : sumoselectretunvaue('#select_agent_username')});
    }
    if ($('#select_quality_username').length !== 0 ){
        send_data.push({'key':'select_quality_username', 'value' : sumoselectretunvaue('#select_quality_username')});
    }

    if ($('#txt_first_name').length !== 0 ){
        send_data.push({'key':'txt_first_name', 'value' : $('#txt_first_name').val()});
    }
    if ($('#txt_last_name').length !== 0 ){
        send_data.push({'key':'txt_last_name', 'value' : $('#txt_last_name').val()});
    }

    if ($('#prospect_date_start_time').length !== 0 ){
        send_data.push({'key':'prospect_date_start_time', 'value' : $('#prospect_date_start_time').val()});
    }
    if ($('#prospect_date_end_time').length !== 0 ){
        send_data.push({'key':'prospect_date_end_time', 'value' : $('#prospect_date_end_time').val()});
    }

    if ($('#agent_date_start_time').length !== 0 ){
        send_data.push({'key':'agent_date_start_time', 'value' : $('#agent_date_start_time').val()});
    }
    if ($('#agent_date_end_time').length !== 0 ){
        send_data.push({'key':'agent_date_end_time', 'value' : $('#agent_date_end_time').val()});
    }

    if ($('#quality_date_start_time').length !== 0 ){
        send_data.push({'key':'quality_date_start_time', 'value' : $('#quality_date_start_time').val()});
    }
    if ($('#quality_date_end_time').length !== 0 ){
        send_data.push({'key':'quality_date_end_time', 'value' : $('#quality_date_end_time').val()});
    }

    if ($('#agent_auto_dialer_include').length !== 0 ){
        if ($('#agent_auto_dialer_include').prop('checked')) {
             send_data.push({'key':'agent_auto_dialer_include' , 'value' : "1"});
        }
    }

    if ($('#agent_callback').length !== 0 ){
        if ($('#agent_callback').prop('checked')) {
             send_data.push({'key':'agent_callback' , 'value' : "1"});
        }
    }
    
    if ($('#agent_web_verified').length !== 0 ){
        if ($('#agent_web_verified').prop('checked')) {
             send_data.push({'key':'agent_web_verified' , 'value' : "1"});
        }
        else
        {
            send_data.push({'key':'agent_web_verified' , 'value' : "0"});
        }
    }

    if ($('#agent_consent').length !== 0 ){
        if ($('#agent_consent').prop('checked')) {
             send_data.push({'key':'agent_consent' , 'value' : "1"});
        }
        else
        {
            send_data.push({'key':'agent_consent' , 'value' : "0"});
        }
    }

    if ($('#dnc_prospect').length !== 0 ){
        if ($('#dnc_prospect').prop('checked')) {
             send_data.push({'key':'dnc_prospect' , 'value' : "1"});
        }
        else
        {
            send_data.push({'key':'dnc_prospect' , 'value' : "0"});
        }
    }

    if ($('#dnc_number').length !== 0 ){
        if ($('#dnc_number').prop('checked')) {
             send_data.push({'key':'dnc_number' , 'value' : "1"});
        }
        else
        {
            send_data.push({'key':'dnc_number' , 'value' : "0"});
        }
    }

    if ($('#dnc_company').length !== 0 ){
        if ($('#dnc_company').prop('checked')) {
             send_data.push({'key':'dnc_company' , 'value' : "1"});
        }
        else
        {
            send_data.push({'key':'dnc_company' , 'value' : "0"});
        }
    }

    if ($('#type').length === 0 ){
        send_data.push({'key':'type' , 'value' : "all"});
    }
    else{
        send_data.push({'key':'type' , 'value' : $('#type').val()});
    }
    enable_common_dataTable( 'lead_ajax/leadSearchuser' ,"#edm_dataTable",action,aocolumnDefs,"",
        send_data,[],"","campaigns.campaign_name");

}


function getSubDispositions()
{
      
  var agent_disposition = sumoselectretunvaue('#agent_disposition');// $('#agent_disposition').val();
     
  if(agent_disposition != '')
  {
   $.ajax({  
    url:site_url + "agent_ajax_dailer/fetch_sub_dispositions",
    method:"POST",
    data:{agent_disposition:agent_disposition},
    success:function(data)
    {
     $('#agent_sub_disposition').html('');
     $('#agent_sub_disposition').html(data);
     window.searchSelAll = $('.search-box-sel-all_sub_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
     $('.search-box-sel-all_sub_disposition')[0].sumo.reload();//Reload select
    }
   });
  }
  else
  {
   $('#agent_sub_disposition').html('<option value="">Select</option>');
  }
}

function getQualitySubDispositions()
{
      
  var quality_disposition = sumoselectretunvaue('#quality_disposition');// $('#quality_disposition').val();
     
  if(quality_disposition != '')
  {
   $.ajax({  
    url:site_url + "Quality/quality_sub_disposition",
    method:"POST",
    data:{quality_disposition:quality_disposition},
    success:function(data)
    {
     $('#quality_sub_disposition').html('');
     $('#quality_sub_disposition').html(data);
     window.searchSelAll = $('#quality_sub_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
     $('#quality_sub_disposition')[0].sumo.reload();//Reload select
    }
   });
  }
  else
  {
   $('#quality_sub_disposition').html('<option value="">Select</option>');
  }
}