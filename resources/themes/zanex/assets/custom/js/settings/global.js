$(function(){
  
   //defaults
   //$.fn.editable.defaults.url = '/post'; 
   $.fn.size = function() {return this.length;};
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
    $(".second_tab").champ({
    plugin_type: "tab",
    side: "left",
    active_tab: "1",
    controllers: "false"
  });

 });    
    


$("#update_userprofile_details").click(function (argument) {

 block_ajax_ui();

  var url =site_url + "/Settings/globalClientLogo/";
   event.preventDefault();
   var send_data = $("#user_profile_update_Details")[0];
   $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        data: new FormData(send_data),
        processData: false,
        contentType: false,
        success: function (data, status)
        {
        
          if (data.type == "success") {
              $('#client_logo').attr('src',site_url + data.url)
              swal("Logo Updated", "Details Updated Successfully", "success")
          }
          else
          {
            swal("Logo Not Updated", "Check with Admin", "danger")
          }
          unblock_ajax_ui();
        },
        error: function (xhr, desc, err)
        {
          unblock_ajax_ui();
          console.log("error");
        }
        
    });
});
