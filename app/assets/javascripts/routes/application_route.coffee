App.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render "card",
      controller: 'card'

    @render "experiences",
      controller: 'experiences'

  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
    @controllerFor('card').set 'model', App.Card.find(1)
