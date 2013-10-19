App.ExperiencesRoute = Ember.Route.extend
  model: ->
    @store.find('experience')
