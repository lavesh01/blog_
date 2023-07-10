$(document).ready(function () {    


 
  $('#save_btn').on('click', function () {

    var email = $('#email').val();
    var Username = $('#Username').val();
    var password = $('#password').val();
    var role = $('#role').val();

    if(email=="" && Username=="" && password=="" && role=="")
    {
      swal("Form Fileds Missing","Enter Email ID, Enter Username, Enter Password, Select Role");
      return false;
    }
    else if(email=="")
    {
      swal("Email ID Missing","Enter Email ID");
      return false;
    }
    else if(Username=="")
    {
      swal("User Name Missing","Enter User Name");
      return false;
    }
     else if(password=="")
    {
      swal("Password Missing","Enter Password");
      return false;
    }
     else if(role=="")
    {
      swal("Role Missing","Select Role");
      return false;
    }
    

    var send_data = $("#new_user_form").serialize();
    var adata = ajax_call("Users_ajax/add_new_user",send_data );

    if(adata.type=="info")
    {
       $('#userModel').modal('show');
       return false;
    
    }
    else if(adata.type=="success")
    { 
      $('#userModel').modal('hide');
      $('#email').val('');
	  $('#Username').val('');
	  $('#role').val('');
	  $('#password').val('');	 
	   	 
         draw_table();   
         return false; 

    }
	 else if(adata.type=="email_reserve")
    {
      $('#email').val('');
      $('#userModel').modal('show');
      return false; 
        
       
    }
    else if(adata.type=="repeat")
    {
      $('#Username').val('');
      $('#userModel').modal('show');
      return false; 
         
    }
   
    
    
  });



  //Update User Details
  $('#update_btn').on('click', function () {
    
    var email_u = $('#email_u').val();
    var Username_u = $('#Username_u').val();
    var password_u = $('#password_u').val();
    var role_u = $('#role_u').val();

    if(email_u=="" && Username_u=="" && password_u=="" && role_u=="")
    {
      swal("Form Fileds Missing","Enter Email ID, Enter Username, Enter Password, Select Role");
      return false;
    }
    else if(email_u=="")
    {
      swal("Email ID Missing","Enter Email ID");
      return false;
    }
    else if(Username_u=="")
    {
      swal("User Name Missing","Enter User Name");
      return false;
    }
     else if(password_u=="")
    {
      swal("Password Missing","Enter Password");
      return false;
    }
     else if(role_u=="")
    {
      swal("Role Missing","Select Role");
      return false;
    }

    var send_data = $("#user_update_form").serialize();
    var adata = ajax_call("Users_ajax/updateUserDetails",send_data );
    if(adata.type=="info")
    {
         $('#userModel_update').modal('show');
         
         draw_table();   
         return false;   
    }
    else if(adata.type=="success")
    { 
      $('#userModel_update').modal('hide');
       console.log(adata);
         draw_table();   
         return false; 

    }
    else
    {
         draw_table();   
         return false; 
    }
    

    
   

    
  });

});






var htmldatatable_id = "#common_dataTable";
var dt_test;
function draw_table(type="") {

  var aocolumnDefs =  [
                   {    
                        "aTargets": [3],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                          
                           if ( data == "0") {
                            return '<span style="color:green;" class="">Yes</span>';
                           }
                           else if ( data == "1") {
                           return '<span style="color:red;" class="">No</span>';
                           }
                           else if ( data == "2") {
                            return "Completed";
                           }
                        }
                      },
                      {
                         "aTargets": [4],
                        "mRender": function (data, type, full) {
                           if ( data == "0") {
                            return '<span style="color:green;" class="">Yes</span>';
                           }
                           else if ( data == "1") {
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
                           if ( data == "0") {
                            return '<span style="color:green;" class="">Yes</span>';
                           }
                           else if ( data == "1") {
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
       
        { "class":"add_extensiopn","icon":"fa fa-phone icon-gradient bg-mixed-hopes", "id":"add_extensiopn", "href":"#","title":"Add & Edit Extension"},
         { "class":"delete_users","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Users"},
        
    ];
 
  if (type=="") {
    dt_test = enable_common_dataTable( 'users_ajax/users' ,htmldatatable_id,action,aocolumnDefs);
  }
  else
  {
    dt_test.destroy();
    dt_test = enable_common_dataTable( 'users_ajax/users' ,htmldatatable_id,action,aocolumnDefs);
  }

}


$('#update_users_details').on('click', function () {
    var send_data = $("#edit_users_detailss").serialize();
    var adata = ajax_call("Users_ajax/updateUserDetails",send_data);
    draw_table();

    return false;
  });

function checkEmailID()
{
	var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var email=$('#email').val();
    if(!regex.test(email))
   	{
   		$('#email').val("");
   		$('#email').focus();
   		swal("Invalid..!", "Enter Valid Email ID")
   		return false;
   	}	
}	

function checkEmailID1()
{
  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var email_u=$('#email_u').val();
    if(!regex.test(email_u))
    {
      $('#email_u').val("");
      $('#email_u').focus();
      swal("Invalid..!", "Enter Valid Email ID")
      return false;
    } 
} 

 $(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#userModel').appendTo("body").modal('show');
    })
} );



 //Add User Extension Details   
$('#add_user_Extension_details').on('click', function () {

    var ip_address = $('#ip_address').val();
    var port = $('#port').val();
    var path = $('#path').val();
    var extension = $('#extension').val();
    var name = $('#name').val();
    var password = $('#password').val();
    var provider = $('#provider').val();

    if(provider=="1")
    {
       if(name=="")
      {
         swal("Name Missing","Enter Name");
         return false;
      }
    }
    else{

      if(ip_address=="" && port=="" && path=="" && extension=="" && name=="" && password=="")
      {
        swal("Form Fileds Missing","Enter IP Address, Enter Port, Enter Path, Enter Extension, Enter Name, Enter Password");
        return false;
      }
      else if(ip_address=="")
      {
         swal("IP Address Missing","Enter IP Address");
         return false;
      }
       else if(port=="")
      {
         swal("Port Missing","Enter Port");
         return false;
      }
      else if(path=="")
      {
         swal("Path Missing","Enter Path");
         return false;
      }
      else if(extension=="")
      {
         swal("Extension Missing","Enter Extension");
         return false;
      }
      else if(name=="")
      {
         swal("Name Missing","Enter Name");
         return false;
      }
      else if(password=="")
      {
         swal("Password Missing","Enter Password");
         return false;
      }
    }

    var send_data = $("#add_suer_extension").serialize();
    var adata = ajax_call("Users_ajax/add_user_extension",send_data );
    if(adata.type=="info")
	{
		
		 $('#extension_model').modal('show');
         return false; 
	}
	else if(adata.type=="success")
	{
	   $('#extension_model').modal('hide');	
	   draw_table();
       return false; 
    
		
	}	
	else if(adata.type=="warning")
	{
		  $('#extension_model').modal('show');
          return false; 
    
	}	
	else{
		 draw_table();
		 $('#extension_model').modal('hide');	
          return false; 
      }

  return false;
  });