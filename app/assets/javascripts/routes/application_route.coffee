App.ApplicationRoute = Ember.Route.extend
  model: ->
    if App.currentUser
      return Em.RSVP.hash(
        card: @store.find('card', 'singleton')
        experiences: @store.find('experience')
        educations: @store.find('education')
        skills: @store.find('skill')
        languages: @store.find('language')
        hobbies: @store.find('hobby')
      ).then (hash) ->
        return Em.RSVP.hash(hash)
