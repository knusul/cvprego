App.EducationsRoute = Ember.Route.extend
  model: ->
    App.Education.find()
