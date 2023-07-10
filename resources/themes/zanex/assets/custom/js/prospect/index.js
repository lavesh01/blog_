



$(document).ready(function() {
    select2_ajax("#txt_Search_company", "/Prospects/company_search", "Select Company");
});
var checkbox_datatable = [];
function checkbox_datatable_check()
{
    $(".checkbox_datatable").change(function() {
      if(this.checked) {
          checkbox_datatable.push($(this).val());
      }
      else
      {
        checkbox_datatable.splice( $.inArray($(this).val(),checkbox_datatable) ,1 );
      }
  });
  for (var i = checkbox_datatable.length - 1; i >= 0; i--) {
    $("#"+checkbox_datatable[i]).prop('checked', true);
  } 
}
var columns =  [
           {"data":"id","title":"Id","name":"id","className":"css_id"},{"data":"company_id","title":"Company Id","name":"company_id","className":"css_company_id"},{"data":"first_name","title":"First Name","name":"first_name","className":"css_first_name"},{"data":"last_name","title":"Last Name","name":"last_name","className":"css_last_name"},{"data":"middle_name","title":"Middle Name","name":"middle_name","className":"css_middle_name"},{"data":"Company","title":"Company","name":"Company","className":"css_Company"},{"data":"direct_number","title":"Direct Number","name":"direct_number","className":"css_direct_number"},{"data":"mobile_number","title":"Mobile Number","name":"mobile_number","className":"css_mobile_number"},{"data":"office_number","title":"Office Number","name":"office_number","className":"css_office_number"},{"data":"title","title":"Title","name":"title","className":"css_title"},{"data":"job_level","title":"Job Level","name":"job_level","className":"css_job_level"},{"data":"job_function","title":"Job Function","name":"job_function","className":"css_job_function"},{"data":"Industry","title":"Industry","name":"Industry","className":"css_Industry"},{"data":"Employee","title":"Employee","name":"Employee","className":"css_Employee"},{"data":"Revenue","title":"Revenue","name":"Revenue","className":"css_Revenue"},{"data":"country","title":"Country","name":"country","className":"css_country"},{"data":"state","title":"State","name":"state","className":"css_state"},{"data":"city","title":"City","name":"city","className":"css_city"},{"data":"zip","title":"Zip","name":"zip","className":"css_zip"},{"data":"job_info","title":"Job Info","name":"job_info","className":"css_job_info"},{"data":"prospect_technology","title":"Prospect Technology","name":"prospect_technology","className":"css_prospect_technology"},{"data":"company_technology","title":"Company Technology","name":"company_technology","className":"css_company_technology"}
        ];
var action = [
                    { "html_element": "checkbox", "class":"view_leads","icon":"fa fa-plus icon-gradient bg-ripe-malin", "id":"checked_id"}
                   
              ]; 

var aocolumnDefs =  [
                        {    
                              "aTargets": [0],
                              //"mData": "first_name",
                               "title": "<input type='checkbox' id='selectAll'></input>",
                              "sTitle": "<input type='checkbox' id='selectAll'></input>",
                              "mRender": function (data, type, full) {
                               return '<input type="checkbox" class="checkbox_datatable fonticon-wrap view_leads" id="checked'+data+'" value="checked'+data+'">';
                              }
                          },
                         {    
                              "aTargets": [1],
                              visible: false,
                              searchable: false,
                          },
                          
                         {    
                              "aTargets": [2],
                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<a href="'+site_url+"Prospects/details/"+full.id+ '" target="_blank" title="Open in new tab '+data+ '"  data-toggle="tooltip">'+data+ '</a>';
                              }
                          },
                          {    
                              "aTargets": [5],
                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<a href="'+site_url+"Companies/details/"+full.company_id+ '" target="_blank" title="Open in new tab '+data+ '"  data-toggle="tooltip">'+data+ '</a>';
                              }
                          } ];

for (var i = aocolumnDefs.length - 1; i >= 0; i--) {
  if (aocolumnDefs[i].hasOwnProperty('aTargets')) {
    $.each(aocolumnDefs[i], function (index, data) {
         columns[aocolumnDefs[i]["aTargets"][0]][index] = data;
    })
  }
}

//enable_common_dataTable( 'Prospects/ajax_search' ,"#edm_dataTable",action,aocolumnDefs,"checkbox_datatable_check()","",[],"","first_name,last_name");



window.searchSelAll = $('.search-box-sel-all').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });



  $('#Search_prospect').on('click', function () {
    block_ajax_ui();
    rendertablecontact();
    checkbox_datatable = [];
    unblock_ajax_ui();
  });



$('#export_btn').on('click', function () {
  if (checkbox_datatable.length > 0) {
    var select_prospects = "prospects=" + checkbox_datatable.join(",");
     ajax_call('Prospects/ajax_exporttocsv', select_prospects,true) ;
  }
  else{
    Swal.fire({
              type: "warning",
              title: "No Prospect Selected",
              text: "Please click on checkboxes to select Prospects"
          })
  }
  
});
$.fn.modal.Constructor.prototype.enforceFocus = function() {};
//select2_ajax("#add_new_campaign_select2", "Campaign_ajax/ajax_select2_campaign_name", "Campaign Name",false) 
 $("#add_new_campaign_select2").select2({
    //dropdownAutoWidth: true,
    dropdownParent: $('#add_new_campaign'),
    width: '100%',
    minimumResultsForSearch: Infinity,
    minimumInputLength: 3,
    allowClear: true,
    placeholder: {
      id: '-1', // the value of the option
      text: "Campaign Name"
    },
    ajax: { 
       url: site_url +  "Campaign_ajax/ajax_select2_campaign_name",
       type: "post",
       dataType: 'json',
       delay: 250,
       data: function (params) {
        return {
          searchTerm: params.term // search term
        };
       },
       processResults: function (response) {
         return {
            results: response
         };
       },
       cache: true
      }
});

$('#Addtocampaign').on('click', function () {
  if (checkbox_datatable.length > 0) {
    var select_prospects = "prospects=" + checkbox_datatable.join(",");
     $('#add_new_campaign').appendTo("body").modal('show');
     
  }
  else{
    Swal.fire({
              type: "warning",
              title: "No Prospect Selected",
              text: "Please click on checkboxes to select Prospects"
          })
  }
  
});

$('#save_process_p_c').on('click', function () {
  if (checkbox_datatable.length > 0 && $("#add_new_campaign_select2").val() != "" && $("#add_new_campaign_select2").val() !== null) {
    var select_prospects = "prospects=" + checkbox_datatable.join(",") + "&campaign_id="+ $("#add_new_campaign_select2").val();
     ajax_call('Prospects/ajax_addSearchResultToCampaign', select_prospects,true) ;
     $('#add_new_campaign').appendTo("body").modal('show');
  }
  else{
    Swal.fire({
              type: "warning",
              title: "No Prospect/Campaign Selected",
              text: "Please Select Prospect/Campaign"
          })
  }
  
});


function send_data_fn()
{
    var send_data = [];
    var items = '', country ;
    country = $('#txt_Search_company').val();
    for(var i=0;i<country.length;i++) {items += ',' + country[i]};
    send_data.push({'key':'country', 'value' : items});
    send_data.push({'key':'select_job_level', 'value' : sumoselectretunvaue('#select_job_level')});
    send_data.push({'key':'select_job_function', 'value' : sumoselectretunvaue('#select_job_function')});
    send_data.push({'key':'select_industry', 'value' : sumoselectretunvaue('#select_industry')});
    send_data.push({'key':'select_employee', 'value' : sumoselectretunvaue('#select_employee')});
    send_data.push({'key':'select_country', 'value' : sumoselectretunvaue('#select_country')});
    send_data.push({'key':'txt_Search_number_ctps' , 'value' : $('#txt_Search_number_ctps').val()});
    send_data.push({'key':'txt_company_tech' , 'value' : $('#txt_company_tech').val()});
    send_data.push({'key':'txt_Prospect_tech' , 'value' : $('#txt_Prospect_tech').val()});
    send_data.push({'key':'prospect_date_end_time' , 'value' : $('#prospect_date_end_time').val()});
    send_data.push({'key':'prospect_date_start_time' , 'value' : $('#prospect_date_start_time').val()}); 
    var maxId = Math.max.apply(null, $(".edm_dataTable_datatable_row").map(function(){
        return $(this).data("id");
    }).get());
    var minId = Math.min.apply(null, $(".edm_dataTable_datatable_row").map(function(){
        return $(this).data("id");
    }).get());
    send_data.push({'key':'maxIdCol' , 'value' : 't1.id'});
    send_data.push({'key':'maxId' , 'value' : maxId});
    send_data.push({'key':'minId' , 'value' : minId});
    return send_data;
}




function rendertablecontact(argument) {
 

 $('#edm_dataTable').DataTable({
        
        //pageLength : 20,
        lengthChange : false,
        processing : true,
        serverSide : true,
         pagingType: "simple",
        "ajax": {
            url :site_url +  'Prospects/ajax_search/data',
            "type": "POST",
            "async" : true,
            "data": function(d){ 
              $.each(send_data_fn(), function(key, value) {
                    d[value.key] = value.value;
              });
              d["iTotalDisplayRecordspost"] = $("#edm_dataTable_info").text();
              return d;
            },
          },
        searching : false,
        "createdRow": function( row, data, dataIndex ) {
          $(row).addClass( 'edm_dataTable_datatable_row dataIndex_'+dataIndex );
          var firstKey = Object.keys(data)[0];
          $(row).attr('id', 'edm_dataTable' +'_'+ data[firstKey]);
          $(row).attr('data-id', data[firstKey]);
        },
        "language": {
            "emptyTable":       "No data available",
            "info":             "", //" Showing _START_ to _END_ of _TOTAL_ entries",
            "infoEmpty":        "Showing 0 to 0 of 0 entries",
            "infoFiltered":     "", //" (filtered from _MAX_ total entries)",
            "infoPostFix":      "",
            "lengthMenu":       "_MENU_",
            "loadingRecords":   "Loading...",
            "processing":       '<div class="spinner"></div>',
            "search":           "",
            "zeroRecords":      "No data available",
            "paginate": {
                "first":        "First",
                "previous":     "Previous",
                "next":         "Next",
                "last":         "Last"
            },
            "aria": {
                "sortAscending":    ": activate to sort column ascending",
                "sortDescending":   ": activate to sort column descending"
            },
            "decimal":          "",
            "thousands":        ","
        },
        "destroy": true,
       "bDestroy":true,
        "stateSave": true,
       "bFilter": false,
       "bSort": false,
       'info': true,
       "lengthChange": true,
       "pageLength": 10,
       "lengthMenu": [[10,25, 50, 100], [10, 25, 50, 100]],
       //"aocolumnDefs" : aocolumnDefs,
       // "aoColumns": aocolumnDefs,
       "aoColumns" : columns
  });

 // gettotalcount();
}



function gettotalcount(argument) {
  var send_data = {};
  $.each(send_data_fn(), function(key, value) {
      if (value.value != '' ) {
      send_data[value.key] = value.value;

    }
  });
  send_data = $.param(send_data);
  ajax_call_no_alert("Prospects/ajax_search/count",send_data,true,"JSON", '$("#total_prospect_count").text(data.count)' );
}

rendertablecontact();