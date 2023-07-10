var send_data=[];
send_data.push({'key':'module', 'value' : $("#module").val()});
var action = []; 
var aocolumnDefs =  [
                          
                         {    
                              "aTargets": [0],
                              "title": "Enable",
                              "sTitle": "Enable",
                              "mRender": function (data, type, full) {
                               var check = "";
                               if (full.status == 2) {
                                 check = "checked";
                               }
                               else{
                                check = "unchecked";
                               }
                               return '<input type="checkbox"   data-toggle="tooltip"  data-placement="top" class="checkbox_datatable fonticon-wrap view_leads" id="checked'+full.id+'" value="checked'+full.id+'" '+check+'/>'
                              }
                          },
                          {    
                              "aTargets": [1],
                              visible:false
                          },
                          {    
                              "aTargets": [2],
                              visible:false
                          },
                          {    
                              "aTargets": [8],
                              visible:false
                          },
                          {    
                              "aTargets": [9],
                              visible:false
                          }
                        ];

enable_common_dataTable( 'Zenui/ajax_getAssetzendomainabulkuploadByUser' ,"#edm_dataTable",action,aocolumnDefs,"",send_data);


$("#upload_prospect_file").click(function (argument) {
   block_ajax_ui();
   var url =site_url + "Zenui/ajax_uploadbulkcompanyname" ;
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
            enable_common_dataTable( 'Zenui/ajax_getAssetzendomainabulkuploadByUser' ,"#edm_dataTable",action,aocolumnDefs,"",send_data);
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

$(document).on('click','.checkbox_datatable',function(){

  if(this.checked) {
    ajax_call('Zenui/enableuploadedlist', "name="+$(this).attr('id').replace("checked","")+"&select=2",false,2 );
  }
  else
  {
    ajax_call('Zenui/enableuploadedlist', "name="+$(this).attr('id').replace("checked","")+"&select=1" ,false,2);
  }
});
