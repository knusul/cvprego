App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
    @controllerFor('educationss').set 'model', App.Educations.find()
    @controllerFor('card').set 'model', App.Card.find(App.currentUser.card_id)
