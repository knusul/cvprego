App.IndexRoute = Ember.Route.extend
  model: ->
    if App.currentUser
      return Em.RSVP.hash(
        card: @store.find('card', 'singleton')
        experiences: @store.all('experience')
        educations: @store.all('education')
        skills: @store.all('skill')
        languages: @store.all('language')
        hobbies: @store.all('hobby')
      ).then (hash) ->
        return Em.RSVP.hash(hash)

  setupController: (controller, model)->
    if App.currentUser
      @controllerFor('card').set 'model', model.card
      @controllerFor('experiences').set 'model', model.experiences
      @controllerFor('educations').set 'model', model.educations
      @controllerFor('skills').set 'model', model.skills
      @controllerFor('languages').set 'model', model.languages
      @controllerFor('hobbies').set 'model', model.hobbies

      @controllerFor('application').set 'clickable', true
      @controllerFor('card').set 'clickable', true
