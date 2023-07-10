/*var htmldatatable_id = "#sales_dataTable";
$(document).ready(function() {

  var aocolumnDefs =  [
                   {    
                        "aTargets": [1],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                          
                           
                            return '<input type="checkbox" class="delete_checkbox" value="' + data +'">';
                          
                        }
                      }

                ]; 
	
var action = [
          { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"edit_type", "href":"#", "title":"Edit"},
          { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_type", "href":"#", "title":"Delete"},
          { "class":"view_type","icon":"fa fa-eye icon-gradient bg-warning", "id":"view_type", "href": site_url + "sales/businessData/", "title":"View"},
          { "class":"upload_file","icon":"fa fa-upload icon-gradient bg-primary", "id":"upload_file", "href": site_url + "sales/uploadfile/", "title":"Upload File"},
        
        ];

    enable_common_dataTable( 'sales_ajax/getSalesManager' ,htmldatatable_id,action,aocolumnDefs);
} );


//delete data
$(document).on('click','.delete_type',function(){

 $("#ajax_id").val($(this).attr('id').replace("delete_type",""));
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
        var send_data = $("#ajax_form").serialize();
        var adata = ajax_call("Sales_ajax/delete_clientData",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Client is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});

//fetch Grade Model
$(document).on('click','.edit_type',function(){
  var business_id = $(this).attr("id").replace("edit_type","");
   $('#business_id').val(business_id);
    $.ajax({
    url:site_url + "Sales_ajax/fetch_business_details",
    method:"POST",
    data:{business_id:business_id},
    beforeSend: function() {
       $('#p_f_name').val('');
       $('#p_l_name').val('');
       $('#p_email_id').val('');
       $('#p_designation').val('');
       $('#p_business_name').val('');
       $('#p_contact_type').val('');
       $('#p_business_phone').val('');
       $('#p_personal_phone').val('');
       $('#p_address').val('');
       $('#p_est_revenue').val('');
    },
    success:function(res)
    {
     $('#p_f_name').val(res.data.first_name);
     $('#p_l_name').val(res.data.last_name);
     $('#p_email_id').val(res.data.business_email);
     $('#p_designation').val(res.data.designation);
     $('#p_business_name').val(res.data.business_name);
     $('#p_contact_type').val(res.data.type_of_contact);
     $('#p_business_phone').val(res.data.business_phone);
     $('#p_personal_phone').val(res.data.personal_phone);
     $('#p_address').val(res.data.address);
     $('#p_est_revenue').val(res.data.address);
    }
   });

  $('#update_type').appendTo("body").modal('show');
 
});

//Update from details
$('#update_typeform_details').on('click', function () {

   var send_data = $("#update_business").serialize();
    var adata = ajax_call("Sales_ajax/update_business_details",send_data );

    if(adata.type == "warning")
    {
       $('#update_type').modal('show'); 
       return false;
        
    }
    else if(adata.type == "success")
    {
       $('#update_type').modal('hide');
       $('#p_f_name').val('');
       $('#p_l_name').val('');
       $('#p_email_id').val('');
       $('#p_designation').val('');
       $('#p_business_name').val('');
       $('#p_contact_type').val('');
       $('#p_business_phone').val('');
       $('#p_personal_phone').val('');
       $('#p_address').val('');
       $('#p_est_revenue').val('');
       draw_table();
       return false;
    }
    else if(adata.type == "success")
    {
       $('#update_type').modal('show');
       return false;
    }  
 

 });



 //Auto Refreshing Data table function of My Business Details
var htmldatatable_id = "#sales_dataTable";
var dt_test;
function draw_table(type="") {

  var aocolumnDefs =  [
                   {    
                        "aTargets": [1],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                          
                           
                            return '<input type="checkbox" class="delete_checkbox" value="' + data +'">';
                          
                        }
                      }

                ]; 

 var action = [
          { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"edit_type", "href":"#", "title":"Edit"},
          { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_type", "href":"#", "title":"Delete"},
          { "class":"view_type","icon":"fa fa-eye icon-gradient bg-warning", "id":"view_type", "href": site_url + "sales/businessData/", "title":"View"},
          { "class":"upload_file","icon":"fa fa-upload icon-gradient bg-primary", "id":"upload_file", "href": site_url + "sales/uploadfile/", "title":"Upload File"},
        
        ];
  if (type=="") {
    dt_test = enable_common_dataTable( 'sales_ajax/getSalesManager' ,htmldatatable_id,action,aocolumnDefs);

  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'sales_ajax/getSalesManager' ,htmldatatable_id,action,aocolumnDefs);

  }

}



//delete multiple records
$(document).ready(function(){

 $(document).on('click','.delete_checkbox',function(){
  if($(this).is(':checked'))
  {
   $(this).closest('tr').addClass('removeRow');
  }
  else
  {
   $(this).closest('tr').removeClass('removeRow');
  }
 });

 $('#delete_all').click(function(){
  var checkbox = $('.delete_checkbox:checked');
  if(checkbox.length > 0)
  {
   var checkbox_value = [];
   $(checkbox).each(function(){
    checkbox_value.push($(this).val());
   });
   $.ajax({
    url:site_url + "Sales_ajax/delete_all",
    method:"POST",
    data:{checkbox_value:checkbox_value},
    success:function(data)
    {
         swal("Record Deleted", "Selected Records Deleted Successfully", "success");
         draw_table();
    }
   })
  }
  else
  {
   alert('Select atleast one records');
  }
 });

});



//upload file attachment documents for business contacts
$("#update_userprofile_details").click(function (argument) {

  var file=$('#file').val();
  if(file=="")
  {
      swal("Document Missing","Upload File Document");
      return false;
  }

 block_ajax_ui();
  var clientID = $("#clientID").val();
  var url =site_url + "/Sales_ajax/uploadfile/"  + clientID;
   event.preventDefault();
   var send_data = $("#user_profile_update_Details")[0];
   $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        data: new FormData(send_data),
        processData: false,
        contentType: false,
        success: function (data, status)
        {
           
          if (data.type == "success") {
              $('#icon-tabs').load(location.href + " #icon-tabs");
             swal("File Uploaded", "Details Uploaded Successfully", "success")
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
        },
        error: function (xhr, desc, err)
        {
          unblock_ajax_ui();
          console.log("error");
        }
        
    });

});
*/


//////////////////////////////////////////////////

var htmldatatable_id = "#sales_dataTable";
var theme_settings = $(".ui-theme-settings");
  var aocolumnDefs =  []; 
  var action = [
          //{ "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"edit_type", "href":"#", "title":"Edit"},
          //{ "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_type", "href":"#", "title":"Delete"},
          { "class":"view_type","icon":"fa fa-eye icon-gradient bg-malibu-beach", "id":"viewtype_", "href":"#", "title":"View"},
          //{ "class":"upload_file","icon":"fa fa-upload icon-gradient bg-primary", "id":"upload_file", "href": site_url + "sales/uploadfile/", "title":"Upload File"},
        
        ];
var send_data=[];
var action_asset = []; 
var aocolumnDefs_asset =  [
                      {    
                         "aTargets": [0],
                         //"mData": "first_name",
                         "mRender": function (data, type, full) {
                          return '<p data-toggle="tooltip" data-title="'+ data + '">'+ stringshort(data,15) + '</p>';
                         }
                     },
                     {    
                         "aTargets": [2],
                         //"mData": "first_name",
                         "mRender": function (data, type, full) {
                          return '<p data-toggle="tooltip" data-title="'+ data + '">'+ stringshort(data,10) + '</p>';
                         }
                     },
                    {    
                         "aTargets": [3],
                         //"mData": "first_name",
                         "mRender": function (data, type, full) {
                          return '<a href="'+site_url+"Prospects/assetsdownloadlog/assets/"+ data + '/url" target="_blank"><i class="pe-7s-cloud-download"> </i></a>';
                         }
                     } ];

$(document).ready(function() {
    enable_common_dataTable( 'sales_ajax/getSalesManager' ,htmldatatable_id,action,aocolumnDefs,"init_page()");
} );

function xeditable_select(css_selector,adata)
{
    $(css_selector).editable({
        source: adata,
        container: 'body',
         tpl: '<select></select>',
        select2: {
             //minimumResultsForSearch: -1,
            placeholder: 'Select',
            //allowClear: true,
             dropdownParent   : '.popover:last',
            width: '20em',
            dropdownAutoWidth: true,
            theme: 'bootstrap',
        } 
    });   
}

 $.fn.editable.defaults.mode = 'popup';$.fn.size = function() {return this.length;};
 $.fn.editableform.buttons =
'<button type="submit" class="btn btn-primary btn-sm editable-submit">' +
    '<i class="fa fa-fw fa-check"></i>' +
    '</button>' +
'<button type="button" class="btn btn-warning btn-sm editable-cancel">' +
    '<i class="fa fa-fw fa-times"></i>' +
    '</button>';
'<button type="submit" class="btn btn-primary btn-sm editable-submit"><i class="fa fa-fw fa-check"></i></button><button type="button" class="btn btn-warning btn-sm editable-cancel"><i class="fa fa-fw fa-times"></i></button>'



  $(document).on("click",".view_type",function(e) {
      if (!theme_settings.hasClass("settings-open")) {
        $('.ui-theme-settings').modal('toggle');
        $(".theme-settings__options-wrapper").html(" ");
        block_ajax_ui(".theme-settings__options-wrapper")
        var cid = $(this).attr("id").replace("viewtype_","");
        var send_data = $.param({"id": cid});
        var adata = ajax_call_no_alert("sales_ajax/ajax_load_business_item",send_data );
        $(".theme-settings__options-wrapper").html(adata.message);
        init_page(cid);
        var send_dataa=[];
        send_dataa.push({'key':'id', 'value' : cid});
        enable_common_dataTable( 'Sales_ajax/ajax_asset_details' ,"#edm_dataTable",action_asset,aocolumnDefs_asset,"", send_dataa);
        
        unblock_ajax_ui(".theme-settings__options-wrapper");
      }
      //
  });

  $(document).on("click","#x",function(e) {
      $('.ui-theme-settings').modal('toggle');
  });

function init_page(cid) {

  $('.inline_editable').editable({
    container: 'body',
    sourceCache: true,
    emptytext: 'empty', 
    placement: 'left',
    validate: function(value){
    if(value=="")
      return "Please Provide Value. ";
    }  
  });


  $('.inline_editable_reminder').editable({
    container: 'body',
    sourceCache: true,
    emptytext: 'empty', 
    placement: 'left',
    format: 'yyyy-mm-dd hh:ii',    
    viewformat: 'dd/mm/yyyy hh:ii',    
    datetimepicker: {
            weekStart: 1
       },
    validate: function(value){
    if(value=="")
      return "Please Provide Value. ";
    }  
  });

   $("#upload_prospect_file").click(function (argument) {
     block_ajax_ui();
     var url =site_url + "Sales_ajax/ajax_upload" ;
     event.preventDefault();
     var send_data = new FormData($("#right_content_setting")[0]);
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
              var send_dataa=[];
              send_dataa.push({'key':'id', 'value' : cid});
              enable_common_dataTable( 'Sales_ajax/ajax_asset_details' ,"#edm_dataTable",action_asset,aocolumnDefs_asset,"", send_dataa);
             
              $("#exampleFile").val("");
               unblock_ajax_ui();
            }
            else
            {
              unblock_ajax_ui();
              Swal.fire({
                type: "warning",
                title: "Not process. try again!!",
                text: "Please Check your file and try re-uploading",
                
              });
            }
            
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
}