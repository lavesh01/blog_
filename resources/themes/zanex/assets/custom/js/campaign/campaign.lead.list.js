
var aocolumnDefs =  [
                 {    
                      "aTargets": [0],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                        return  '<a title="View/Map Recording" href="#" data-toggle="tooltip" data-placement="top" class="fonticon-wrap map_audio_recordings" id="lead_id'+data+'"><i class=" fa fa-music icon-gradient bg-ripe-malin"></i></a> ';

                      }
                  },
                  { "bVisible": false, "aTargets": [ 1 ] },
                  { "bVisible": false, "aTargets": [ 2 ] },
                  {    
                      "aTargets": [3],
                      //"mData": "first_name",
                      "bSearchable": true,
                      "mRender": function (data, type, full) {
                        if(data == 0)
                        {
                            return "No";
                        }
                        else if(data == 1)
                        {
                            return "Prospect";
                        }
                        else if(data == 2)
                        {
                            return "Company";
                        }
                        else if(data == 3)
                        {
                            return "Number";
                        }
                        else
                        {
                            return "";
                        }
                      }
                   },
                    {    
                      "aTargets": [4],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                        if(data == 0)
                        {
                            return '<i data-toggle="tooltip" data-placement="top" title="Yes! Have Consent" class="fa fa-check icon-gradient bg-malibu-beach"></i>';
                        }
                        else if(data == 1)
                        {
                           return '<i data-toggle="tooltip" data-placement="top" title="No! Have No Consent" class="fa fa-times icon-gradient bg-love-kiss"></i>';
                        }
                        else
                        {
                            return "";
                        }

                      }
                   },
                   {    
                      "aTargets": [5],
                      //"mData": "first_name",
                      "mRender": function (data, type, full) {
                        if(data == 0)
                        {
                            return '<i data-toggle="tooltip" data-placement="top" title="Yes! Web Verified" class="pe-7s-check icon-gradient bg-malibu-beach"></i>';
                        }
                        else if(data == 1)
                        {
                           return '<i data-toggle="tooltip" data-placement="top" title="No! Not Web Verified" class="fa fa-times icon-gradient bg-love-kiss" ></i>';
                        }
                        else
                        {
                            return "";
                        }
                      }
                   },
               ];
var action = [];
var send_data = [];
send_data.push({'key':'campaign_id', 'value' : $("#campaign_id").val()});
send_data.push({'key':'status', 'value' : '3' });
send_data.push({'key':'agent', 'value' : $("#typeofagent").val() });
enable_common_dataTable( 'Lead_ajax/viewCampaignLeadListQualified/' ,"#leadlist_dataTable",action,aocolumnDefs,"",send_data);

$('.access_group').on('click', function () {
  
  var this_click = $(this).data("module");
    $("#access_group_text").text($(this).text() + " - ");
    var send_data = [];
    send_data.push({'key':'campaign_id', 'value' : $("#campaign_id").val()});
    send_data.push({'key':'status', 'value' : this_click });
    send_data.push({'key':'agent', 'value' : $("#typeofagent").val() });
    enable_common_dataTable( 'Lead_ajax/viewCampaignLeadListQualified/' ,"#leadlist_dataTable",action,aocolumnDefs,"",send_data);
});



