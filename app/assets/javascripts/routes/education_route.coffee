App.EducationRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'model', model
