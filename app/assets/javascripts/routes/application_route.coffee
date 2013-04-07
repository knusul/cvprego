App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
    @controllerFor('card').set 'model', App.Card.find(1)
