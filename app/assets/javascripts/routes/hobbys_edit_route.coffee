App.HobbysEditRoute = Ember.Route.extend

  setupController: (controller)->
    controller.set 'model', App.Hobby.find()
