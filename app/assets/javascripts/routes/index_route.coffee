App.IndexRoute = Ember.Route.extend
  renderTemplate: ->
    @render "details",
      controller: 'details'
      outlet: 'details'

    @render "experiences",
      controller: 'experiences'
      outlet: 'experiences'

  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
