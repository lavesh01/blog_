

var action = []; 
    var aocolumnDefs =  [
                          
                         {    
                              "aTargets": [0],
                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<a href="'+site_url + 'Prospects/viewExportedData/'+data+ '" target="_blank" data-toggle="tooltip" data-title="View Prospects"><i class="fa fa-eye  icon-gradient bg-love-kiss"> </i></a> '+
                               '<a  data-toggle="tooltip" data-title="Download Result - '+full.Downloaded+'" href="'+site_url+"prospects/assetsdownloadlog/exported/"+full.uuid+ '/url" target="_blank"><i class="fa fa-download icon-gradient bg-malibu-beach " aria-hidden="true"></i> </a>';
                              }
                          },
                          {    
                              "aTargets": [1],
                              visible:false
                          },
                          {    
                              "aTargets": [4],
                              visible:false
                          }
                           ];

enable_common_dataTable( 'Prospects/ajax_getAllExportedProspectsList' ,"#edm_dataTable",action,aocolumnDefs);
