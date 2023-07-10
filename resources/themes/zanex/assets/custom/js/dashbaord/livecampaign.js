
window.Apex = {
    dataLabels: {
        enabled: false
    },
    stroke: {
        width: 2
    },
};

$(document).ready(function() {

ajax_call_no_alert('Dashboard/get_ajax_data/ajax_totalcampaign/' + $("#days").val(),"",true ,"JSON","chart_3(data)");

 $.ajax({
      type: "POST",
      async: true,
      cache:false,
      dataType: 'JSON',
      url: site_url + 'Dashboard/get_ajax_data/' + $("#days").val() ,
      //data: send_data + "&" + $("#crsf_value").attr("name") +"="+ $("#crsf_value").val() ,
      success: function (data) {
       // unblock_ajax_ui()
     /* drawdashboard(data);
      chart_draw(data);
      topagent(data);
	  qualityagent(data) ;
	  cdqagent(data);
	  chart_2(data);
	  chart_3(data);*/
		$('[data-toggle="tooltip"]').tooltip();
      },
      error: function (data) {
      	$('[data-toggle="tooltip"]').tooltip();
        //unblock_ajax_ui()
      }
  });
});


function drawdashboard(data) {
	
    try {
    	$("#ajax_totalcampaign").text(data.jsonchart.ajax_totalcampaign[0].count);
    	$('.ajax_totalcampaign').circleProgress({
                value:data.jsonchart.ajax_totalcampaign[0].achieved_percentage,
                size: 46,
                lineCap: 'round',
                fill: {gradient: ['#007bff', '#16aaff']}

        }).on('circle-animation-progress', function (event, progress, stepValue) {
            $(this).find('small').html('<span data-toggle="tooltip" data-placement="top" title=" Total Lead Required: '+data.jsonchart.ajax_totalcampaign[0].total_lead+' And Acheived : '+data.jsonchart.ajax_totalcampaign[0].total_lead_achieved+'">' + stepValue.toFixed(2).substr(2) + '<span>');
        });


        $("#ajax_livecampaign_live").text(data.jsonchart.ajax_livecampaign[0].count);
    	$('.ajax_livecampaign_live').circleProgress({
                value:data.jsonchart.ajax_livecampaign[0].total_lead_achieved/data.jsonchart.ajax_livecampaign[0].total_lead,
                size: 46,
                lineCap: 'round',
                fill: {gradient: ['#007bff', '#16aaff']}

        }).on('circle-animation-progress', function (event, progress, stepValue) {
            $(this).find('small').html('<span data-toggle="tooltip" data-placement="top" title=" Total Lead Required: '+data.jsonchart.ajax_livecampaign[0].total_lead+' And Acheived : '+data.jsonchart.ajax_livecampaign[0].total_lead_achieved+'">' + stepValue.toFixed(2).substr(2) + '<span>');
        });


        $("#ajax_livecampaign_comleted").text(data.jsonchart.ajax_livecampaign[1].count);
    	$('.ajax_livecampaign_comleted').circleProgress({
                value:data.jsonchart.ajax_livecampaign[1].total_lead_achieved/data.jsonchart.ajax_livecampaign[1].total_lead,
                size: 46,
                lineCap: 'round',
                fill: {gradient: ['#007bff', '#16aaff']}

        }).on('circle-animation-progress', function (event, progress, stepValue) {
            $(this).find('small').html('<span data-toggle="tooltip" data-placement="top" title=" Total Lead Required: '+data.jsonchart.ajax_livecampaign[1].total_lead+' And Acheived : '+data.jsonchart.ajax_livecampaign[1].total_lead_achieved+'">' + stepValue.toFixed(2).substr(2) + '<span>');
        });

        $("#ajax_livecampaign_draft").text(data.jsonchart.ajax_livecampaign[2].count);
    	$('.ajax_livecampaign_draft').circleProgress({
                value:data.jsonchart.ajax_livecampaign[2].total_lead_achieved/data.jsonchart.ajax_livecampaign[2].total_lead,
                size: 46,
                lineCap: 'round',
                fill: {gradient: ['#007bff', '#16aaff']}

        }).on('circle-animation-progress', function (event, progress, stepValue) {
            $(this).find('small').html('<span data-toggle="tooltip" data-placement="top" title=" Total Lead Required: '+data.jsonchart.ajax_livecampaign[2].total_lead+' And Acheived : '+data.jsonchart.ajax_livecampaign[2].total_lead_achieved+'">' + stepValue.toFixed(2).substr(2) + '<span>');
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
    catch
    {
        console.log('');
    }
}
function chart_3(data) {
	var options9 = {
    chart: {
        type: 'area',
        
        height: 50,
        sparkline: {
            enabled: true
        }
    },
    colors: ["#3ac47d"],
    stroke: {
        width: 2,
        curve: 'smooth',
    },
    series: [{
        data: data.jsonchart.ajax_totalleads.data
    }],
    labels: data.jsonchart.ajax_totalleads.labels,
    xaxis: {
        crosshairs: {
            width: 1
        },
    },
    tooltip: {
        fixed: {
            enabled: false
        },
        x: {
       
            show: false
        },
        x: {
            title: {
                formatter: function (seriesName) {
                    return '';
                }
            }
        },
        marker: {
            show: false
        },
 
    }
};
 var c= new ApexCharts(document.querySelector("#sparkline-chart9"), options9).render();
}

function chart_2(data)
{
	var optionsCommerce = {
    chart: {
        height: 274,
        type: 'bar',
        stacked: true,
        toolbar: {
            show: false,
        }
    },
    plotOptions: {
        bar: {
            horizontal: true,
        },

    },
    stroke: {
        width: 1,
        colors: ['#fff']
    },
    series: data.jsonchart.ajax_livecampaignapexdonut.d  ,
    xaxis: {
        categories: data.jsonchart.ajax_livecampaignapexdonut.c,
        labels: {
            formatter: function (val) {
                return val;
            }
        }
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return val;
            }
        }
    },
    fill: {
        opacity: 1

    },

    legend: {
        position: 'top',
        horizontalAlign: 'center',
    }
};

var chartCommerce = new ApexCharts(
    document.querySelector("#chart-leadstatus"),
    optionsCommerce
).render();
}


function chart_draw(data)
{
	var options777 = {
	    chart: {
	        height: 274,
	        type: 'line',
	        toolbar: {
	            show: true,
	        }
	    },
	    series: [
	    {
	        name: 'Lead Achieved',
	        type: 'column',
	        data: data.jsonchart.ajax_livecampaignapexgraph.target
	    },
	    {
	        name: 'Target Lead',
	        type: 'line',
	        data: data.jsonchart.ajax_livecampaignapexgraph.achieved
	    }],
	    stroke: {
	        width: [0, 4]
	    },
	    // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	    labels: data.jsonchart.ajax_livecampaignapexgraph.labels,
	    xaxis: {
	        type: 'text'
	    }

	};

	var chart777 = new ApexCharts(
	    document.querySelector("#chart-combined"),
	    options777
	).render();

}
 

function topagent(data) {
	var li = "";

    for (var i = 0; i< data.jsonchart.ajax_topAgentPerformance.length ; i++) {

    	 li = `<li class="list-group-item">
                        <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left mr-3">
                                    <img width="38" class="rounded-circle" src="` + site_url +data.jsonchart.ajax_topAgentPerformance[i].profile_url+`" alt="">
                                </div>
                                <div class="widget-content-left">
                                    <div class="widget-heading">` + data.jsonchart.ajax_topAgentPerformance[i].username+`</div>
                                    <div class="widget-subheading mt-1 opacity-10">
                                    
                                        <div class="badge badge-pill badge-primary">` + data.jsonchart.ajax_topAgentPerformance[i].designation+`</div>
                                    </div>
                                </div>
                                <div class="widget-content-right">
                                    <div class="fsize-2 text-success">
                                        <small data-toggle="tooltip" data-placement="top" title="Points" class="opacity-5 pr-1">`+data.jsonchart.ajax_topAgentPerformance[i].points+`/</small>
                                        <span data-toggle="tooltip" data-placement="top" title="Achieved">`+data.jsonchart.ajax_topAgentPerformance[i].achieved+`</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>`;
            $("#topagentlist").append(li);

        if (i == 0) {
        	$("#topagentshow").find('img').attr("src",site_url +data.jsonchart.ajax_topAgentPerformance[i].profile_url);
        	$("#topagentshow").find('.menu-header-title').text(data.jsonchart.ajax_topAgentPerformance[i].username);
        	$("#topagentshow").find('.menu-header-subtitle').text('Agent');
        }
    }
}

function cdqagent(data) {
	var li = "";

    for (var i = 0; i< data.jsonchart.ajax_topCDQAPerformance.length ; i++) {

    	 li = `<li class="list-group-item">
                        <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left mr-3">
                                    <img width="38" class="rounded-circle" src="` + site_url +data.jsonchart.ajax_topCDQAPerformance[i].profile_url+`" alt="">
                                </div>
                                <div class="widget-content-left">
                                    <div class="widget-heading">` + data.jsonchart.ajax_topCDQAPerformance[i].username+`</div>
                                    <div class="widget-subheading mt-1 opacity-10">
                                    
                                        <div class="badge badge-pill badge-primary">` + data.jsonchart.ajax_topCDQAPerformance[i].designation+`</div>
                                    </div>
                                </div>
                                <div class="widget-content-right">
                                    <div class="fsize-2 text-success">
                                        <small class="opacity-5 pr-1 text-info" data-toggle="tooltip" data-placement="top" title="New Prospect Addition">`+data.jsonchart.ajax_topCDQAPerformance[i].total+`/</small>
                                        <small class="opacity-5 pr-1" data-toggle="tooltip" data-placement="top" title="Total Uploaded To Campaign">`+data.jsonchart.ajax_topCDQAPerformance[i].total_lead_upload+`/</small>
                                        <span data-toggle="tooltip" data-placement="top" title="Qualified">`+data.jsonchart.ajax_topCDQAPerformance[i].total_lead_qualified+`</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>`;
            $("#topcdqlist").append(li);

        if (i == 0) {
        	$("#topcdqshow").find('img').attr("src",site_url +data.jsonchart.ajax_topCDQAPerformance[i].profile_url);
        	$("#topcdqshow").find('.menu-header-title').text(data.jsonchart.ajax_topCDQAPerformance[i].username);
        	$("#topcdqshow").find('.menu-header-subtitle').text('CDQA');
        }
    }
}


function qualityagent(data) {
	var li = "";

    for (var i = 0; i< data.jsonchart.ajax_topQualitytPerformance.length ; i++) {

    	 li = `<li class="list-group-item">
                        <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left mr-3">
                                    <img width="38" class="rounded-circle" src="` + site_url +data.jsonchart.ajax_topQualitytPerformance[i].profile_url+`" alt="">
                                </div>
                                <div class="widget-content-left">
                                    <div class="widget-heading">` + data.jsonchart.ajax_topQualitytPerformance[i].username+`</div>
                                    <div class="widget-subheading mt-1 opacity-10">
                                    
                                        <div class="badge badge-pill badge-primary">` + data.jsonchart.ajax_topQualitytPerformance[i].designation+`</div>
                                    </div>
                                </div>
                                <div class="widget-content-right">
                                    <div class="fsize-2 text-success">
                                        <span data-toggle="tooltip" data-placement="top" title="Total Audited">`+data.jsonchart.ajax_topQualitytPerformance[i].total+`</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>`;
            $("#topqualitylist").append(li);

        if (i == 0) {
        	$("#topqualityshow").find('img').attr("src",site_url +data.jsonchart.ajax_topQualitytPerformance[i].profile_url);
        	$("#topqualityshow").find('.menu-header-title').text(data.jsonchart.ajax_topQualitytPerformance[i].username);
        	$("#topqualityshow").find('.menu-header-subtitle').text('Quality');
        }
    }
}



var htmldatatable_id = "#edm_dataTable";
$(document).ready(function() {
	var action = [
					{ "class":"view primary","icon":"fa fa-edit icon-gradient bg-happy-fisher", "id":"view", "href":site_url + "campaign/edit/", "title":"Edit"},
          { "class":"view primary","icon":"fa fa-keyboard icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "ContentDiscovery/manual/",
           "title":"Manual Data"},
           { "class":"view primary","icon":"fa fa-upload icon-gradient bg-sunny-morning", "id":"view", "href": site_url + "ContentDiscovery/index/",
           "title":"Data Upload"},
					{ "class":"view primary","icon":"fa fa-phone icon-gradient bg-ripe-malin", "id":"view", "href":site_url +"agent/manual/", "title":"Mannual Dailer"},
          { "class":"view primary","icon":"fa fa-rocket icon-gradient bg-malibu-beach", "id":"view", "href": site_url + "quality/leads/",
           "title":"Quality"},
          { "class":"uploadrejection","icon":"fa fa-user  icon-gradient bg-mixed-hopes", "id":"view", "href": site_url + "sales/clientRejection/","title":"Upload Customer Rejection"}
           
				];
	var aocolumnDefs =  [
                   {    
                        "aTargets": [6],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                        	console.log(data);
                           if ( data == "0") {
                            return '<div class="badge badge-pill badge-warning text-center">Draft</div>';
                                    
                           }
                           else if ( data == "1") {
                           return '<div class="badge badge-pill badge-info text-center">Live</div>';
                           }
                           else if ( data == "2") {
                            return '<div class="badge badge-pill badge-success text-center">Completed</div>';
                           }
                        }
                    },
                    {    
                        "aTargets": [6],
                        //"mData": "first_name",
                        "mRender": function (data, type, full) {
                          var t = `<div class="widget-content p-0">
                                            <div class="widget-content-outer">
                                                <div class="widget-content-wrapper">
                                                    <div class="widget-content-left pr-2">
                                                        <div class="widget-numbers fsize-1 text-css">`+data+`%</div>
                                                    </div>
                                                    <div class="widget-content-right w-100">
                                                        <div class="progress-bar-xs progress">
                                                            <div class="progress-bar bg-css" role="progressbar" aria-valuenow="`+data+`" aria-valuemin="0" aria-valuemax="100" style="width: `+data+`%;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>`;
                           if ( parseInt(data) >= 0 && parseInt(data)  <= 25) {
                            return t.replace('css','danger');
                           }
                           else if ( parseInt(data)  > 25 && parseInt(data)  <= 50) {
                           return t.replace('css','warning');
                           }
                           else if ( parseInt(data)  > 50 && parseInt(data)  <= 75) {
                           return t.replace('css','info');
                           }
                           else if ( parseInt(data)  > 75 && parseInt(data)  <= 100) {
                           return t.replace('css','success');
                           }
                           else
                           {
                            return "Data Missing";
                           }
                        }
                    }

                ];
    enable_common_dataTable( 'campaign_ajax/campaign_manager_missing_eta/' ,htmldatatable_id,action,aocolumnDefs);
} );
