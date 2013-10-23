App.LanguagesEditRoute = Ember.Route.extend
  model: ->
    @get('store').find('language')
