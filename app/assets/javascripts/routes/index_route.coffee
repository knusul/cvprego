App.IndexRoute = Ember.Route.extend
  renderTemplate: ->
    @render()
    @render "experiences",
      controller: 'experiences'
      outlet: 'experiences'

  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
