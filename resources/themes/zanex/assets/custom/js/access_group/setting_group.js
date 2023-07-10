//Access Table
var action = [ ];
  var aocolumnDefs =  [
                     {    
                        "aTargets": [0],
                        "bVisible": false,
                        "visible": false
                      },
                      {    
                        "aTargets": [2],
                        "mRender": function (data, type, full) {
                            return '<a title="Check add user" style="cursor:pointer" href="#" data-toggle="tooltip"  data-placement="top" class="click_add_user_to_group_access"  data-groupid = '+full.Action+'>'+data+' </a> ';
                        }
                      },
                      {    
                        "aTargets": [4],
                        "mRender": function (data, type, full) {
                            return '<a title="Delete Group" style="cursor:pointer" href="#" data-toggle="tooltip"  data-placement="top" class="delete_add_user_to_group_access"  data-groupid = '+full.Action+'> <i class="fa fa-trash icon-gradient bg-love-kiss"> </i></a> ';
                        }
                      }
                      ,
                      {    
                        "aTargets": [3],
                        "visible": false
                      }
                   ];  


$(document).ready(function() {


  refresh_access_table();
    
} );

function refresh_access_table(module1="agent"){
  
    var send_data = [];
    //send_data.push({'key':'campaign_id', 'value' : $('#Campaign_id').val()});
    send_data.push({'key':'module', 'value' : $("#access_group").val()});
    enable_common_dataTable( 'Usergroupaccess/getGroupAll/' ,"#common_dataTable_usergroup",action,aocolumnDefs,"checkbox_datatable_check()",send_data);
}


function checkbox_datatable_check()
{
    $(".click_enable").change(function() {
      if(this.checked) {
      ajax_call('Usergroupaccess/addGroupFromCampaign/', "campaign_id="+$('#Campaign_id').val()+"&select=0&group_id="+$(this).val() ); 
      }
      else
      {
       ajax_call('Usergroupaccess/removeGroupFromCampaign/', "campaign_id="+$('#Campaign_id').val()+"&select=1&group_id="+$(this).val() );
      }
      refresh_access_table();
  });


  
}


$('.access_group').on('click', function () {
  
  var current_datatable = $("#access_group").val();
  var this_click = $(this).data("module");
  if (current_datatable !=this_click )
  {
    $("#access_group_text").text(this_click + " - ");
    var send_data = [];
    send_data.push({'key':'campaign_id', 'value' : $('#Campaign_id').val()});
    send_data.push({'key':'module', 'value' : this_click});
    enable_common_dataTable( 'Usergroupaccess/getGroupAll/' ,"#common_dataTable_usergroup",action,aocolumnDefs,"",send_data);
  }
  $("#access_group").val(this_click);


});


$(document).on('click','.click_add_user_to_group_access',function(){
  $("#groupid").val($(this).data('groupid'));
  var send_data = [];
    var aocolumnDefs_1 =  [
                    {    
                        "aTargets": [0],
                        "mRender": function (data, type, full) {
                           var chked = "";
                           if (full.cid != '' && full.cid != null && full.cid !== undefined ) {
                             chked = "checked";   
                            }
                            return '<label><input type="checkbox"  title="Check enable this group" data-toggle="tooltip"  data-placement="top" class="click_enable_user"  value="'+data+'" '+chked+' > </label> ';
                        }
                      },
                      {
                        "aTargets": [2],
                        visible: false
                      }
                   ];  
    send_data.push({'key':'group_id', 'value' : $(this).data("groupid")});
    
    //enable_common_dataTable( 'Usergroupaccess/listCampaignUserOfAGroup/' ,"#subdisposition_data",'',aocolumnDefs_1,"",send_data);
   $("#subdisposition_data").DataTable({
          pageLength: 20,
          lengthMenu: [20, 30, 50, 75, 100],
          order: [],
          paging: true,
          searching: true,
          info: true,
          data: [],
          destroy: true,
          bAutoWidth : true,
          buttons: [
            {
                text: 'My button',
                action: function ( e, dt, node, config ) {
                    alert( 'Button activated' );
                }
            }
        ],

        "sScrollXInner": "100%",
        "scrollX": false,
        "processing": true,
        "serverSide": true,
        "destroy": true,
        "scrollCollapse": true,
        "bLengthChange": true,
        "bFilter": false,
        "bSort": false,
        "bInfo": true,
        "bAutoWidth": false,
        "bJQueryUI": false,
        "responsive": true,
        "pagingType": "full_numbers",
          "columns":  [
              {"title": "Action" ,"data": "Action" },
              {"title": "Name","data": "username"},                    
              {"title": "Test","data": "cid"}
            ],
          "aoColumnDefs": aocolumnDefs_1,
          "ajax": {
             
              "type": "POST",
              "url": site_url + '/Usergroupaccess/listCampaignUserOfAGroup',
              "data": function(d){ 
                $.each(send_data, function(key, value) {
                      d[value.key] = value.value;
                });
                return d;
              },
              complete: function(response) {
                  $(".click_enable_user").change(function() {
                    if(this.checked) {
                    ajax_call('Usergroupaccess/addUserFromGroup/', "group_id="+$("#groupid").val()+"&user_id="+$(this).val() ); 
                    }
                    else
                    {
                     ajax_call('Usergroupaccess/removeUserFromGroup/', "group_id="+$("#groupid").val()+"&user_id="+$(this).val() ); 
                    }
                    refresh_access_table();
                });
            },
          },
     });
   $('#agentsubdispositionModel').appendTo("body").modal('show');
});


$('.add_new_access_group').on('click', function () {
  $('#add_new_access_group').appendTo("body").modal('show');
});



$('#save_add_new_access_group').on('click', function () {

  ajax_call('Usergroupaccess/add/', "name="+$('#group_new_name').val()+"&select=1&module="+$("#access_group").val() );
  $('#group_new_name').val('');
  refresh_access_table();
});


$(document).on('click','.delete_add_user_to_group_access',function(){

 $("#deletegroupid").val($(this).data('groupid'));
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
        var send_data = $("#form_access").serialize();
        var adata = ajax_call("Usergroupaccess/delete",send_data);
        if (adata.type == "success") {
          refresh_access_table();
        }
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          title: 'Cancelled',
          text: 'Designation is safe :)',
          type: 'error',
          confirmButtonClass: 'btn btn-success',
        })
      }
    })

});