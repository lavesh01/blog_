var adata1 = ajax_call_no_alert("ctps/getLast5Search/",'' );
  for (var i = adata1.result.length - 1; i >= 0; i--) {
     console.log(adata1.result[i].result);
     li(adata1.result[i].contactno,adata1.result[i].result);
  } 

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
                               return '<a  data-toggle="tooltip" data-title="Download Result - '+full.Downloaded+'" href="'+site_url+"prospects/assetsdownloadlog/asset_prospects/"+data+ '/result_csv" target="_blank"><i class="fa fa-download icon-gradient bg-malibu-beach " aria-hidden="true"></i> </a>';
                              }
                          }
                          ,
                          {    
                              "aTargets": [5],
                              visible:false
                          }
                           ];
enable_common_dataTable( 'ctps/dtable' ,"#edm_dataTable",action,aocolumnDefs);

$("#Search_number_ctps").click(function (){
  

  
  var txt_Search_number_ctps = $("#txt_Search_number_ctps").val();
 

 /* 
  if (txt_Search_number_ctps == "" || txt_Search_number_ctps === null) { 
    alert("missing agent_disposition");
    return;
  }
*/

  var send_data = $.param({"txt_Search_number_ctps":txt_Search_number_ctps });
  var adata = ajax_call("ctps/ajax_search/",send_data );
  
  li(txt_Search_number_ctps,adata.return);

});


function li(txt_Search_number_ctps,aa)
{
  var a = "";
  if (aa == "1")
  {
    a = "DND";
  }
  else
  {
    a = "Not DND";
  }
   var li = '<li class="list-group-item"> <div class="todo-indicator bg-focus"></div> <div class="widget-content p-0"><div class="widget-content-wrapper " ><div class="widget-content-left mr-2"></div><div class="widget-content-left"><div class="widget-heading">' + txt_Search_number_ctps +'</div> <div class="widget-subheading"> ' + a + ' </div></div> </div></div> </li>';
  $("#ext_supp_li").append(li);
}



$("#upload_prospect_file").click(function (argument) {
   block_ajax_ui();
   var campaign_id = $("#campaign_id").val();
   var url =site_url + "ctps/upload_bulk_check/" ;
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
          console.log(data);
          if (data.type == "success") {
            $("#upload_prospect_file").val("");
            //enable_common_dataTable( 'ctps/dtable' ,"#edm_dataTable",action,aocolumnDefs);

            
          }
          else
          {
            Swal.fire({
              type: data.type,
              title: data.title,
              text: data.text,
              confirmButtonClass: data.confirmButtonClass,
            });
          }
          unblock_ajax_ui();
          window.location.reload(true);
        },
        error: function (xhr, desc, err)
        {
          unblock_ajax_ui();
          console.log(xhr);
        }
    });

});