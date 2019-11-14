import "chart.js";


const charts = () => {
  if (window.location.pathname == '/dashboard') {
/////////////////////////////////////////////////////////////////////////////
    // Number of Rows Chart
    const rowsChartCanvas = document.getElementById('RowsChart');
    const fileSizes = JSON.parse(rowsChartCanvas.dataset.fileSizes);
    const fileName = JSON.parse(rowsChartCanvas.dataset.titles);

    var rowChartData = {
      labels: fileName,
          datasets: [
              {
                  fillColor: "#15aabf",
                  strokeColor: "#15aabf",
                  data: fileSizes
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
            labelString: 'File Size'},
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
    var rowsChart = document.getElementById("RowsChart");
    if (rowsChart) {
      var myRowChart = new Chart(rowsChart, {
        type: 'horizontalBar',
        data: rowChartData,
        options: opt
    });

    }

    ///////////////////////////////////////////////////////////////////////////////
    // Uploads Over Time
      const rowsUploadCanvas = document.getElementById('UploadsChart');
      const loadingTime = JSON.parse(rowsUploadCanvas.dataset.fileLoadedTime);
      const fileCountPerDay = loadingTime.map((key) => Object.keys(key)[0]);
      const dayPerFile = loadingTime.map((key) => Object.values(key)[0]);
      // const fileLoad = JSON.parse(rowsUploadCanvas.dataset.fileLoadedCount);
    var uploadsData = {
      labels: fileCountPerDay,
          datasets: [
              {
                  fillColor: "#15aabf",
                  strokeColor: "#15aabf",
                  data: dayPerFile
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
    var uploadsChart = document.getElementById("UploadsChart")
    if (uploadsChart) {
        var myLineChart = new Chart(uploadsChart, {
          type: 'line',
          data: uploadsData,
          options: opt1
        });
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Algorithms Used

      const rowsAlgoChart = document.getElementById('AlgoChart');
      const algorithm = JSON.parse(rowsAlgoChart.dataset.algorithmName);
      const algorithmLabels = algorithm.map(key => Object.keys(key)[0]);
      const algorithmCount = algorithm.map(key => Object.values(key)[0])
    var ctx2 = document.getElementById("AlgoChart")
    if (ctx2) {
        ctx2 = ctx2.getContext('2d');
        var algoChart = new Chart(ctx2, {
          type: 'pie',
          data: {
              labels: algorithmLabels,
            datasets: [{
            backgroundColor: [ /* backgroundColor is mandatory */
                "#2ecc71",
                "#3498db",
                "#95a5a6",
                "#9b59b6",
                "#f1c40f",
                "#e74c3c",
                "#34495e"
            ],
                data: algorithmCount
        }]
          }
        });
    }
  }
}
   ////////////////////////////////////////////////////////////////////
export { charts };
