import "chart.js";

/////////////////////////////////////////////////////////////////////////////
// Number of Rows Chart

var rowChartData = {
  labels: ["File 1", "File 2", "File 3", "File 4", "File 5", "File 6"],
      datasets: [
          {
              fillColor: "#15aabf",
              strokeColor: "#15aabf",
              data: [60, 80, 81, 56, 55, 40]
          }
      ]
  };

var opt = {
  events: true,
  legend: false,
  scales: {
    xAxes: [{
      ticks: {           
        beginAtZero: true
    },
      display: true,
      scaleLabel: {
        display: true,
        labelString: 'Number of Rows'},
        gridLines: {
            display:false
        }
    }],
    yAxes: [{
        gridLines: {
            display:false
        }   
    }]
},
  tooltips: {
      enabled: true
  },
  hover: {
      animationDuration: 1
  },
  animation: {
      duration: 1,
      onComplete: function () {
          var chartInstance = this.chart,
              ctx = chartInstance.ctx;
          ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
          ctx.textAlign = 'center';
          // ctx.textBaseline = 'bottom';

          this.data.datasets.forEach(function (dataset, i) {
              var meta = chartInstance.controller.getDatasetMeta(i);
              meta.data.forEach(function (bar, index) {
                  var data = dataset.data[index];                            
                  ctx.fillText(data, bar._model.x, bar._model.y);
              });
          });
      }
  }
};
var rowsChart = document.getElementById("RowsChart"),
   myRowChart = new Chart(rowsChart, {
      type: 'horizontalBar',
      data: rowChartData,
      options: opt
   });

   export { rowsChart };

///////////////////////////////////////////////////////////////////////////////
// Uploads Over Time

var uploadsData = {
  labels: ["06/11/2019", "07/11/2019", "08/11/2019", "09/11/2019", "10/11/2019", "11/11/2019"],
      datasets: [
          {
              fillColor: "#15aabf",
              strokeColor: "#15aabf",
              data: [2, 3, 3, 3, 4, 2]
          }
      ]
  };

var opt1 = {
  events: true,
  legend: false,
  scales: {
    xAxes: [{
      ticks: {           
        beginAtZero: true
    },
      display: true,
      scaleLabel: {
        display: true,
        labelString: 'Uploads Over Time'},
        gridLines: {
            display:false
        }
    }],
    yAxes: [{
      ticks: {
      precision:0
      },
        gridLines: {
            display:false
        }   
    }]
},
  tooltips: {
      enabled: true
  },
  hover: {
      animationDuration: 1
  },
  animation: {
      duration: 1,
      onComplete: function () {
          var chartInstance1 = this.chart,
              ctx1 = chartInstance1.ctx;
          ctx1.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
          ctx1.textAlign = 'center';
          // ctx1.textBaseline = 'bottom';

          this.data.datasets.forEach(function (dataset, i) {
              var meta = chartInstance1.controller.getDatasetMeta(i);
              meta.data.forEach(function (bar, index) {
                  var data = dataset.data[index];                            
                  ctx1.fillText(data, bar._model.x, bar._model.y);
              });
          });
      }
  }
};
var uploadsChart = document.getElementById("UploadsChart"),
   myLineChart = new Chart(uploadsChart, {
      type: 'line',
      data: uploadsData,
      options: opt1
   });

   export { uploadsChart };

////////////////////////////////////////////////////////////////////////////////////////////////
// Algorithms Used

var ctx2 = document.getElementById("AlgoChart").getContext('2d');
var algoChart = new Chart(ctx2, {
  type: 'pie',
  data: {
    labels: ["Green", "Blue", "Gray", "Purple", "Yellow", "Red", "Black"],
    datasets: [{
    backgroundColor: [ /* backgroundColor is optional */
        "#2ecc71",
        "#3498db",
        "#95a5a6",
        "#9b59b6",
        "#f1c40f",
        "#e74c3c",
        "#34495e"
    ], 
    data: [12, 19, 3, 17, 28, 24, 7]
}]
  }
});

   export { algoChart };

   ////////////////////////////////////////////////////////////////////



