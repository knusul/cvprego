App.IndexRoute = Ember.Route.extend

  setupController: ->
    if App.currentUser
      @controllerFor('card').set 'model', @store.find('card', 'singleton')
      @controllerFor('experiences').set 'model', @store.find('experience')
      @controllerFor('educations').set 'model', @store.find('education')
      @controllerFor('skills').set 'model', @store.find('skill')
      @controllerFor('languages').set 'model', @store.find('language')
      @controllerFor('hobbies').set 'model', @store.find('hobby')

    @controllerFor('application').set 'clickable', true
