App.CardEditRoute = Ember.Route.extend
  model: ->
    App.Card.find(App.currentUser.card_id)

  setupController: (controller)->
    controller.startEditing()

#  deactivate: ()->
#    @controllerFor('card-edit').stopEditing()
