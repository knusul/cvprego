App.CardRoute = Ember.Route.extend
  setupController: (controller) ->
    super

App.CardEditRoute = Ember.Route.extend
  model: ->
# Because we are maintaining a transaction locally in the controller for editing,
# the new record needs to be created in the controller.
    null

  setupController: (controller)->
    controller.startEditing()

  deactivate: ()->
    @controllerFor('card-edit').stopEditing()
