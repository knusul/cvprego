App.ExperienceRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'model', model

  deactivate: ->
    controller = this.controllerFor('experience')
