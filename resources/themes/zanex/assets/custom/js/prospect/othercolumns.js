




$(".dedup").change(function() {
      if(this.checked) {
          ajax_call('Prospects/ajax_update_otherColumn', "name="+$(this).attr("id")+"&select=1&type="+$(this).data("type") );
      }
      else
      {
        ajax_call('Prospects/ajax_update_otherColumn', "name="+$(this).attr("id")+"&select=0&type="+$(this).data("type") );
      }
  });


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
    

