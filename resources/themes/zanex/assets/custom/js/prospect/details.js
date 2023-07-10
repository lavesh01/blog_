$(function(){
  
 /*  //defaults
   //$.fn.editable.defaults.url = '/post'; 

   $.fn.editable.defaults.mode = 'popup';$.fn.size = function() {return this.length;};
   $.fn.editableform.buttons =
'<button type="submit" class="btn btn-primary btn-sm editable-submit">' +
    '<i class="fa fa-fw fa-check"></i>' +
    '</button>' +
'<button type="button" class="btn btn-warning btn-sm editable-cancel">' +
    '<i class="fa fa-fw fa-times"></i>' +
    '</button>';
'<button type="submit" class="btn btn-primary btn-sm editable-submit"><i class="fa fa-fw fa-check"></i></button><button type="button" class="btn btn-warning btn-sm editable-cancel"><i class="fa fa-fw fa-times"></i></button>'
    //enable / disable
   
   //editables 
   */
 });    
/*
function xeditable_select(css_selector,adata)
{
    $(css_selector).editable({
        source: adata,
        container: 'body',
         tpl: '<select></select>',
        select2: {
             //minimumResultsForSearch: -1,
            width: 200,
            placeholder: 'Select country',
            //allowClear: true,
             dropdownParent   : '.popover:last',
            //width: '20em',
            dropdownAutoWidth: true,
            theme: 'bootstrap',
        } 
    });   
}
*/


////////////////////////////
var send_data=[];
var action = []; 
  var aocolumnDefs =  [
                        {    
                           "aTargets": [0],
                           //"mData": "first_name",
                           "mRender": function (data, type, full) {
                            return '<i class="fa '+icon_classes[full.file_type]+'"> </i>'+ '<p data-toggle="tooltip" data-title="'+ data + '">'+ stringshort(data,15) + '</p>';
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
$(document).ready(function() {
send_data.push({'key':'prospect_id', 'value' : $("#prospect_id").val()});
enable_common_dataTable( 'Prospects/ajax_asset_details' ,"#edm_dataTable",action,aocolumnDefs,"", send_data);
});


Dropzone.options.dpAcceptFiles = {
    paramName: "file", // The name that will be used to transfer the file
    maxFilesize: 1, // MB
    //acceptedFiles: 'image/*',
    url: site_url + "Prospects/ajax_upload",
    init: function() {
        this.on("sending", function(file, xhr, formData) {
          var prospect_id = $("#prospect_id").val();
          formData.append("prospect_id", prospect_id);
        });
      },    
    success: function(file, response){
      send_data.push({ 'prospect_id' : $("#prospect_id").val()});
        enable_common_dataTable( 'Prospects/ajax_asset_details' ,"#edm_dataTable",action,aocolumnDefs,"", send_data);
    }
}

/*
function xeditable_select(css_selector,adata)
{
    $(css_selector).editable({
        source: adata,
        container: 'body',
        tpl: '<select></select>',
        select2: {
            minimumResultsForSearch: 2,
            placeholder: 'Select',
            allowClear: true,
            dropdownParent   : '.popover:last',
            width: '20em',
            dropdownAutoWidth: true,
            theme: 'bootstrap',
        } 
    });   
}
*/
  udc_level = ajax_call_no_alert('Udc/Udc/level', send_data,false,'JSON')
   udc_function =ajax_call_no_alert('Udc/Udc/function', send_data,false,'JSON')
   udc_country = ajax_call_no_alert('Udc/Udc/country', send_data,false,'JSON')
    /*$('.inline_editable,.inline_editable_job_level,.inline_editable_job_functions,.inline_editable_country').on('shown', function(e, editable) {
        $('.editable-error-block').html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><span class="pr-2"><i class="fa fa-question-circle"></i></span>Warning : Updating records will impact existing leads data. </div>').show();
    });*/
