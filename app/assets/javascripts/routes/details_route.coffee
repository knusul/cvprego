App.DetailsRoute = Ember.Route.extend
  setupController: (controller) ->
    console.log "setup details"
    super

App.DetailsEditRoute = Ember.Route.extend
  model: ->
# Because we are maintaining a transaction locally in the controller for editing,
# the new record needs to be created in the controller.
    null

  setupController: (controller)->
    controller.startEditing()

  deactivate: ()->
    @controllerFor('details-edit').stopEditing()
