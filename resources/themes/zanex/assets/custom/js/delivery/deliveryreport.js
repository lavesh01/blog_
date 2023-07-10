var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"delivered_details","icon":"fa fa-truck icon-gradient bg-success", "id":"view_campaign", "href":site_url + "delivery/delivery_report/","title":"View Delivered Lead Activity"},
              ];   
enable_common_dataTable( 'delivery/campaignDetails' ,htmldatatable_id,action);

 

 } );

