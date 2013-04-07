App.CardEditRoute = Ember.Route.extend
  model: ->
    App.Card.find()

  setupController: (controller)->
    console.log "Fo"
    controller.startEditing()

  deactivate: ()->
    @controllerFor('card-edit').stopEditing()
