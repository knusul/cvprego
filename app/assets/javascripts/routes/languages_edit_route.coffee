App.LanguagesEditRoute = Ember.Route.extend

  setupController: (controller)->
    controller.set 'model', App.Language.find()
    controller.startEditing()

#  deactivate: ()->
#    @controllerFor('card-edit').stopEditing()
