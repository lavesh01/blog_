  var action = [];  


  var aocolumnDefs =  [
    {    
        "aTargets": [0],
        "mRender": function (data, type, full) {
          var icons_str = "";
          if (full.group_type == 'cdqa')
          {
            icons_str = "";
            icons_str =  icons_str + '<a title="Add Prospect" style="cursor:pointer" href="'+site_url + 'ContentDiscovery/manual/'+data+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-edit icon-gradient bg-happy-fisher"></i> </a> ';
            icons_str =  icons_str + '<a title="Bulk Upload Prospect" style="cursor:pointer" href="'+site_url + 'ContentDiscovery/uploadrpf/'+data+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-upload icon-gradient bg-sunny-morning"></i> </a> ';
            icons_str =  icons_str + '<a title="My Upoaded Prospect" style="cursor:pointer" href="'+site_url + 'Campaign/myleads/'+data+'/'+full.group_type+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-database  icon-gradient bg-premium-dark"></i> </a> ';
          }
          else if (full.group_type == 'quality') {
            icons_str = "";
            icons_str =  icons_str + '<a title="Quality" style="cursor:pointer" href="'+site_url + 'Quality/leads/'+data+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-rocket icon-gradient bg-malibu-beach"></i> </a> ';
            icons_str =  icons_str + '<a title="My Quality Leads" style="cursor:pointer" href="'+site_url + 'Campaign/myleads/'+data+'/'+full.group_type+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-database  icon-gradient bg-premium-dark"></i> </a> ';
            icons_str =  icons_str + '<a title="Lead Filter" style="cursor:pointer" href="'+site_url + 'Lead/search/quality/'+data+'/'+full.group_type+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-filter icon-gradient bg-strong-bliss"></i> </a> ';
          }
          else if (full.group_type == 'agent') {
            icons_str = "";
            icons_str =  icons_str + '<a title="CD & Dialing" style="cursor:pointer" href="'+site_url + 'Agent/manual/'+data+'"  data-toggle="tooltip"  data-placement="top"   ><img src="'+site_url+'resources/themes/iconimage/manualdial.png" width="25px"> </a> ';
            icons_str =  icons_str + '<a title="Auto Dialing" style="cursor:pointer" href="'+site_url + 'Agent/index/'+data+'"  data-toggle="tooltip"  data-placement="top"   ><img src="'+site_url+'resources/themes/iconimage/auto.png" width="25px"></a> ';
            icons_str =  icons_str + '<a title="Call Backs" style="cursor:pointer" href="'+site_url + 'Campaign/callbacks/'+data+'/'+full.group_type+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-calendar  icon-gradient bg-ripe-malin"></i> </a> ';
            icons_str =  icons_str + '<a title="My Leads" style="cursor:pointer" href="'+site_url + 'Campaign/myleads/'+data+'/'+full.group_type+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-database  icon-gradient bg-premium-dark"></i> </a> ';
            icons_str =  icons_str + '<a title="Lead Filter" style="cursor:pointer" href="'+site_url + 'Lead/search/agent/'+data+'/'+full.group_type+'"  data-toggle="tooltip"  data-placement="top"   ><i class="fa fa-filter icon-gradient bg-strong-bliss"></i> </a> ';
          }
          
          else
          {
            icons_str  = data;
          }
          return icons_str;
        }
      },
      {    
          "aTargets": [9],
          //"mData": "first_name",
          "mRender": function (data, type, full) {
            //console.log(data);
             if ( data == "0") {
              return '<div class="badge bg-pill bg-warning text-center">Draft</div>';
                      
             }
             else if ( data == "1") {
             return '<div class="badge bg-pill bg-info text-center">Live</div>';
             }
             else if ( data == "2") {
              return '<div class="badge bg-pill bg-success text-center">Completed</div>';
             }
             else
             {
              return "";
             }
          }
      }
   ];  


rendertable()


function rendertable()
{
  var send_data = [];
  send_data.push({'key':'module', 'value' : $("#access_group").val() });
  send_data.push({'key':'status', 'value' : $("#type").val() });
  enable_common_dataTable( 'Usergroupaccess/campaignlistdata' ,"#edm_dataTable",action,aocolumnDefs,"",send_data);
}

$('.access_group').on('click', function () {
  var this_click = $(this).data("module");
  var current_datatable = $("#access_group").val();
  $("#access_group_text").text($(this).text() );
  $("#access_group").val(this_click );
  rendertable();
});

$('.access_type').on('click', function () {
  var this_click = $(this).data("module");
   $("#access_type_text").text($(this).text() );
   $("#type").val(this_click ); 
   rendertable();   
});