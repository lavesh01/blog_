var checkbox_datatable = [];
var check_count = 0;
function checkbox_datatable_check()
{
   // check_count = 0;
    $(".checkbox_datatable").change(function() {
      if(this.checked) {
          checkbox_datatable.push($(this).val());
          check_count++;
      }
      else
      {
        checkbox_datatable.splice( $.inArray($(this).val(),checkbox_datatable) ,1 );
        check_count--;
      }
      });
      for (var i = checkbox_datatable.length - 1; i >= 0; i--) {
        $("#"+checkbox_datatable[i]).prop('checked', true);
      } 
    if($('input.checkbox_datatable:checked').length == $('input.checkbox_datatable').length)
    {
        $("#selectAll").prop('checked', true);
    }
    else
    {
        $("#selectAll").prop('checked', false);
    }

}


$('body').on('click', '#selectAll', function() {
    if(this.checked) {
         $( ".checkbox_datatable" ).each(function( index ) {
             $(this).prop('checked', true);
             checkbox_datatable.push($(this).val());
         });
      }
      else
      {
        $( ".checkbox_datatable" ).each(function( index ) {
             $(this).prop('checked', false);
             checkbox_datatable.splice( $.inArray($(this).val(),checkbox_datatable) ,1 );
        });
      }
    //console.log(checkbox_datatable);
});

$(document).ready(function() {
    select2_ajax("#txt_Search_company", "/Prospects/company_search", "Select Company");
    select2_ajax("#campaignname_select", "/Campaign_ajax/ajax_select2_campaign_name", "Select Campaign");
});

var action = [
                    //{ "html_element": "checkbox", "class":"view_leads","icon":"fa fa-plus icon-gradient bg-ripe-malin", "id":"checked_id"}
                   
              ]; 
  var aocolumnDefs =  [
                          
                        {    
                              "aTargets": [0],
                              "title": "<input type='checkbox' id='selectAll'></input>",
                              "sTitle": "<input type='checkbox' id='selectAll'></input>",
                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<input type="checkbox"   data-toggle="tooltip"  data-placement="top" class="checkbox_datatable fonticon-wrap view_leads" id="checked'+full.id+'" value="checked'+full.id+'"/>'
                              }
                          },
                         {    
                              "aTargets": [1],
                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<a href="'+site_url+"Campaign/edit//"+full.id+ '" target="_blank">'+data+ '</a>';
                              }
                          },

                         
                          {    
                      "aTargets": [4],
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
                      "aTargets": [5],
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
                      "aTargets": [6],
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
                   }, ];

enable_common_dataTable( 'lead_ajax/leadSearch' ,"#edm_dataTable",action,aocolumnDefs,"checkbox_datatable_check()"
    ,[],[],"","campaigns.campaign_name");



window.searchSelAll = $('.search-box-sel-all').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
window.searchSelAll = $('.search-box-sel-all_sub_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
window.searchSelAll = $('#agent_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });
window.searchSelAll = $('#agent_sub_disposition').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });


  $('#Search_prospect').on('click', function () {
    leadSearch();
  });

function leadSearch(argument) {
    checkbox_datatable = [];
    $("#selectAll").prop('checked', false);
    var send_data = [];
    send_data.push({'key':'agent_disposition', 'value' : sumoselectretunvaue('#agent_disposition')});
    send_data.push({'key':'agent_sub_disposition', 'value' : sumoselectretunvaue('#agent_sub_disposition')});
    send_data.push({'key':'select_job_level', 'value' : sumoselectretunvaue('#select_job_level')});
    send_data.push({'key':'select_job_function', 'value' : sumoselectretunvaue('#select_job_function')});
    send_data.push({'key':'select_industry', 'value' : sumoselectretunvaue('#select_industry')});
    send_data.push({'key':'select_employee', 'value' : sumoselectretunvaue('#select_employee')});
    send_data.push({'key':'select_country', 'value' : sumoselectretunvaue('#select_country')});
    send_data.push({'key':'select2_revenue', 'value' : sumoselectretunvaue('#select2_revenue')});
    send_data.push({'key':'txt_Search_number_ctps' , 'value' : $('#txt_Search_number_ctps').val()});
    send_data.push({'key':'txt_company_tech' , 'value' : $('#txt_company_tech').val()});
    send_data.push({'key':'txt_Prospect_tech' , 'value' : $('#txt_Prospect_tech').val()});
    send_data.push({'key':'quality_disposition', 'value' : sumoselectretunvaue('#quality_disposition')});
    send_data.push({'key':'quality_sub_disposition', 'value' : sumoselectretunvaue('#quality_sub_disposition')});
    send_data.push({'key':'select2_campaign_status', 'value' : sumoselectretunvaue('#select2_campaign_status')});
    send_data.push({'key':'campaignname_select', 'value' : sumoselectretunvaue('#campaignname_select')});
    send_data.push({'key':'select_agent_username', 'value' : sumoselectretunvaue('#select_agent_username')});
    send_data.push({'key':'select_quality_username', 'value' : sumoselectretunvaue('#select_quality_username')});
    
    if ($('#agent_web_verified').prop('checked')) {
         send_data.push({'key':'agent_web_verified' , 'value' : "1"});
    }
    else
    {
        send_data.push({'key':'agent_web_verified' , 'value' : "0"});
    }

    if ($('#agent_consent').prop('checked')) {
         send_data.push({'key':'agent_consent' , 'value' : "1"});
    }
    else
    {
        send_data.push({'key':'agent_consent' , 'value' : "0"});
    }

    if ($('#dnc_prospect').prop('checked')) {
         send_data.push({'key':'dnc_prospect' , 'value' : "1"});
    }
    else
    {
        send_data.push({'key':'dnc_prospect' , 'value' : "0"});
    }

    if ($('#dnc_number').prop('checked')) {
         send_data.push({'key':'dnc_number' , 'value' : "1"});
    }
    else
    {
        send_data.push({'key':'dnc_number' , 'value' : "0"});
    }

    if ($('#dnc_company').prop('checked')) {
         send_data.push({'key':'dnc_company' , 'value' : "1"});
    }
    else
    {
        send_data.push({'key':'dnc_company' , 'value' : "0"});
    }

    enable_common_dataTable( 'lead_ajax/leadSearch' ,"#edm_dataTable",action,aocolumnDefs,"checkbox_datatable_check()",
        send_data,[],"","campaigns.campaign_name");

}

$('#export_btn').on('click', function () {
  if (checkbox_datatable.length > 0) {
    var select_prospects = "prospects=" + checkbox_datatable.join(",");
    ajax_call('lead_ajax/ajax_exporttocsv/LeadExport', select_prospects,true) ;

  }
  else{
    Swal.fire({
              type: "warning",
              title: "No Prospect Selected",
              text: "Please click on checkboxes to select Prospects"
          })
  }
  
});

$('#deleteLeadNotQualified').on('click', function () {
  if (checkbox_datatable.length > 0) {
    var select_prospects = "prospects=" + checkbox_datatable.join(",");
    var adata = ajax_call('lead_ajax/ajax_exporttocsv/LeadDelete', select_prospects) ;
     if (adata.type == 'success') {leadSearch();}
  }
  else{
    Swal.fire({
              type: "warning",
              title: "No Prospect Selected",
              text: "Please click on checkboxes to select Prospects"
          })
  }
  
});


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