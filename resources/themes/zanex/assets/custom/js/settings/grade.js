var htmldatatable_id = "#common_dataTable";
var action = [
                    { "class":"edit_grade","icon":"fa fa-edit text-info", "id":"edit_grade", "href":"#","title":"Edit Grade Details"},
                    { "class":"delete_grade","icon":"fa fa-trash text-danger", "id":"delete_", "href":"#","title":"Delete Grade Details"},
              ];  
$(document).ready(function() {
	 

 draw_table();

 } );

//Delete modal popup
$(document).on('click','.delete_grade',function(){

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
        var adata = ajax_call("Settings_ajax/delete_grades",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Grade is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});





//open modal popup of grade
$(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#gradeModel').appendTo("body").modal('show');
    })
} );

//Save grade model function
$(document).ready(function () {       
 
  $('#save_grade_details').on('click', function () {

   var Grade = $('#Grade').val();
   var qualityGrade = $('#qualityGrade').val();
   var cdqaGrade = $('#cdqaGrade').val();
   var name = $('#name').val();
   if(Grade=="" && name=="")
    {
      swal("Form Fields Missing","Enter Grade, Enter Name");
      return false;
    }
    else if(Grade=="")
    {
      swal("Agent Point Missing","Enter Points");
      return false;
    }
   else if(name=="")
    {
      swal("Name Missing","Enter Name");
      return false;
    }
    if(cdqaGrade=="")
    {
      swal("CDQa Point Missing","Enter Points");
      return false;
    }
    if(qualityGrade=="")
    {
      swal("Quality Point Missing","Enter Points");
      return false;
    }
    var send_data = $("#grade_form_details").serialize();
    var adata = ajax_call("Settings_ajax/add_grade_details",send_data );
    if(adata.type == "failed")
    {
       $('#Grade').val(''); 
       $('#gradeModel').modal('show'); 
       return false;
        
    }
    else if(adata.type == "info")
    {   
        $('#gradeModel').modal('show');
        $('#name').val('');  
        return false;
        
    }
    else if(adata.type == "success")
    {
       $('#gradeModel').modal('hide');
       $('#Grade').val('');
       $('#name').val('');
       $('#qualityGrade').val('');
       $('#cdqaGrade').val('');
       draw_table();
       return false;
    }
    else if(adata.type == "error")
    {
       $('#gradeModel').modal('show');
       return false;
    }  
    else
    {
        $('#gradeModel').modal('show');
        return false;
    } 
   
  });
});  





//Auto Refreshing Data table function
var dt_test;
function draw_table(type="") {
enable_common_dataTable( 'Settings_ajax/grade_details' ,htmldatatable_id,action);


}


//fetch Grade Model
$(document).on('click','.edit_grade',function(){
  var grade_id = $(this).attr("id").replace("edit_grade","");
   $('#grade_id').val(grade_id);
    $.ajax({
    url:"Settings_ajax/fetch_grades",
    method:"POST",
    data:{grade_id:grade_id},
    dataType:"json", 
     beforeSend: function() {
       $('#grade_name').val('');
       $('#grade_list').val('');
       $('#uqualityGrade').val('');
       $('#ucdqaGrade').val('');
    },
    success:function(res)
    {
    $('#grade_name').val(res.data.name);
    $('#grade_list').val(res.data.grade);
    $('#uqualityGrade').val(res.data.qualityGrade);
    $('#ucdqaGrade').val(res.data.cdqaGrade);
    }
   });
  $('#update_grade').appendTo("body").modal('show');
 
});

//Update grade script
$('#update_grade_details').on('click', function () {
    
   var Grade = $('#grade_name').val();
   var name = $('#grade_list').val();
     if(Grade=="" && name=="")
    {
      swal("Form Fields Missing","Enter Grade, Enter Name");
      return false;
    }
    else if(Grade=="")
    {
      swal("Grade Missing","Enter Grade");
      return false;
    }
   else if(name=="")
    {
      swal("Name Missing","Enter Name");
      return false;
    }
    if(cdqaGrade=="")
    {
      swal("CDQa Point Missing","Enter Points");
      return false;
    }
    if(qualityGrade=="")
    {
      swal("Quality Point Missing","Enter Points");
      return false;
    }
    var send_data = $("#update_grade_form_details").serialize();
    var adata = ajax_call("Settings_ajax/update_gradedetails",send_data );
    if(adata.type == "success")
    {
       $('#update_grade').modal('hide');
        $('#grade_name').val('');
         $('#grade_list').val('');

       draw_table();
       return false;
    }
    else
    {
        $('#update_grade').modal('show');
       return false;
    }
    
  });

