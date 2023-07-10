var htmldatatable_id = "#common_dataTable";
var htmldatatable_id1 = "#subdisposition_data";
var dt_test1;
var type=""

$(document).ready(function() {

	var action = [
        
         { "class":"edit_qualitydisposition","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"quality_edit", "href":"#","title":"Edit Quality Dispositions"},
        { "class":"add_dispositions","icon":"fa fa-eye icon-gradient bg-mixed-hopes", "id":"sub_dispositions", "href":"#", "title":"View & Add Sub Dispositions"},
       { "class":"delete_disposition","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Quality Dispositions"},
		];
        
enable_common_dataTable( 'dispositions_ajax/quality_dispositiondetails' ,htmldatatable_id,action);

 } );

  var action_sub = [
                 { "class":"edit_sub_disposition","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_sub_dispositions", "href":"#","title":"Edit Sub Dispositions"},
                 { "class":"delete_dispositions","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Sub Dispositions"},
                
               ];
$(document).on('click','.add_dispositions',function(){
  var disposition_id = $(this).attr("id").replace("sub_dispositions","");
  var disposition_data = [{ "key":"disposition_id","value":disposition_id}];
   $('#agent_disposition_id').val(disposition_id);
  $('#agentsubdispositionModel').appendTo("body").modal('show');

  enable_common_dataTable( 'dispositions_ajax/quality_subdispositions' ,"#subdisposition_data",action_sub,{},"",disposition_data);
 
});

//Edit Dispositions
$(document).on('click','.edit_qualitydisposition',function(){
  var disposition_id = $(this).attr("id").replace("quality_edit","");
   $('#disposition_id').val(disposition_id);
    $.ajax({
    url:"Dispositions_ajax/fetch_qualitydispositions",
    method:"POST",
    data:{disposition_id:disposition_id},
    beforeSend: function() {
       $('#dispositionanames').val('');
    },
    success:function(data)
    {
 
     $('#dispositionanames').val(data);
    
    }
   });

   $('#update_disposition').appendTo("body").modal('show');

});

//Edit Sub Dispositions
$(document).on('click','.edit_sub_disposition',function(){
   var sub_disposition_id = $(this).attr("id").replace("edit_sub_dispositions","");
   $('#sub_disposition_id').val(sub_disposition_id);
   
   $.ajax({
    url:"Dispositions_ajax/fetch_subQualitySubDispositions",
    method:"POST",
    data:{sub_disposition_id:sub_disposition_id},
    beforeSend: function() {
       $('#subdisposition_names').val('');
    },
    success:function(data)
    {
     $('#subdisposition_names').val(data);
    
    }
   });

  $('#update_sub_disposiion').appendTo("body").modal('show');
 
});


//Delete Subdispositions
$(document).on('click','.delete_dispositions',function(){

 $("#ajax_id").val($(this).attr('id').replace("delete_",""));
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
        var adata = ajax_call("Dispositions_ajax/delete_qualitydispositions",send_data);
       
    var disposition_id = $('#sub_disposition_id').val();
    var disposition_data = [{ "key":"disposition_id","value":disposition_id}];
     enable_common_dataTable( 'dispositions_ajax/quality_subdispositions' ,"#subdisposition_data",action_sub,{},"",disposition_data);

        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Sub Disposition is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});	


//Delete Dispositions
$(document).on('click','.delete_disposition',function(){

 $("#ajax_id").val($(this).attr('id').replace("delete_",""));
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
        var adata = ajax_call("Dispositions_ajax/delete_quality_disposition",send_data);
        console.log(adata.type);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Disposition is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

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