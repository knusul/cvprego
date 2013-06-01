App.SkillsEditRoute = Ember.Route.extend

  setupController: (controller)->
    controller.set 'model', App.Skill.find()
    controller.startEditing()

#  deactivate: ()->
#    @controllerFor('card-edit').stopEditing()
