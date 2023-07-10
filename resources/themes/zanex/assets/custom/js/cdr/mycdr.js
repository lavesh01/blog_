  var aocolumnDefs_recording =  [                          
    {    
        "aTargets": [0],
        "mRender": function (data, type, full) {
            var c = "";
            if ( full.lead_id != "0") {c="checked";}
            return '<label><input type="checkbox"  title="Check To Map" data-toggle="tooltip"  data-placement="top" class="click_to_map" '+c+'  value="'+data+'"> </label> ';
        }
      },
      {    
        "aTargets": [1],
        "bVisible": false,
        "mRender": function (data, type, full) {
            var c = data;
            if ( data == "0") {c="";}
            return c;
        }
      },
      {   
          "aTargets": [2],
          //"mData": "first_name",
          "mRender": function (data, type, full) {
           return '<audio controls><source src="'+data+'" type="audio/mpeg">Not support the audio </audio>';
          }
      }
      
    ];

$(document).on('click','.map_audio_recordings',function(){
  $('#map_audio_recordings').appendTo("body").modal('show');
  var lead_id = $(this).attr("id").replace("lead_id","");
   $('#lead_id').val(lead_id);
   var send_ext_data = [];
   send_ext_data.push({'key':'lead_id', 'value' : lead_id});
   enable_common_dataTable( 'Cdr/ajax_mygetCdr' ,"#recording_dataTable","",aocolumnDefs_recording,"",send_ext_data);

 });

$(document).on('click','.map_audio_recordings_agent_manual',function(){
  $('#map_audio_recordings').appendTo("body").modal('show');
   var send_ext_data = [];
   send_ext_data.push({'key':'lead_id', 'value' : $('#lead_id').val()});
   enable_common_dataTable( 'Cdr/ajax_mygetCdr' ,"#recording_dataTable","",aocolumnDefs_recording,"",send_ext_data);

 });

$(document).on('click','.click_to_map',function(){
    //alert($('#lead_id').val()); return;
    if(this.checked) 
    {
      ajax_call('Cdr/leadrecordingupdate/', "lead_id="+$('#lead_id').val()+"&select=0&recordig_id="+$(this).val() ); 
    }
    else
    {
       ajax_call('Cdr/leadrecordingupdate/', "lead_id="+$('#lead_id').val()+"&select=1&recordig_id="+$(this).val() );
    }
});
