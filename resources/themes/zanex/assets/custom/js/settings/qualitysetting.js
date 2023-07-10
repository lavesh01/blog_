  var htmldatatable_id1 = "#subdisposition_data";
var dt_test1;
var type=""

$(document).ready(function () {       
 
  $('#save_qualitydetails').on('click', function () {

   var name = $('#name').val();
  
    if(name=="")
    {
      swal("Disposition Missing","Enter Disposition");
      return false;
    }

    var send_data = $("#quality_disposition").serialize();
    var adata = ajax_call("Dispositions_ajax/add_qualitydisposition",send_data );
    if(adata.type=="info")
    {
        $('#agentModel').modal('show');

          return false;       
    }
    else if(adata.type=="repeat")
    {
      $('#name').val('');
      $('#agentModel').modal('show');
       
         return false;
    }
    else if(adata.type=="success")
    {
      $('#name').val('');
       $('#agentModel').modal('hide');
        draw_table();
         return false;
    }
   
  });

     var action_sub = [
                { "class":"edit_sub_disposition","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_sub_dispositions", "href":"#","title":"Edit Sub Dispositions"},
                 { "class":"delete_dispositions","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Sub Dispositions"},
                 
               ];

 $('#subdisposition_btn').on('click', function () {
    var send_data = $("#subdispositions_form").serialize();
    var adata = ajax_call("Dispositions_ajax/insert_qualitydispositions",send_data );

    var disposition_id = $('#agent_disposition_id').val();
    var disposition_data = [{ "key":"disposition_id","value":disposition_id}];
enable_common_dataTable( 'dispositions_ajax/quality_subdispositions' ,"#subdisposition_data",action_sub,{},"",disposition_data);

   draw_table();

    return false;
  });

});  


var htmldatatable_id = "#common_dataTable";
var dt_test;
function draw_table(type="") {
 
  var action = [
        { "class":"edit_qualitydisposition","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"quality_edit", "href":"#","title":"Edit Dispositions"},
        { "class":"add_dispositions","icon":"fa fa-eye icon-gradient bg-mixed-hopes", "id":"sub_dispositions", "href":"#", "title":" Add User"},
        { "class":"delete_disposition","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Dispositions"},
        
    ];
  if (type=="") {
    dt_test = enable_common_dataTable( 'dispositions_ajax/quality_dispositiondetails' ,htmldatatable_id,action);


  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'dispositions_ajax/quality_dispositiondetails' ,htmldatatable_id,action);


  }

}


 $('#update_disposition_details').on('click', function () {

   var dispositionanames = $('#dispositionanames').val();
  
    if(dispositionanames=="")
    {
      swal("Disposition Missing","Enter Disposition");
      return false;
    }

    var send_data = $("#update_disposiion").serialize();
    var adata = ajax_call("Dispositions_ajax/update_qualitydisposition",send_data );
    if(adata.type=="info")
    {
       $('#update_disposition').modal('show');
       draw_table();
       return false;
    }
    else if(adata.type=="success")
    {
       $('#update_disposition').modal('hide');
       draw_table();
       return false;
    }
    
  });


$('#update_sub_disposition_details').on('click', function () {

  var subdisposition_names = $('#subdisposition_names').val();
    if(subdisposition_names=="")
    {
      swal("Sub Disposition Missing","Enter Sub Disposition");
      return false;
    }
    var send_data = $("#update_sub_disposiions").serialize();
    var adata = ajax_call("Dispositions_ajax/update_qualitysub_disposition",send_data );
   var disposition_id = $('#agent_disposition_id').val();
    var disposition_data = [{ "key":"disposition_id","value":disposition_id}];
     enable_common_dataTable( 'dispositions_ajax/quality_subdispositions' ,"#subdisposition_data",action_sub,{},"",disposition_data);

   draw_table();
    return false;
  });


$(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#agentModel').appendTo("body").modal('show');
    })
} );
