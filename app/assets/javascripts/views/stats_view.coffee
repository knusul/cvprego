App.StatsView = Ember.View.extend
  didInsertElement: ->
    visits = @get('controller.model')
    labels = visits.map (visit) ->
      visit.get('date').toLocaleDateString()
    counts = visits.map (visit) ->
      visit.get('count')
    data = {
      labels : labels,
      datasets : [
        {
          fillColor : "rgba(151,187,205,0.5)",
          strokeColor : "rgba(151,187,205,1)",
          pointColor : "rgba(151,187,205,1)",
          pointStrokeColor : "#fff",
          data : counts
        }
      ]
    }
    ctx = document.getElementById("myChart").getContext("2d")
    myNewChart = new Chart(ctx).Line(data,
      scaleOverride: true,
      scaleSteps: counts.length,
      scaleStepWidth: Math.ceil(Math.max.apply( Math, counts) / counts.length),
      scaleStartValue: 0
    )
