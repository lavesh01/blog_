var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"view_leads","icon":"fa fa-plus icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"ContentDiscovery/manualcampaignleads/","title":"Add Lead Details"},
                     { "class":"view_lead","icon":"fa fa-eye icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"ContentDiscovery/viewcampaignleaddetails/","title":"View Lead Details"}
                   
              ];   
var send_data = [];
send_data.push({'key':'module','value':'agent'});
enable_common_dataTable( 'ContentDiscovery/campaignlistdata' ,htmldatatable_id,action,"","",send_data);

 } );

