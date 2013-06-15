App.EducationRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'model', model
    controller.startEditing()
    @controllerFor('educations').set('activeEducationId', model.get('id'))

  deactivate: ->
    controller = this.controllerFor('education')

    if (controller.get('isEditing'))
      controller.stopEditing()

    @controllerFor('educations').set('activeEducationId', null)
