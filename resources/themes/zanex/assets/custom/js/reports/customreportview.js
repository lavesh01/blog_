  $("#errormessagediv").hide();
 var send_data = [];
 send_data.push({'key':'query', 'value' : btoa($("#sqlarea").val())});
 send_data.push({'key':'id', 'value' : ($("#cstrptid").val())});
 send_data.push({'key':'save', 'value' : 'no'});


 $('#run-btn').click(function(argument) {
     changesavestatus('no','save');
     changesavestatus(btoa($("#sqlarea").val()),'query');
     rendercustomreportdata();
     unblock_ajax_ui();
  });

$('#save-run-btn').click(function(argument) {
     changesavestatus('yes','save');
      changesavestatus(btoa($("#sqlarea").val()),'query');
     rendercustomreportdata();
     unblock_ajax_ui();
  });




 function changesavestatus(value,key)
 {

  var saveObject = $.grep(send_data, function(obj) {
    return obj.key === key;
  })[0];
  saveObject.value = value;
 }

 function rendercustomreportdata(argument) {
   if ( $.fn.DataTable.isDataTable('#customrreportview_dataTable') ) {
        $('#customrreportview_dataTable').DataTable().destroy();
      }
      $("#customrreportview_dataTable").html("");
      var data =    enable_common_dataTable( 'Report/executesql' ,"#customrreportview_dataTable","","","",send_data ); 
     if (data.hasOwnProperty('code')) {
        $("#errormessage").text(data.message);
        $("#errormessagediv").show();

     }
     else{
      $("#errormessagediv").hide();
     }
 }
