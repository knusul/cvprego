App.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render "details",
      controller: 'details'

    @render "experiences",
      controller: 'experiences'

  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
    @controllerFor('details').set 'model', App.Details.createRecord()
