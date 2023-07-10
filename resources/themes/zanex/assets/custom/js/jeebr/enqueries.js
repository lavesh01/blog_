 //enable_common_dataTable( 'jeebr/ajax_getall' ,"#edm_dataTable","","","");

function filter(){
    var send_data = [];
    send_data.push({'key':'start', 'value' : $('#startdate').val()});
    send_data.push({'key':'end', 'value' : $("#enddate").val()});

    $('#edm_dataTable').DataTable({ 
            "ajax": {
                "url": site_url  + '/jeebr/Enqueries/ajax_getall',
                "type": "POST",

                "data": function(d){ 
                  $.each(send_data, function(key, value) {
                        d[value.key] = value.value;
                  });
                  
                  return d;
                },
            },

            columns: [
                { data: 'ip', title: 'IP' },
                
                { data: 'date_created', title: 'Date Created' },
                { data: 'Name', title: 'Name' },
                { data: 'Prefix', title: 'Prefix' },
                { data: 'First', title: 'First' },
                { data: 'Middle', title: 'Middle' },
                { data: 'Last', title: 'Last' },
                { data: 'Suffix', title: 'Suffix' },
                { data: 'Email', title: 'Email' },
                { data: 'Phone', title: 'Phone' },
                { data: 'Select Service', title: 'Select Service' },
                { data: 'Select Location', title: 'Select Location' },
                { data: 'Comment', title: 'Comment' },
                { data: 'source_url', title: 'Source URL' },
                { data: 'user_agent', title: 'User Agent' },
            ],
           "destroy": true,
          "bDestroy":true,
          "buttons": [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
    });

}
 $('#filter_btn').on('click', function () {
    filter();
});

$('#export_btn').on('click', function () {
    var send_data = $.param({"start": $('#startdate').val(),"end": $('#enddate').val() });
    ajax_call("jeebr/Enqueries/ajax_exportall",send_data  );
});