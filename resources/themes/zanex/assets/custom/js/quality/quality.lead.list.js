
var aocolumnDefs =  [
                 {    
                      "aTargets": [0],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                        return  '<a title="Audit" href="'+site_url +'quality/details/'+full.campaign_id+'/'+full.prospect_id+'/'+full.id+'" data-toggle="tooltip" data-placement="top" class="fonticon-wrap" id="lead_id"><i class=" fa fa-eye icon-gradient bg-ripe-malin"></i></a> ';

                      }
                  },
                  { "bVisible": false, "aTargets": [ 1 ] },
                  { "bVisible": false, "aTargets": [ 2 ] },
                  {    
                      "aTargets": [3],
                      //"mData": "first_name",
                      "bSearchable": true,
                      "mRender": function (data, type, full) {
                        if(data == 0)
                        {
                            return "No";
                        }
                        else if(data == 1)
                        {
                            return "Prospect";
                        }
                        else if(data == 2)
                        {
                            return "Company";
                        }
                        else if(data == 3)
                        {
                            return "Number";
                        }
                        else
                        {
                            return "";
                        }
                      }
                   },
                    {    
                      "aTargets": [4],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                        if(data == 0)
                        {
                            return '<i data-toggle="tooltip" data-placement="top" title="Yes! Have Consent" class="fa fa-check icon-gradient bg-malibu-beach"></i>';
                        }
                        else if(data == 1)
                        {
                           return '<i data-toggle="tooltip" data-placement="top" title="No! Have No Consent" class="fa fa-times icon-gradient bg-love-kiss"></i>';
                        }
                        else
                        {
                            return "";
                        }

                      }
                   },
                   {    
                      "aTargets": [5],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                        if(data == 0)
                        {
                            return '<i data-toggle="tooltip" data-placement="top" title="Yes! Web Verified" class="pe-7s-check icon-gradient bg-malibu-beach"></i>';
                        }
                        else if(data == 1)
                        {
                           return '<i data-toggle="tooltip" data-placement="top" title="No! Not Web Verified" class="fa fa-times icon-gradient bg-love-kiss" ></i>';
                        }
                        else
                        {
                            return "";
                        }
                      }
                   },
               ];
var action = [];
var send_data = [];
send_data.push({'key':'campaign_id', 'value' : $("#campaign_id").val()});
enable_common_dataTable( 'Lead_ajax/viewCampaignLeadList/' ,"#leadlist_dataTable",action,aocolumnDefs,"",send_data);


$(document).ready(function() {
    select2_ajax("#txt_Search_company", "/Prospects/company_search", "Select Company");
    select2_ajax("#campaignname_select", "/Campaign_ajax/ajax_select2_campaign_name", "Select Campaign");
});

window.searchSelAll = $('#agent_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
window.searchSelAll = $('#agent_sub_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });


$('#Search_prospect').on('click', function () {
    leadSearch();
});


function leadSearch(argument) {
    checkbox_datatable = [];
    $("#selectAll").prop('checked', false);
    var send_data = [];

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

    enable_common_dataTable( 'lead_ajax/leadSearch' ,"#edm_dataTable",action,aocolumnDefs,"checkbox_datatable_check()",
        send_data,[],"","campaigns.campaign_name");

}