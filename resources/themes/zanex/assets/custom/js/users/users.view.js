var htmldatatable_id = "#common_dataTable";
var aocolumnDefs =  [
                   {    
                        "aTargets": [4],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                          
                           if ( data == "1") {
                            return '<span style="color:green;" class="">Yes</span>';
                           }
                           else if ( data == "0") {
                           return '<span style="color:red;" class="">No</span>';
                           }
                           else if ( data == "2") {
                            return "Completed";
                           }
                        }
                      },
                      {
                         "aTargets": [5],
                        "mRender": function (data, type, full) {
                           if ( data == "1") {
                            return '<span style="color:green;" class="">Yes</span>';
                           }
                           else if ( data == "0") {
                           return '<span style="color:red;" class="">No</span>';
                           }
                           else if ( data == "2") {
                            return "Completed";
                           }
                        }
                      },
                      {
                         "aTargets": [6],
                        "mRender": function (data, type, full) {
                           if ( data == "1") {
                            return '<span style="color:green;" class="">Yes</span>';
                           }
                           else if ( data == "0") {
                           return '<span style="color:red;" class="">No</span>';
                           }
                           else if ( data == "2") {
                            return "Completed";
                           }
                        }
                      }


                    
                ];

   var action = [

        { "class":"edit_users","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_dispositions", "href":"#","title":"Edit Users"},
        
        { "class":"add_extensiopn","icon":"fa fa-phone icon-gradient bg-mixed-hopes", "id":"add_extensiopn", "href":"#","title":"Add & View Extension"},
        { "class":"delete_users","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Users"},
        
      ];
$(document).ready(function() {

  
        
enable_common_dataTable( 'users_ajax/users' ,htmldatatable_id,action,aocolumnDefs);

 } );


//Edit Users
$(document).on('click','.edit_users',function(){

var disposition_id = $(this).attr("id").replace("edit_dispositions","");
 
   $('#user_id').val(disposition_id);

   $.ajax({
    url:"Users_ajax/fetch_usersData",
    method:"POST",
    data:{disposition_id:disposition_id},
    dataType:"json", 
    beforeSend: function() {
       $('#role_u').val('');
       $('#email_u').val('');
       $('#Username_u').val('');
       $('#password_u').val('');
    },
    success:function(res)
    {
    $('#role_u').val(res.data.role_id);
    $('#email_u').val(res.data.email);
    $('#Username_u').val(res.data.username);
    $('#password_u').val(res.data.password_hash);
    
    $("input[name=banned_r][value=" + res.data.banned + "]").prop('checked', true);
     $("input[name=active_r][value=" + res.data.active + "]").prop('checked', true);
    }
   }); 


   $('#userModel_update').appendTo("body").modal('show');

 
 
});



//Add User Extension
/*
$(document).on('click','.add_extensiopn',function(){
  var extension_id = $(this).attr("id").replace("add_extensiopn","");
   $('#extension_id').val(extension_id);

   $.ajax({
    url:"Users_ajax/fetch_userExtensionData",
    method:"POST",
    data:{extension_id:extension_id},
    dataType:"json", 
    beforeSend: function() {
       $('#ip_address').val('');
       $('#port').val('');
       $('#path').val('');
       $('#extension').val('');
       $('#name').val('');
       $('#passwordd').val('');
    },
    success:function(res)
    {
    $('#ip_address').val(res.data.ip_address);
    $('#port').val(res.data.port);
    $('#path').val(res.data.path);
    $('#extension').val(res.data.extension);
    $('#name').val(res.data.name);
    $('#passwordd').val(res.data.password);
    }
   }); 


   $('#extension_model').appendTo("body").modal('show');

 }); 
*/
//Delete Users
$(document).on('click','.delete_user_extension',function(){

 $("#ajax_id").val($(this).attr('id').replace("extdelete_",""));
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
        var adata = ajax_call("Users_ajax/delete_user_extensions",send_data);        
        if (adata.type == "success") {
          $("#extdelete_" + $("#ajax_id").val()).closest('tr').remove();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Extension is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })
}); 


$(document).on('click','.add_extensiopn',function(){
  var extension_id = $(this).attr("id").replace("add_extensiopn","");
   $('#extension_id').val(extension_id);
      var ext_action = [
        { "class":"delete_user_extension","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"extdelete_", "href":"#","title":"Delete Users"},
        
      ];
   $('#extension_model').appendTo("body").modal('show');
   var send_ext_data = [];
   send_ext_data.push({'key':'user_id', 'value' : extension_id});
   enable_common_dataTable( 'users_ajax/user_extensions' ,"#extension_dataTable",ext_action,"","",send_ext_data);

 });

if ($("#provider").val() == "1") {
      $('#ip_address').parent('div').parent('div').hide();
      $('#port').parent('div').parent('div').hide();
      $('#path').parent('div').parent('div').hide();
      $('#extension').parent('div').parent('div').hide();
      $('#passwordd').parent('div').parent('div').hide();
   }

$(document).on('change','#provider',function(){
   if ($(this).val() == "1") {
      $('#ip_address').parent('div').parent('div').hide();
      $('#port').parent('div').parent('div').hide();
      $('#path').parent('div').parent('div').hide();
      $('#extension').parent('div').parent('div').hide();
      $('#passwordd').parent('div').parent('div').hide();
   }
   else
   {
      $('#ip_address').parent('div').parent('div').show();
      $('#port').parent('div').parent('div').show();
      $('#path').parent('div').parent('div').show();
      $('#extension').parent('div').parent('div').show();
      $('#passwordd').parent('div').parent('div').show();
   }
});


//Delete Users
$(document).on('click','.delete_users',function(){

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
        var adata = ajax_call("Users_ajax/delete_users",send_data);
        
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'User is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })



});	

var dt_test;
function draw_table(type="") {
    dt_test = enable_common_dataTable( 'users_ajax/users' ,htmldatatable_id,action,aocolumnDefs);
}




$(function()  
{  
$('#add').click(function()  
{  
addnewrow();  
});  
$('body').delegate('.remove','click',function()  
{  
$(this).parent().parent().remove();  
}); 

}); 
function addnewrow()   
{  
var n=($('.detail tr').length-0)+1;  

var tr = '<tr>'+  
'<td class="no"><input type="text" placeholder="Enter Server Address" title="Enter Server Address" class="form-control form-control-sm"  id="ip_address" name="ip_address[]"></td>'+  
'<td><input type="text" placeholder="Enter Web Socket Port" title="Enter Web Socket Port" class="form-control form-control-sm" id="port" name="port[]"></td> '+  
'<td><input type="text" placeholder="Web Socket Path" title="Web Socket Path" class="form-control form-control-sm" name="path[]" id="path"></td>   '+  
'<td><input type="text" placeholder="Enter Subscribe Extension" title="Enter Subscribe Extension" class="form-control form-control-sm" name="extension[]" id="extension"></td>'+
'<td><input type="text" placeholder="Enter Full Name" title="Enter Full Name" class="form-control form-control-sm" name="name[]" id="name"></td>'+
'<td><input type="password" placeholder="Enter Password" title="Enter Password" class="form-control form-control-sm" name="password[]" id="passwordd"></td>'+
'<td><a href="#" class="remove">Delete</td>'+  
'</tr>';  



$('.detail').append(tr);   

}     
      

