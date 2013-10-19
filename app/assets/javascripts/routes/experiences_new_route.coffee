App.NewExperienceRoute = Ember.Route.extend
  model: ->
    @store.createRecord('experience')

  deactivate: ()->
    @controllerFor('new_experience').stopEditing()
