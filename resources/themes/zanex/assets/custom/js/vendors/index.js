

function submitAddVendorForm() {
    var send_data  = $("#vendor-form").serialize();
    var adata = ajax_call("vendor/Vendor/add_vendor",send_data );
    if(adata.type == "success")
    {
      loadmyexpenses();
      return false;
    }
}

 
function customfunction_modalopen() {
  $(".listofvendors_dataTable_datatable_row").on("click",".css_name",function(e) {
     $('#addDocModal').modal('show');
     var docid = ( $(this).parent(".listofvendors_dataTable_datatable_row").attr("data-id") );
      $("#selected_vendor").val(docid);
       var adata = ajax_call_no_alert("vendor/Vendor/ajax_getdocuments/"+docid );
       $("#document-upload-form").html("");
       for (var i = adata.docs.length - 1; i >= 0; i--) {
        
        $("#document-upload-form").append(function_name(adata.docs[i].id,adata.docs[i].name,adata.docs[i].file_path));
          
       }
  });
}


/*
$('#addExpenseModal').on('shown.bs.modal', function() {
    var adata = ajax_call_no_alert("vendor/Vendor/ajax_get_projectsncategoary" );
    if(adata.type == "success")
    {
      $('#newProject').html("");
      $('#newCategory').html("");
      $.each(adata.projects, function(key, value) {
          $('#newProject').append($('<option>').text(value.name).attr('value', value.id));
      });
      $.each(adata.category, function(key, value) {
          $('#newCategory').append($('<option>').text(value.name).attr('value', value.id));
      });
    }
});
*/
  var aocolumnDefs =  [
          {        
              "aTargets": [0],
              //"mData": "first_name",
               "title": "<input type='checkbox' id='selectAll'></input>",
              "sTitle": "<input type='checkbox' id='selectAll'></input>",
              "mRender": function (data, type, full) {
                if (full.status == 0) {
                 return full.status + '<input type="checkbox" class="checkbox_datatable fonticon-wrap view_leads" id="checked'+data+'" value="checked'+data+'">';
                }
              }
          },
          {
          "aTargets": [1],
          //"mData": "first_name",
          "mRender": function (data, type, full) {
            //console.log(data);
             if ( data == "0") {
              return '<div class="badge bg-pill bg-warning text-center">Pending</div>';
                      
             }
             else if ( data == "1") {
             return '<div class="badge bg-pill bg-info text-center">Approved</div>';
             }
             else if ( data == "2") {
              return '<div class="badge bg-pill bg-danger text-center">Reject</div>';
             }
             else
             {
              return "";
             }
          }
      }
   ];  

var checkbox_datatable = [];
function checkbox_datatable_check()
{
  customfunction_modalopen()
  $(".checkbox_datatable").change(function() {
      if(this.checked) {
          checkbox_datatable.push($(this).val());
      }
      else
      {
        checkbox_datatable.splice( $.inArray($(this).val(),checkbox_datatable) ,1 );
      }
  });
  for (var i = checkbox_datatable.length - 1; i >= 0; i--) {
    $("#"+checkbox_datatable[i]).prop('checked', true);
  } 
}

function loadmyexpenses() {
  
  var action = [
                    { "html_element": "checkbox", "class":"view_leads","icon":"fa fa-plus icon-gradient bg-ripe-malin", "id":"checked_id"}
                   
              ]; 
    enable_common_dataTable( 'vendor/Vendor/ajax_all' ,"#listofvendors_dataTable",action,aocolumnDefs,"checkbox_datatable_check()");
} ;

loadmyexpenses() 

function function_name(id, type, file ) {

   var docdiv  = `<form id="doc_type_id_`+id+`">
                  <div class="row" > 
                  <input type="hidden" name="id" value="`+id+`" />
                    <div class="col-md-5">
                         <label for="documenttypelabel" class="form-label">`+type+`</label>
                    </div>
                    `;
                    if (file == null || file == "" || file == "null" || file == "undefined") {
                    docdiv  += `<div class="col-md-5">
                        <input class="form-control" type="file"  name="file">
                    </div><div class="col-md-2">
                      <a href="#" class="btn btn-primary savedocbtn">Save</a>
                    </div>`;
                    }
                    else
                    {
                      docdiv  += `<div class="col-md-5">` + file +
                                   
                                `</div>`;
                    }
                    docdiv  += `
                </div> </form>`;
    return docdiv;
 } 

$(document).on('click','.savedocbtn',function(e){

   block_ajax_ui();
   var selected_vendor = $("#selected_vendor").val();
   var url =site_url + "vendor/Vendor/upload_doc/" + selected_vendor ;
   e.preventDefault();
   var formdoc = $(this).closest('form').attr('id');
   var send_data = new FormData($("#"+formdoc)[0]);
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
            //$("#upload_prospect_file").val("");
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
   return false;
});