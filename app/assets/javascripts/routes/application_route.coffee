App.ApplicationRoute = Ember.Route.extend
  editable: true

  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
    @controllerFor('educations').set 'model', App.Education.find()
    @controllerFor('card').set 'model', App.Card.find()
    @controllerFor('skills').set 'model', App.Skill.find()
    @controllerFor('languages').set 'model', App.Language.find()
    @controllerFor('hobbies').set 'model', App.Hobby.find()

    for controller in ['experiences', 'educations', 'card', 'skills', 'languages', 'hobbies']
      @controllerFor(controller).set 'clickable', true
