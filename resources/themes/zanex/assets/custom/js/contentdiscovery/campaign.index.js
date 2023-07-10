var htmldatatable_id = "#common_dataTable";
$(document).ready(function() {
	
  
	var action = [
					
					{ "class":"view primary","icon":"fa fa-id-badge icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"contentdiscovery/manual/", 
          "title":"Mannual Add"},
          { "class":"view primary","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"view", "href":site_url +"contentdiscovery/uploadrpf/", 
          "title":"Upload RPF"},
          
				];
	var aocolumnDefs =  [
                   {    
                        "aTargets": [7],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                        	console.log(data);
                           if ( data == "0") {
                            return "draft";
                           }
                           else if ( data == "1") {
                            return "live";
                           }
                           else if ( data == "2") {
                            return "Completed";
                           }
                        }
                    }
                ];
    enable_common_dataTable( 'Campaign_ajax/campaign_manager' ,htmldatatable_id,action,aocolumnDefs);
} );