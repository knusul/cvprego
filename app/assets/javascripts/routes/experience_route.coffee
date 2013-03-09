App.ExperienceRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.startEditing()

# highlight this experience as active
    @controllerFor('experiences').set('activeExperienceId', model.get('id'))

  deactivate: ->
    controller = this.controllerFor('experience')

# reset editing state
    if (controller.get('isEditing'))
      controller.stopEditing()

# un-highlight the active experience (perhaps temporarily)
    @controllerFor('experiences').set('activeExperienceId', null)
