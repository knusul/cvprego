App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
    @controllerFor('educations').set 'model', App.Education.find()
    @controllerFor('card').set 'model', App.Card.find(App.currentUser.card_id)
    @controllerFor('skills').set 'model', App.Skill.find()
