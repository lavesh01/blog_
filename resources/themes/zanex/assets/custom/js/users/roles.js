//Approve Leads table
var action = [

{ "class":"edit_Roles","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_Roles", "href":"#","title":"Edit Roles"},
{ "class":"add_Roles","icon":"fa fa-eye icon-gradient bg-mixed-hopes", "id":"sub_Roles", "href":site_url+"users/permission/", "title":"Add Permission"},
{ "class":"delete_Roles","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_Roles", "href":"#", "title":"Delete Roles"},

      ];   
var aocolumnDefs =  [ ];
enable_common_dataTable( 'Users_ajax/ajax_rolelist' ,"#edm_dataTable",action,aocolumnDefs);
 
$(document).ready(function() {
  $("#add_role").click(function (argument) {
     $("#myModalLabel34").text("Add New Role");
     $("#description").val("");
     $("#role_name").val("");
     $("#redirecturl").val("");
     $("action").val("new");
    $('#userModel').appendTo("body").modal('show');
    return false;
  });

  $("#save_btn").click(function (argument) {
   var send_data = $("#new_user_form").serialize();
    var adata = ajax_call("users_ajax/ajax_add_role",send_data);
    enable_common_dataTable( 'Users_ajax/ajax_rolelist' ,"#edm_dataTable",action,aocolumnDefs);
    return false;
  });

      //Edit Role
    $(document).on('click','.edit_Roles',function(){
      var edit_Roles = $(this).attr("id").replace("edit_Roles","");
      $("#role_id").val(edit_Roles);
      $("#action").val("edit");
      var adata = ajax_call_no_alert("users_ajax/ajax_getrole/"+edit_Roles,""); 

      if (adata.type == "success") {
         $("#myModalLabel34").text("Edit Role - " + adata.role_name);
         $("#Description").val(adata.description);
         $("#role_name").val(adata.role_name);
         $("#redirecturl").val(adata.login_destination);
         $('#userModel').appendTo("body").modal('show');
      }   
      else
      {
        Swal.fire({
              title: 'Something went wrong',
              text: 'Please try again.)',
              type: 'error',
              confirmButtonClass: 'btn btn-success',
            })
      }

     
     return false;
    });

          //delete Role
    $(document).on('click','.delete_Roles',function(){
      var delete_Roles = $(this).attr("id").replace("delete_Roles","");
            var tr = $(this).closest('td').closest('tr');
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
            
            $("#role_id").val(delete_Roles);
            $("#action").val("delete");
            var adata = ajax_call("users_ajax/ajax_deleterole/"+delete_Roles,""); 
            if (adata.type == "success") {tr.remove() ;}
            return false;
          }
        }); 
    })


});