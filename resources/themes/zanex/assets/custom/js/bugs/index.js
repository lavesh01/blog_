$(document).on('click','#Search_number_ctps',function(){
   if($("#txt_Search_number_ctps").val() != ""){
     var send_data = $.param({ "title":$("#title").val(),"description": $("#description").val(), "url": $("#url").val()});
     var adata = ajax_call("Bugs/addBugs",send_data );
     if(adata.type == "success")
     {
      enable_common_dataTable( 'Bugs/ajax_getall' ,"#edm_dataTable","","","");
     }
   }
   else
   {
     alert("Please add value");
   }
});
enable_common_dataTable( 'Bugs/ajax_getall' ,"#edm_dataTable","","","");

$(function(){
  
   //defaults
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
    $('.inline_editable').editable({
      error: function(response, newValue) {
          if(response.status === 500) {
              return 'Service unavailable. Please try later.';
          } else {
              return response.responseText;
          }
      }
    });
 });    
    

