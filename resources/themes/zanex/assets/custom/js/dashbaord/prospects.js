
window.Apex = {
    dataLabels: {
        enabled: false
    },
    stroke: {
        width: 2
    },
};

$(document).ready(function() {

    var options777 = {
        chart: {
            height: 274,
            type: 'bar',
            toolbar: {
                show: true,
            }
        },
        series: [
        {
            name: 'Count',
            type: 'column',
            data:  month_p_count['count']
        }],
        stroke: {
            width: [0, 1]
        },
        // labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        labels: month_p_count['date'],
        xaxis: {
            type: 'text'
        }

    };


 var c = new ApexCharts(document.querySelector("#dashboard-sparkline-3"), options777).render();

});