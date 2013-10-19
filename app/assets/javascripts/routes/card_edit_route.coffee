App.CardEditRoute = Ember.Route.extend
  model: ->
    @store.find('card', 'singleton')
