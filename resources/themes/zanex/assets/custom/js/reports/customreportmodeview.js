 var send_data = [];

 send_data.push({'key':'id', 'value' : ($("#cstrptid").val())});
 var data =    enable_common_dataTable( 'Report/customreportmodeview' ,"#customrreportview_dataTable","","","",send_data );

 $('#reportDataSummaryButton').click(function(argument) {
   var send_data = $.param({"id":1});
   ajax_call_no_alert('Report/customreportmodeview' + '/field_data', send_data,true,"JSON",'init_ajax(data)');

   ajax_call_no_alert('Report/ajax_getchartByIDjson', "",true,"JSON",'init_ajax_chartlist(data)');
   $('#reportDataSummaryModal').appendTo("body").modal('show');
});


function init_ajax(data) {
    $('#collapse1_number .panel-body').html("");
    $('#collapse2_text .panel-body').html("");
    $('#collapse3_datetime .panel-body').html("");
    $('#collapse3_spatial .panel-body').html("");
    $.each(data.field_data, function(index, column) {
        var row = $('<div>');
        row.append($('<span>').text(column.name));
        if (column.typeCategory == "Numeric") {
          $('#collapse1_number .panel-body').append(row)
        }
        if (column.typeCategory == "String") {
          $('#collapse2_text .panel-body').append(row)
        }
        if (column.typeCategory == "Date and time") {
          $('#collapse3_datetime .panel-body').append(row)
        }
        if (column.typeCategory == "Spatial") {
          $('#collapse3_spatial .panel-body').append(row)
        }
    });
}

var options;
function init_ajax_chartlist(data) {
   $("#ul_charticonslist").html("");
   $.each(data.data, function(index, column) {
    $("#ul_charticonslist").append('<li class="icons-list-item chattypeanchor" data-id="'+column.id+'"><i class="'+column.icon+'" data-bs-toggle="tooltip" >' + column.name + '</i></li>');
   });
   $('.chattypeanchor').click(function(argument) {
       var aajson =  ajax_call_no_alert('Report/ajax_getchartByIDjson/'+$(this).attr("data-id")+'/json');
       options = new JSONedtr(JSON.parse(aajson.data[0].json), '#chatoption', {runFunctionOnUpdate:'getDataOnChange', instantChange: true}  );
    });
}

//$(document).on('click','.chattypeanchor',function(){

function generateapexchart(selector,options) {
  
  var chart = new ApexCharts(document.querySelector(selector), options);
  chart.render();

}


