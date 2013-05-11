App.CardEditRoute = Ember.Route.extend
  model: ->
    App.Card.find(1)

  setupController: (controller)->
    controller.startEditing()

#  deactivate: ()->
#    @controllerFor('card-edit').stopEditing()
