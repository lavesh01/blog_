

////////////////////////////
var send_data=[];
var action = []; 
  var aocolumnDefs =  [
                        {    
                           "aTargets": [0],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return '<p data-toggle="tooltip" data-title="'+ data + '">'+ stringshort(data,15) + '</p>';
                           }
                       },
                       {    
                           "aTargets": [2],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return '<p data-toggle="tooltip" data-title="'+ data + '">'+ stringshort(data,10) + '</p>';
                           }
                       },
                      {    
                           "aTargets": [3],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return '<a href="'+site_url+"Prospects/assetsdownloadlog/assets/"+ data + '/url" target="_blank"><i class="pe-7s-cloud-download"> </i></a>';
                           }
                       } ];

var send_data_plist = [];

var action_plist = [
                    { "html_element": "checkbox", "class":"view_leads","icon":"fa fa-plus icon-gradient bg-ripe-malin", "id":"checked_id"}
                   
              ]; 

var aocolumnDefs_plist =  [
                {    
                      "aTargets": [1],
                       visible: false,
                  } ,
                 {    
                      "aTargets": [2],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                       return '<a href="'+site_url+"Prospects/details/"+full.id+ '" target="_blank" title="Click To View Detais '+data+ '"  data-toggle="tooltip">'+data+ '</a>';
                      }
                  } ];

var send_data = [];
$(document).ready(function() {
send_data.push({'key':'company_id', 'value' : $("#company_id").val()});
enable_common_dataTable( 'Companies/ajax_asset_details' ,"#edm_dataTable",action,aocolumnDefs,"", send_data);

var send_data_plist =[];
send_data_plist.push({'key':'company_id' , 'value' : $('#company_id').val()});
enable_common_dataTable( 'Companies/ajax_search' ,"#edm_dataTable_plist",
    action_plist,aocolumnDefs_plist,"checkbox_datatable_check()",send_data_plist);
});


Dropzone.options.dpAcceptFiles = {
    paramName: "file", // The name that will be used to transfer the file
    maxFilesize: 10, // MB
    //acceptedFiles: 'image/*',
    url: site_url + "Companies/ajax_upload",
    init: function() {
        this.on("sending", function(file, xhr, formData) {
          var company_id = $("#company_id").val();
          formData.append("company_id", company_id);
        });
      },    
    success: function(file, response){
        enable_common_dataTable( 'Companies/ajax_asset_details' ,"#edm_dataTable",
            action,aocolumnDefs,"", send_data);
    }
}


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


 ////////////////////////////////////////////////////////////
   $.fn.editable.defaults.mode = 'popup';$.fn.size = function() {return this.length;};
   $.fn.editableform.buttons =
'<button type="submit" class="btn btn-primary btn-sm editable-submit">' +
    '<i class="fa fa-fw fa-check"></i>' +
    '</button>' +
'<button type="button" class="btn btn-warning btn-sm editable-cancel">' +
    '<i class="fa fa-fw fa-times"></i>' +
    '</button>';
'<button type="submit" class="btn btn-primary btn-sm editable-submit"><i class="fa fa-fw fa-check"></i></button><button type="button" class="btn btn-warning btn-sm editable-cancel"><i class="fa fa-fw fa-times"></i></button>'
    
$(function(){
  
   //defaults
   //$.fn.editable.defaults.url = '/post'; 

//enable / disable
   
   //editables 
    $('.inline_editable').editable({
        container: 'body',
        sourceCache: true,
        emptytext: 'empty', 
       validate: function(value){
       if(value=="")
          return "Please Provide Value. ";
       }  
    });
    


 });    

function xeditable_select(css_selector,adata)
{
    $(css_selector).editable({
        source: adata,
        container: 'body',
         tpl: '<select></select>',
        select2: {
             //minimumResultsForSearch: -1,
            placeholder: 'Select',
            //allowClear: true,
             dropdownParent   : '.popover:last',
            width: '20em',
            dropdownAutoWidth: true,
            theme: 'bootstrap',
        } 
    });   
}


$(document).ready(function() {
 ajax_call_no_alert('Udc/Udc/nic', send_data,true,'JSON','xeditable_select(".inline_editable_nic",data)')
 ajax_call_no_alert('Udc/Udc/sic', send_data,true,'JSON','xeditable_select(".inline_editable_sic",data)')
 ajax_call_no_alert('Udc/Udc/industry', send_data,true,'JSON','xeditable_select(".inline_editable_industry",data)')
 ajax_call_no_alert('Udc/Udc/revenue', send_data,true,'JSON','xeditable_select(".inline_editable_revenue",data)')
 ajax_call_no_alert('Udc/Udc/employee', send_data,true,'JSON','xeditable_select(".inline_editable_employee",data)')
 ajax_call_no_alert('Udc/Udc/country', send_data,true,'JSON','xeditable_select(".inline_editable_country",data)')


 $('.inline_editable,.inline_editable_nic, .inline_editable_sic, .inline_editable_industry,.inline_editable_revenue,.inline_editable_employee').on('shown', function(e, editable) {
        $('.editable-error-block').html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><span class="pr-2"><i class="fa fa-question-circle"></i></span>Warning : Updating records will impact existing leads data. </div>').show();
    });
});