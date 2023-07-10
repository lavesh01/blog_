
$(document).ready( function() {
   $('#customer_id_dropdwn').change( function() {
      location.href = document.location.href+"/"+ $("#customer_id_dropdwn").val();
   });
});

$('.addpremission').change(function() {
   var role = $(this).data('role');
   var permission = $(this).data('permission');
   var cid = $(this).data('cid');
   var activate ;
   if($(this).is(":checked")) {
      activate = 1;
   }
   else
   {
   	activate = 0;
   }

   var send_data = $.param({'role':role, 'permission':permission, 'activate':activate,'cid':cid});
   var adata = ajax_call("users_ajax/addpremission",send_data );
   console.log(adata);
   return false;


   //'unchecked' event code
});

$(document).ready(function() {
    enable_common_dataTable("#datatable_dynamic");
    //open_common_htmlform_model("#popupbutton","Campaign_settings/htmlform/campaign-models-type");
} );