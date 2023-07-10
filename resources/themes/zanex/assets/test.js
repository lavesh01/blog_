 $(document).ready(function() {
    $('form').jsonForm({
      schema: {
        options
      },
      onSubmit: function (errors, values) {
        if (errors) {
          $('#res').html('<p>I beg your pardon?</p>');
        } else {
          $('#res').html('<p>Hello ' + values.name + '.' +
            (values.age ? '<br/>You are ' + values.age + '.' : '') +
            '</p>');
        }
      }
    });
 });

 var options = {
    chart: {
      height: 320,
      type: "line",
      stacked: false,
      toolbar: {
        show: true,
        tools: {
          download: true,
          selection: false,
          zoom: false,
          zoomin: true,
          zoomout: true,
          pan: false,
          reset: true | '<img src="/static/icons/reset.png" width="20">'
          },
      },
      dropShadow: {
        enabled: true,
        opacity: 0.1,
      },
    },
    colors: [myVarVal, "#f99433", 'rgba(119, 119, 142, 0.05)'],
    dataLabels: {
      enabled: false
    },
    stroke: {
      curve: "smooth",
      width: [3, 3, 0],
      dashArray: [0, 4],
      lineCap: "round"
    },
    grid: {
      padding: {
        left: 0,
        right: 0
      },
      strokeDashArray: 3
    },
    markers: {
      size: 0,
      hover: {
        size: 0
      }
    },
    series: [{
      name: "Total Orders",
      type: 'line',
      data: [0, 45, 30, 75, 15, 94, 40, 115, 30, 105, 65, 110]
      
    },{
      name: "Total Sales",
      type: 'line',
      data: [0, 60, 20, 130, 75, 130, 75, 140, 64, 130, 85, 120]
    }, {
      name: "",
      type: 'area',
      data: [0, 105, 70, 175, 85, 154, 90, 185, 120, 145, 185, 130]
    }],
    xaxis: {
      type: "month",
      categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      axisBorder: {
        show: false,
        color: 'rgba(119, 119, 142, 0.08)',
      },
      labels: {
        style: {
          color: '#8492a6',
          fontSize: '12px',
        },
      },
    },
    yaxis: {
      labels: {
        style: {
          color: '#8492a6',
          fontSize: '12px',
        },
      },
      axisBorder: {
        show: false,
        color: 'rgba(119, 119, 142, 0.08)',
      },
    },
    fill: {
      gradient: {
        inverseColors: false,
        shade: 'light',
        type: "vertical",
        opacityFrom: 0.85,
        opacityTo: 0.55,
        stops: [0, 100, 100, 100]
      }
      },
    tooltip: {
      show:false
    },
    legend: {
      position: "top",
      show:true
    }
  }