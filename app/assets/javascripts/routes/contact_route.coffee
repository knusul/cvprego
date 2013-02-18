App.ContactRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.startEditing()

# highlight this contact as active
    @controllerFor('contacts').set('activeContactId', model.get('id'));

  deactivate: ->
    controller = this.controllerFor('contact');

# reset editing state
    if (controller.get('isEditing'))
      controller.stopEditing()

# un-highlight the active contact (perhaps temporarily)
    @controllerFor('contacts').set('activeContactId', null)
