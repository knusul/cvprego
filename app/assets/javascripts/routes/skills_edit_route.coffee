App.SkillsEditRoute = Ember.Route.extend
  model: ->
    @store.find('skill')
