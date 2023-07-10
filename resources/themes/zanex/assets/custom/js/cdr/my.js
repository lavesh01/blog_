  var aocolumnDefs_recording =  [                          
    
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

enable_common_dataTable( 'Cdr/ajax_mygetCdr' ,"#recording_dataTable","",aocolumnDefs_recording);

