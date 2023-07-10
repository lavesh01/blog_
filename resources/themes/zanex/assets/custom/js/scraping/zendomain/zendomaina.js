var send_data=[];
send_data.push({'key':'module', 'value' : $("#module").val()});
send_data.push({'key':'asset_id', 'value' : $("#asset_id").val()});
enable_common_dataTable( 'Zenui/ajax_getdomain_data' ,"#api_dataTable","","","",send_data);


$(document).on('click','#remaining_company',function(){
  var adata = ajax_call_no_alert("Zenui/ajax_getdomain_remainingcount","",false );
	$('#remaining_company_count').text(adata.c);
});

$(document).on('click','#export_btn',function(){
  ajax_call("Zenui/exportdata/"+$("#module").val()+"/"+$("#asset_id").val(),"",false );
});

