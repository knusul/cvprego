App.StatsView = Ember.View.extend
  didInsertElement: ->
    data = {
      labels : ["January","February","March","April","May","June","July"],
      datasets : [
        {
          fillColor : "rgba(151,187,205,0.5)",
          strokeColor : "rgba(151,187,205,1)",
          pointColor : "rgba(151,187,205,1)",
          pointStrokeColor : "#fff",
          data : [28,48,40,19,96,27,100]
        }
      ]
    }
    ctx = document.getElementById("myChart").getContext("2d")
    myNewChart = new Chart(ctx).Line(data)
