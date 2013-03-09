App.ExperiencesRoute = Ember.Route.extend
  model: ->
    App.Experience.find()
