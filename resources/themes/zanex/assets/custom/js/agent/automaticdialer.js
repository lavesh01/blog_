var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {

	var action = [	
					{ "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/automatic/", "title":"Automatic Dailer"},
          
				];
        
enable_common_dataTable( 'Agent_ajax_dailer/automatic_dailerlist' ,htmldatatable_id,action);

 } );

$(document).on('click','#change_status_btn',function(){

	var leadID=$('#leadID').val();
	   
  $.ajax({
    url:site_url + "Agent_ajax_dailer/change_status",
    method:"POST",
    data:{leadID:leadID},
    dataType:"json", 
    success:function(res)
    {
       location.reload();
    }
   }); 
});