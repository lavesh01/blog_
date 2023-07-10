var htmldatatable_id = "#common_dataTable";

$(document).ready(function() {
	var action = [
                    { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_type", "href":"#","title":"Edit Type Details"},
                    { "class":"add_states","icon":"fa fa-eye icon-gradient bg-mixed-hopes", "id":"state_names", "href":"#", "title":" View & Add State"},
                    { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Type Details"},
              ];   
enable_common_dataTable( 'Settings_ajax/country_list' ,htmldatatable_id,action);

 

 } );


//open modal popup of country
$(document).ready(function() {
    
      $("#add_user").click(function (argument) {
      $('#typeModel').appendTo("body").modal('show');
    })
} );


$(document).ready(function () {       
 
  $('#save_details').on('click', function () {
   
   var country_name=$('#country_name').val();
   if(country_name=="")
    {
      swal("Country Missing","Enter Country Name");
      return false;
    }

    var send_data = $("#type_form_details").serialize();
    var adata = ajax_call("Settings_ajax/add_country_details",send_data );
    if(adata.type == "info")
    {
       $('#country_name').val('');  

        return false;
    }
    else if(adata.type == "warning")
    {
       $('#country_name').val('');  
       
        return false;
    }
    else if(adata.type == "success")
    {
       $('#typeModel').modal('hide');
       $('#country_name').val('');  
        draw_table();
        return false;
    }
    draw_table();
    return false;
  });
});  



//Delete modal popup
$(document).on('click','.delete_type',function(){

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
        var adata = ajax_call("Settings_ajax/delete_country",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Country is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});


///Auto Refreshing Data table function
var dt_test;
function draw_table(type="") {
 var action = [
                    { "class":"edit_type","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_type", "href":"#","title":"Edit Type Details"},
                    { "class":"add_states","icon":"fa fa-eye icon-gradient bg-mixed-hopes", "id":"state_names", "href":"#", "title":" View & Add State"},
                    { "class":"delete_type","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete Type Details"},
              ];   


  if (type=="") {
    dt_test = enable_common_dataTable( 'Settings_ajax/country_list' ,htmldatatable_id,action);

  }
  else
  {
    dt_test.destroy();
    dt_test =enable_common_dataTable( 'Settings_ajax/country_list' ,htmldatatable_id,action);

  }

}


//fetch Grade Model
$(document).on('click','.edit_type',function(){
  var country_id = $(this).attr("id").replace("edit_type","");
   $('#country_id').val(country_id);
    $.ajax({
    url:"Settings_ajax/fetch_country_details",
    method:"POST",
    data:{country_id:country_id},
    beforeSend: function() {
       $('#country_names').val('');
    },
    success:function(dataresult)
    {
        
     $('#country_names').val(dataresult);

    
    }
   });
  $('#update_country').appendTo("body").modal('show');
 
});


$('#update_type_details').on('click', function () {
    
  var country_names=$('#country_names').val();
   if(country_names=="")
    {
      swal("Country Missing","Enter Country Name");
      return false;
    }

    var send_data = $("#update_country_form_details").serialize();
    var adata = ajax_call("Settings_ajax/update_countrydetails",send_data );
    if(adata.type== "info")
    {
       $('#update_country').modal('show');
       draw_table();
       return false;
    }
    else if(adata.type == "success")
    {
       $('#update_country').modal('hide');
        $('#country_names').val('');
       draw_table();
       return false;
    }
    else
    {
        $('#update_country').modal('show');
       draw_table();
       return false;
    } 
  });






$(document).on('click','.add_states',function(){
  var country_id = $(this).attr("id").replace("state_names","");
  var country_data = [{ "country_id":country_id}, { "country_id":country_id}];
   $('#countryID').val(country_id);
  $('#statemodel').appendTo("body").modal('show');
  var action = [
             
                 { "class":"edit_state","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_state", "href":"#","title":"Edit State"},
                 { "class":"delete_state","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete State"},
               ];
  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);
 
});



var type=""
var dt_test1;
$('#state_name').on('change', function () {
     var send_data = $("#state_form_details").serialize();
     var country_id = $('#countryID').val();
     var country_data = [{ "country_id2":country_id}, { "country_id":country_id}];
     var adata = ajax_call("Settings_ajax/insert_state",send_data );
     if(adata.type=="info")
    {
       $('#statemodel').modal('show');
       var action = [
             
                 { "class":"edit_state","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_state", "href":"#","title":"Edit State"},
                 { "class":"delete_state","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete State"},
               ];
  if (type=="") {

    dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
  else
  {
    dt_test1.destroy();
    dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
         return false;
          draw_table();
    }
   else if(adata.type=="error")
    {
       $('#state_name').val('');
       var action = [
             
                 { "class":"edit_state","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_state", "href":"#","title":"Edit State"},
                 { "class":"delete_state","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete State"},
               ];
  if (type=="") {

    dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
  else
  {
    dt_test1.destroy();
   dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
        draw_table();
         return false;

    }
   else if(adata.type=="success")
    {
       $('#state_name').val('');
      var action = [
             
                 { "class":"edit_state","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_state", "href":"#","title":"Edit State"},
                 { "class":"delete_state","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete State"},
               ];
  if (type=="") {

    dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
  else
  {
    dt_test1.destroy();
    dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
        draw_table();
         return false;
    }  
    else
    {
    var action = [
             
                 { "class":"edit_state","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_state", "href":"#","title":"Edit State"},
                 { "class":"delete_state","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete State"},
               ];
  if (type=="") {

   dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
  else
  {
    dt_test1.destroy();
   dt_test1 =  enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }

  draw_table();
    return false;
  }
  });
 


 //Edit Sub Dispositions
$(document).on('click','.edit_state',function(){
  var state_id = $(this).attr("id").replace("edit_state","");
   $('#state_id').val(state_id);
    $.ajax({
    url:"Settings_ajax/fetch_state",
    method:"POST",
    data:{state_id:state_id},
    beforeSend: function() {
       $('#stateName').val('');
    },
    success:function(dataresult)
    {

     $('#stateName').val(dataresult);

    }
   });
  $('#update_state').appendTo("body").modal('show');
 
});




$('#update_country_state_details').on('click', function () {

    var stateName=$('#stateName').val();
   if(stateName=="")
    {
      swal("State Missing","Enter State Name");
      return false;
    }

    var send_data = $("#update_countrystate").serialize();
    var adata = ajax_call("Settings_ajax/update_state_details",send_data );
   
     var country_id = $('#countryID').val();
     var country_data = [{ "country_id2":country_id}, { "country_id":country_id}];
    var action = [
             
                 { "class":"edit_state","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_state", "href":"#","title":"Edit State"},
                 { "class":"delete_state","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete State"},
               ];
  if (type=="") {

    dt_test1 = enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }
  else
  {
    dt_test1.destroy();
    dt_test1 = enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

  }

  draw_table();
    return false;
  });


//Delete modal popup
$(document).on('click','.delete_state',function(){

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
        var adata = ajax_call("Settings_ajax/delete_state_details",send_data);
        if (adata.type == "success") {
          $("#dttr_" + $("#ajax_id").val()).remove();
           var country_id = $('#countryID').val();
           var country_data = [{ "country_id2":country_id}, { "country_id":country_id}];
           var action = [
             
                 { "class":"edit_state","icon":"fa fa-edit icon-gradient bg-happy-green", "id":"edit_state", "href":"#","title":"Edit State"},
                 { "class":"delete_state","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#","title":"Delete State"},
               ];
    if (type=="") {

     dt_test1 = enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

    }
   else
   {
     dt_test1.destroy();
     dt_test1 = enable_common_dataTable( 'Settings_ajax/state_details' ,"#state_data",action,{},"",country_data);

   }
          draw_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'State is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});