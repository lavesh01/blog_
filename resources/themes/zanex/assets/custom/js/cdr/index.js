var action = [];
  var aocolumnDefs_recording_all =  [                          
      {   
          "aTargets": [2],
          //"mData": "first_name",
          "mRender": function (data, type, full) {
           return '<audio controls><source src="'+data+'" type="audio/mpeg">Not support the audio </audio>';
          }
      }
      
    ];
var return_datatable = enable_common_dataTable( 'Cdr/ajax_getCdr' ,"#cdr_datatable",action,aocolumnDefs_recording_all);


