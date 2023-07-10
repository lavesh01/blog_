var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {

	

	var action = [

					{ "class":"view primary","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"view", "href":site_url + "", "title":"Edit Agent sub Disposition Details"},

                                         { "class":"view primary","icon":"fa fa-trash icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "","title":"Delete Agent Sub Disposition Data"},

                                          { "class":"view primary","icon":"fa fa-plus icon-gradient bg-mixed-hopes", "id":"add", "href": site_url + "","title":"Add Sub Disposition Data"},

           

				];

	var aocolumnDefs =  [

                   {    

                        "aTargets": [3],

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

        enable_common_dataTable( 'Users_ajax/agent_subdispositiondetails' ,htmldatatable_id,action,aocolumnDefs);

	open_common_htmlform_model("#popupbutton","campaign/htmlform/campaign-models-create");

} );







