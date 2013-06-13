App.CardEditRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('model', App.Card.find(App.currentUser.card_id))
    controller.startEditing()

#  deactivate: ()->
#    @controllerFor('card-edit').stopEditing()
