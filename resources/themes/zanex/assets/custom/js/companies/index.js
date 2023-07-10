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

$(document).ready(function() {
    select2_ajax("#txt_Search_company", "/Prospects/company_search", "Select Company");
});

var action = [
                    { "html_element": "checkbox", "class":"view_leads","icon":"fa fa-plus icon-gradient bg-ripe-malin", "id":"checked_id"}
                   
              ]; 
  var aocolumnDefs =  [
                          
                         {    
                              "aTargets": [1],
                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<a href="'+site_url+"Companies/details/"+full.id+ '" target="_blank" title="Click To View Detais '+data+ '"  data-toggle="tooltip">'+data+ '</a>';
                              }
                          } ];

enable_common_dataTable( 'Companies/ajax_search' ,"#edm_dataTable",action,aocolumnDefs,"checkbox_datatable_check()");



window.searchSelAll = $('.search-box-sel-all').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'Enter here.' });



  $('#Search_prospect').on('click', function () {
    var send_data = [];
    var items = '', country ;
    country = $('#txt_Search_company').val();
    for(var i=0;i<country.length;i++) {items += ',' + country[i]};
    send_data.push({'key':'country', 'value' : items});
    send_data.push({'key':'select_nic', 'value' : sumoselectretunvaue('#select_nic')});
    send_data.push({'key':'select_sic', 'value' : sumoselectretunvaue('#select_sic')});
    send_data.push({'key':'select_industry', 'value' : sumoselectretunvaue('#select_industry')});
    send_data.push({'key':'select_employee', 'value' : sumoselectretunvaue('#select_employee')});
    send_data.push({'key':'select_country', 'value' : sumoselectretunvaue('#select_country')});
    send_data.push({'key':'txt_company_tech' , 'value' : $('#txt_company_tech').val()});
    
    enable_common_dataTable( 'Companies/ajax_search' ,"#edm_dataTable",action,aocolumnDefs,"checkbox_datatable_check()",send_data);

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


