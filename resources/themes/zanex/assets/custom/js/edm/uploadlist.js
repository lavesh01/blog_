var action = []; 
  var aocolumnDefs =  [
                          
                        {   
                              "aTargets": [0],

                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               var a = '<a  data-toggle="tooltip" data-title="View" href="'+site_url+"Edm/listfileview/"+ data + "/" + full.reference_id +   '"><i class="fa fa-eye icon-gradient bg-malibu-beach " aria-hidden="true"></i> </a>';
                               return  a + '<a class="deleteedmlist" data-toggle="tooltip" data-id="'+data+'" href="#" ><i class="fa fa-trash icon-gradient bg-love-kiss " aria-hidden="true"></i> </a>';
                              }
                          }/*
                          ,
                          {   
                              "aTargets": [4],

                              //"mData": "first_name",
                              "mRender": function (data, type, full) {
                               return '<a  data-toggle="tooltip" data-title="Download Result - '+full.Downloaded+'" href="'+site_url+"prospects/assetsdownloadlog/asset_datafiles/"+data+ '/result_csv" target="_blank"><i class="fa fa-download icon-gradient bg-malibu-beach " aria-hidden="true"></i> </a>';
                              }
                          }*/
                          ,
                          {    
                              "aTargets": [1],
                              visible:false
                          }
                          
                           ];
var send_dataa=[];
send_dataa.push({'key':'list_id', 'value' : $("#list_id").val()});
enable_common_dataTable( 'Edm/ajax_getAssetEmailList' ,"#edm_dataTable",action,aocolumnDefs,"",send_dataa);


$("#upload_prospect_file").click(function (argument) {
   block_ajax_ui();
   var url =site_url + "Edm/upload_edm_list/" + $("#list_id").val() ;
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
            enable_common_dataTable( 'Edm/ajax_getAssetEmailList' ,"#edm_dataTable",action,aocolumnDefs,"",send_dataa);
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

$(document).on('click','.deleteedmlist',function(){

 $("#deleteedmlisthidden").val($(this).data('id'));
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!',
      confirmButtonClass: 'btn btn-warning',
      cancelButtonClass: 'btn btn-danger ml-1',
      buttonsStyling: false,
    }).then(function (result) {
      if (result.value) {
        var send_data = "edmlistname="+$("#deleteedmlisthidden").val();
        var adata = ajax_call("Edm/ajax_delete_edm_list_file",send_data);
        if (adata.type == "success") {
         enable_common_dataTable( 'Edm/ajax_getAssetEmailList' ,"#edm_dataTable",action,aocolumnDefs,"",send_dataa);
        }
      } 
    })

});

/*
$(document).ready(function() {
  $("#uploadEdmListBtn").click(function (argument) {
    $('#uploadEdmListModel').appendTo("body").modal('show');
  });
});


$('#upload_listname').on('click', function () {
    
   var edmlistname = $('#edmlistname').val();
   if(edmlistname=="")
    {
      swal("Name Missing","Enter Name");
      return false;
    }
    var send_data = "edmlistname="+edmlistname;
    var adata = ajax_call("Edm/ajax_setlistname",send_data );
    if(adata.type == "success")
    {
      $('#edmlistname').val("");
      $('#uploadEdmListModel').appendTo("body").modal('hide');
      enable_common_dataTable( 'Edm/ajax_getListName' ,"#edm_dataTable",action,aocolumnDefs);
      return false;
    }
});


$(document).on('click','.deleteedmlist',function(){

 $("#deleteedmlisthidden").val($(this).data('id'));
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!',
      confirmButtonClass: 'btn btn-warning',
      cancelButtonClass: 'btn btn-danger ml-1',
      buttonsStyling: false,
    }).then(function (result) {
      if (result.value) {
        var send_data = "edmlistname="+$("#deleteedmlisthidden").val();
        var adata = ajax_call("Edm/ajax_deletelistname",send_data);
        if (adata.type == "success") {
          enable_common_dataTable( 'Edm/ajax_getListName' ,"#edm_dataTable",action,aocolumnDefs);
        }
      } 
    })

});

*/