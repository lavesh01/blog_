
var aocolumnDefs =  [
                 
                  //{ "bVisible": false, "aTargets": [ 2 ] },
                  {    

                /* <option value="">Ideal</option>
                <option value="1">Meeting</option>
                <option value="2">Dailing</option>
                <option value="3">CDQA</option>
                <option value="4">Audit</option>
                <option value="5">Reporting</option>
                <option value="6">Delivery</option>
                <option value="7">Break</option>
                <option value="8">Day End</option>
    */
                      "aTargets": [1],
                      //"mData": "first_name",
                      "bSearchable": true,
                      "mRender": function (data, type, full) {
                        if(data == 1)
                        {
                            return "Meeting";
                        }
                        else if(data == 2)
                        {
                            return "Dailing";
                        }
                        else if(data == 3)
                        {
                            return "CDQA";
                        }
                        else if(data == 4)
                        {
                            return "Audit";
                        }
                        else if(data == 5)
                        {
                            return "Reporting";
                        }
                        else if(data == 6)
                        {
                            return "Delivery";
                        }
                        else if(data == 7)
                        {
                            return "Break";
                        }
                        else if(data == 8)
                        {
                            return "Day End";
                        }
                        else
                        {
                            return "";
                        }
                      }
                   }
               ];
var action = [];
var send_data = [];
//send_data.push({'key':'date', 'value' : '2022-08-23'});
enable_common_dataTable( 'Timetracker/task_list/' ,"#edm_dataTable",action,aocolumnDefs,"",send_data);

$('.time_li_dates').on('click', function () {
  
  var this_click = $(this).data("date");

    $("#access_group_text").text(this_click + " - ");
    var send_data = [];
    send_data.push({'key':'date', 'value' : this_click});
    enable_common_dataTable( 'Timetracker/task_list/' ,"#edm_dataTable",action,aocolumnDefs,"",send_data);

  $("#access_group").text(this_click);

});