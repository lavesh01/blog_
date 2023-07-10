var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"view_leads","icon":"fa fa-eye icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"quality/campaignleads/","title":"View Lead Details"}
                   
              ];   
enable_common_dataTable( 'Quality/campaignlistdata' ,htmldatatable_id,action);

 } );

$(document).ready(function () {  
   $('#change_leadstatus').on('click', function () {

      var campaign_id=$('#campaign_id').val();
      var status=$('#status').val();
      var group_id=$('#group_id').val();
      var lead_id=$('#lead_id').val();
      var remark=$('#remark').val();
      
    if(status=="")
    {
      swal("Status Missing","Select Lead Status");
      return false;
    }

     $.ajax({
    url:site_url + "quality/change_leadstatus",
    method:"POST",
    data:{status:status,campaign_id:campaign_id,group_id:group_id,lead_id:lead_id,remark:remark},
    beforeSend: function() {

       $('#loading').show();
       $('#change_leadstatus').hide();

    },
    success:function(data)
    {
       
      if(data=="1")
      {
          $('#loading').hide();
          $('#change_leadstatus').show();
          location.reload();
         swal("Status Updated", "Lead Status Updated Successfully", "success")

      } else{

        $('#loading').hide();
        $('#change_leadstatus').show();
        swal("Error", "Please Try Again", "warning")


      }
       
    
    }
   });

   });
});   