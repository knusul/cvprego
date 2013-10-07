App.ApplicationRoute = Ember.Route.extend

  setupController: ->
    @controllerFor('experiences').set 'model', App.Experience.find()
    @controllerFor('educations').set 'model', App.Education.find()
    @controllerFor('card').set 'model', App.Card.find('singleton')
    @controllerFor('skills').set 'model', App.Skill.find()
    @controllerFor('languages').set 'model', App.Language.find()
    @controllerFor('hobbies').set 'model', App.Hobby.find()

    @controllerFor('application').set 'clickable', true
