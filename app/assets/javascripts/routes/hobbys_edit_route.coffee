App.HobbiesEditRoute = Ember.Route.extend
  model: ->
    @get('store').find('hobby')
