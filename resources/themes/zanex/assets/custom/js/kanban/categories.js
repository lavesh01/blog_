  var action = [
          { "class":"delete","icon":"fa fa-trash icon-gradient bg-love-kiss", "id":"delete_", "href":"#", "title":"Delete"},
          { "class":"sync","icon":"fa fa-keyboard icon-gradient bg-mixed-hopes", "id":"sync_", "href": "#",
           "title":"Check status"},
           { "class":"apipush","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"upload_", "href": "#",
           "title":"Push Lead API"},
        
        ];
    var action_api = [
           { "class":"apiaddinput","icon":"fa fa-plus icon-gradient bg-premium-dark", "id":"apiaddinput_", "href": "#",
           "title":"Add New Board Status"},
           { "class":"apishowinput","icon":"fa fa-arrow-circle-right icon-gradient bg-love-kiss", "id":"apishowinput_", "href":"#" ,
           "title":"View Status"},
           { "class":"apiredirct","icon":"fa fa-link icon-gradient bg-plum-plate", "id":"apiredirct_", "href": site_url + '/Api/api/',
           "title":"View Board"},
        ];

$("#inputype").change(function() {
    if ($("#inputype").val() =="select" || $("#inputype").val() =="selectmultiple" || $("#inputype").val() =="select2" || $("#inputype").val() =="selectmultiple2" ) {
      $("#placeholder").attr("placeholder","|| seperated values");
    } 
    else{
       $("#placeholder").attr("placeholder","placeholder");
    }
});

$(document).ready(function() {
    $("#add_user").click(function (argument) {
      $('#modal_create_api').appendTo("body").modal('show');
    })
});

$('#save_btn').on('click', function () {

    var send_data = $("#insert_api_details").serialize();
    var adata = ajax_call("Kanban/add_new_category",send_data );
    if(adata.type=="success")
    {
       enable_common_dataTable( 'Kanban/ajax_getallcategories' ,"#api_dataTable",action_api,"","");
       //$("#insert_api_details").reset();
       $('#modal_create_api').modal('hide');

       return false;
    }
    
});

enable_common_dataTable( 'Kanban/ajax_getallcategories' ,"#api_dataTable",action_api,"","");

$(document).on('click','.apiaddinput',function(e){

     var id = $(this).attr("id").replace("apiaddinput_","");
     $('#addinputmodal').appendTo("body").modal('show');
     $("#ref_id").val(id);
});

$(document).on('click','.apishowinput',function(e){

     var id = $(this).attr("id").replace("apishowinput_","");
     $("#ref_id").val(id);
     
    var send_data_ki = [{ "key":"id", "value":id}];
    enable_common_dataTable( 'Kanban/get_board_items/' ,"#kanbanitems_dataTable",[],"","sortable()",send_data_ki);

});

function sortable()
{
  var fixHelper = function(e, ui) {
    ui.children().each(function() {
      $(this).width($(this).width());
    });
    return ui;
  };

  $("#kanbanitems_dataTable  tbody").sortable({
    helper: fixHelper,
    update: function(event, ui) { 
            getOrder() 
        }
  }).disableSelection();
}

function getOrder(){
    var order= $(".kanbanitems_dataTable_datatable_row").map(function() {        
        return this.id;        
    }).get();
    //console.log(order);
    f='order='+order;
    $.ajax({
        type: "POST",
        data :f,
        cache: false,
        url: site_url+"Kanban/ajax_order_status",
        success: function(data){
            //success
        }
    });
    return order;
}
$('#add_new_field').on('click', function (e) {
      e.preventDefault();
    var id = $("#ref_id").val();
    var send_data = $("#addinputmodalform").serialize();
    var adata = ajax_call("Kanban/add_new_status/" + id,send_data,false,2 );
    if(adata.type=="success")
    {
       $("#title").val("");
       $("#order_number").val("");
       var send_data_ki = [{ "key":"id", "value":id}];
       enable_common_dataTable( 'Kanban/get_board_items/' ,"#kanbanitems_dataTable",[],"","sortable()",send_data_ki); 
       //$('#modal_create_api').modal('hide');
       return false;
    }
    
  });



