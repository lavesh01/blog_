
$(document).ready(function() {
var action = []; 
var aocolumnDefs =  {};
var send_data = [];
send_data.push({'key':'exportid', 'value' : $("#exportid").val()});
enable_common_dataTable( 'Prospects/ajax_viewExportedData' ,"#edm_dataTable",action,aocolumnDefs,"", send_data);
});