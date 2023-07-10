
var action = [];
var aocolumnDefs =  [
                          
                        {   
                              "aTargets": [0],

                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                                return '<a  data-toggle="tooltip" href="'+site_url+"Edm/create_campaign/edit/"+data+ '"target="_self"><i class="fa fa-eye icon-gradient bg-malibu-beach " aria-hidden="true"></i> </a>' ;
                              }
                          }
                          ,
                          {   
                              "aTargets": [4],

                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return  data ;//'<a  data-toggle="tooltip" data-title="Download Result - '+full.Downloaded+'" href="'+site_url+"prospects/assetsdownloadlog/asset_datafiles/"+data+ '/result_csv" target="_blank"><i class="fa fa-download icon-gradient bg-malibu-beach " aria-hidden="true"></i> </a>';
                              }
                          }
                          
                           ];
enable_common_dataTable( 'EDM/ajax_campaignList' ,"#edm_dataTable",action,aocolumnDefs);

