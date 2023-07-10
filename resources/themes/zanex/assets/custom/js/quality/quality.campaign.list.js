var htmldatatable_id = "#common_dataTable";
$(document).ready(function() {
	
	var action = [
					{ "class":"view primary","icon":"fa fa-rocket icon-gradient bg-malibu-beach", "id":"view", "href": site_url + "quality/leads/",
           "title":"Quality"},
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
    enable_common_dataTable( 'quality/getcampaignlist' ,htmldatatable_id,action,aocolumnDefs);
} );
