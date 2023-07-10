
function columnwithdatalabels(element,arraydata,arraycategories,atitle,aname) {
	
	var options = {
	          series: [{
	          name: aname,
	          //data: [2.3, 3.1, 4.0, 10.1, 4.0, 3.6, 3.2, 2.3, 1.4, 0.8, 0.5, 0.2]
	          data:arraydata
	        }],
	          chart: {
	          height: 350,
	          type: 'bar',
	        },
	        plotOptions: {
	          bar: {
	            borderRadius: 10,
	            dataLabels: {
	              position: 'top', // top, center, bottom
	            },
	          }
	        },
	        dataLabels: {
	          enabled: true,
	          formatter: function (val) {
	            return val ;
	          },
	          offsetY: -20,
	          style: {
	            fontSize: '12px',
	            colors: ["#304758"]
	          }
	        },
	        
	        xaxis: {
	          //categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	          categories:arraycategories,
	          position: 'top',
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false
	          },
	          crosshairs: {
	            fill: {
	              type: 'gradient',
	              gradient: {
	                colorFrom: '#D8E3F0',
	                colorTo: '#BED1E6',
	                stops: [0, 100],
	                opacityFrom: 0.4,
	                opacityTo: 0.5,
	              }
	            }
	          },
	          tooltip: {
	            enabled: true,
	          }
	        },
	        yaxis: {
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false,
	          },
	          labels: {
	            show: false,
	            formatter: function (val) {
	              return val ;
	            }
	          }
	        
	        },
	        title: {
	          text: atitle,
	          floating: true,
	          offsetY: 330,
	          align: 'center',
	          style: {
	            color: '#444'
	          }
	        }
	        };

	        var chart = new ApexCharts(document.querySelector(element), options);
	        chart.render();
}


function pie(element,arraydata,arraycategories,atitle) {
	 var options = {
          series: arraydata,
          chart: {
          width: 350,
          type: 'pie',
        },
        title: {
          text: atitle,
          floating: true,
          offsetY: 330,
          align: 'center',
          style: {
            color: '#444'
          }
        },
        labels: arraycategories,
        responsive: [{
          breakpoint: 480,
          options: {
            chart: {
              width: 200
            },
            legend: {
              position: 'bottom'
            }
          }
        }]
        };

        var chart = new ApexCharts(document.querySelector(element), options);
        chart.render();
}