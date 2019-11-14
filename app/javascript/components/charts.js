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
              borderColor: "rgba(21, 170, 191, 1)",
              backgroundColor: 'rgba(21, 170, 191, 0.25)',
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
            fontColor: 'black',
            fontFamily: 'roboto',
            beginAtZero: true
        },
          display: true,
          scaleLabel: {
            display: true,
            labelString: 'File Size (Bytes)'},
            gridLines: {
                display:false
            }
        }],
        yAxes: [{
          ticks: {
            fontColor: 'black',
            fontFamily: 'roboto'
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
              borderColor: "rgba(21, 170, 191, 1)",
              backgroundColor: 'rgba(21, 170, 191, 0.1)',
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
            beginAtZero: true,
            fontColor: 'black',
            fontFamily: 'roboto'
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
          precision:0,
          fontColor: 'black',
          fontFamily: 'roboto'
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
      Chart.defaults.global.defaultFontColor = 'black';
      Chart.defaults.global.defaultFontFamily = 'roboto';
      Chart.defaults.global.legend.position = "right";
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
                "rgba(84, 193, 208, 1)",
                "rgba(250, 146, 185, 1)",
                "rgba(174, 207, 223, 1)",
                "rgba(159, 159, 173, 1)",
                "rgba(252, 230, 145, 1)",
                "rgba(218, 158, 225, 1)",
                "rgba(125, 130, 184, 1)",
                "rgba(233, 244, 196, 1)"
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