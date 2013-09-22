App.HobbiesEditRoute = Ember.Route.extend

  setupController: (controller)->
    controller.set 'model', App.Hobby.find()
