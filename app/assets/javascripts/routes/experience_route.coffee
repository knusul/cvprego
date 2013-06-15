App.ExperienceRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'model', model
    controller.startEditing()

    @controllerFor('experiences').set('activeExperienceId', model.get('id'))

  deactivate: ->
    controller = this.controllerFor('experience')

    if (controller.get('isEditing'))
      controller.stopEditing()

    @controllerFor('experiences').set('activeExperienceId', null)
