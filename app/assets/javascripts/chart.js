$(function () {
  var chart;
  $(document).ready(function() {

    // Radialize the colors
    Highcharts.getOptions().colors = $.map(Highcharts.getOptions().colors, function(color) {
      return {
        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
        stops: [
          [0, color],
          [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
        ]
      };
    });
			
    // Build the chart
    chart = new Highcharts.Chart({
      credits: {enabled: false},
      chart: {
        renderTo: 'container',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
      },
      title: {
        text: 'Distribucion Etarea'
      },
      tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage}%</b>',
        percentageDecimals: 1
      },
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            color: '#000000',
            connectorColor: '#00FF00',
            formatter: function() {
              return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
            }
          }
        }
      },
      series: [{
        type: 'pie',
        name: 'Distribucion',
        data: [
          ['18 - 24',   45.0],
          ['24 - 40',       26.8],
          {
            name: '40 - 60',
            y: 12.8,
            sliced: true,
            selected: true
          },
          ['60 - 70',    8.5],
          ['70 - 80',     6.2],
          ['Mas de 80',   0.7]
        ]
      }]
    });
  });
});
		
