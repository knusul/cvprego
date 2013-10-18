App.CardEditRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('model', App.Card.find('singleton'))
    controller.startEditing()

#  deactivate: ()->
#    @controllerFor('card-edit').stopEditing()
