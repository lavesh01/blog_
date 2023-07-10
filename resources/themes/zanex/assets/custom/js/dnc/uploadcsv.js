var action = []; 
  var aocolumnDefs =  [
                          
                        {   
                              "aTargets": [0],

                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<i class="fa fa-file-text icon-gradient bg-ripe-malin"" aria-hidden="true"></i> '+data;
                              }
                          }
                          ,
                          {   
                              "aTargets": [4],

                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<a  data-toggle="tooltip" data-title="Download Result - '+full.Downloaded+'" href="'+site_url+"prospects/assetsdownloadlog/asset_datafiles/"+data+ '/result_csv" target="_blank"><i class="fa fa-download icon-gradient bg-malibu-beach " aria-hidden="true"></i> </a>';
                              }
                          }
                          ,
                          {    
                              "aTargets": [5],
                              visible:false
                          }
                           ];

enable_common_dataTable( 'Dnc/ajax_getAssetDNCByUser' ,"#edm_dataTable",action,aocolumnDefs);


$("#upload_prospect_file").click(function (argument) {
   block_ajax_ui();
   var url =site_url + "Dnc/upload_dnc_bulk" ;
   event.preventDefault();
   var send_data = new FormData($("#form_prospet_bulk_upload")[0]);
   $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        data: send_data,
        processData: false,
        contentType: false,
        success: function (data, status)
        {
          if (data.type == "success") {
            $("#upload_prospect_file").val("");
            Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
              confirmButtonClass: data.confirmButtonClass,
            });
            enable_common_dataTable( 'Dnc/ajax_getAssetDNCByUser' ,"#edm_dataTable",action,aocolumnDefs);
          }
          else
          {
            Swal.fire({
              type: data.type,
              title: data.title,
              html: data.text,
            });
          }
          unblock_ajax_ui();
        },
        error: function (xhr, desc, err)
        {
          unblock_ajax_ui();
          Swal.fire({
              type: "danger",
              title: "Pleas contact help desk.",
              text: "Please Check your file and try re-uploading",
              
            });
        }
    });

});