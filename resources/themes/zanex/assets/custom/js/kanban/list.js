
var aocolumnDefs =  [
               ];
var action = [];
var send_data = [];
//send_data.push({'key':'date', 'value' : '2022-08-23'});
enable_common_dataTable( 'Kanban/getKanBanBoardItemList/' ,"#edm_dataTable",action,aocolumnDefs,"",send_data);

$('.time_li_dates').on('click', function () {
  
  var this_click = $(this).data("kanbanname");

    $("#access_group_text").text(this_click + " - ");
    var send_data = [];
    send_data.push({'key':'kanbanname', 'value' : this_click});
    enable_common_dataTable( 'Kanban/getKanBanBoardItemList/' ,"#edm_dataTable",action,aocolumnDefs,"",send_data);

  $("#access_group").text(this_click);

});