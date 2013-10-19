App.NewEducationRoute = Ember.Route.extend
  model: ->
    @store.createRecord('education')

  deactivate: ()->
    @controllerFor('new_education').stopEditing()
