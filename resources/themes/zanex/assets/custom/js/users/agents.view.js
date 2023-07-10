var htmldatatable_id = "#common_dataTable";
var htmldatatable_id1 = "#subdisposition_data";
var dt_test1;
var type=""
$(document).ready(function() {
  

	var action = [

        { "class":"edit_disposition","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_dispositions", "href":"#","title":"Edit Dispositions"},
        { "class":"add_dispositions","icon":"fa fa-eye icon-gradient bg-mixed-hopes", "id":"sub_dispositions", "href":"#", "title":" View & Add Sub Dispositions"},
        { "class":"delete_disposition","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Dispositions"},
              ];   

  


enable_common_dataTable( 'dispositions_ajax/agent_dispositiondetails' ,htmldatatable_id,action);

 

 } );

  var action_sub = [
             
                 { "class":"edit_sub_disposition","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_sub_dispositions", "href":"#","title":"Edit Sub Dispositions"},
                 { "class":"delete_dispositions","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete SubDispositions"},
               ];
$(document).on('click','.add_dispositions',function(){
  
  var disposition_id = $(this).attr("id").replace("sub_dispositions","");
  var disposition_data = [{ "key":"disposition_id", "value":disposition_id}];
  enable_common_dataTable( 'dispositions_ajax/agent_subdispositiondetails' ,"#subdisposition_data",action_sub,{},"",disposition_data);
   $('#agent_disposition_id').val(disposition_id);
  $('#agentsubdispositionModel').appendTo("body").modal('show');

});

//Edit Dispositions
$(document).on('click','.edit_disposition',function(){
  var disposition_id = $(this).attr("id").replace("edit_dispositions","");
   $('#disposition_id').val(disposition_id);
    $.ajax({
    url:"Dispositions_ajax/fetch_dispositions",
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
    url:"Dispositions_ajax/fetch_subdispositions",
    method:"POST",
    data:{sub_disposition_id:sub_disposition_id},
    beforeSend: function() {
       $('#subdisposition_names').val('');
    },
    success:function(dataresult)
    {
   
     $('#subdisposition_names').val(dataresult);
    
    }
   });
  $('#update_subdisposition').appendTo("body").modal('show');
 
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
        var adata = ajax_call("Dispositions_ajax/delete_dispositions",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();


      var disposition_id = $('#agent_disposition_id').val();
      var disposition_data = [{ "key":"disposition_id", "value":disposition_id}];
      enable_common_dataTable( 'dispositions_ajax/agent_subdispositiondetails' ,htmldatatable_id1,action_sub,{},"",disposition_data);  
    draw_table();


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
        var adata = ajax_call("Dispositions_ajax/delete_disposition",send_data);
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

        { "class":"edit_disposition","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_dispositions", "href":"#","title":"Edit Dispositions"},
        { "class":"add_dispositions","icon":"fa fa-eye icon-gradient bg-mixed-hopes", "id":"sub_dispositions", "href":"#", "title":" View & Add Sub Dispositions"},
        { "class":"delete_disposition","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Dispositions"},
              ];  
  dt_test = enable_common_dataTable( 'dispositions_ajax/agent_dispositiondetails' ,htmldatatable_id,action);
}



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
    url:site_url + "Dispositions_ajax/delete_all",
    method:"POST",
    data:{checkbox_value:checkbox_value},
    success:function()
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