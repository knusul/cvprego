App.StatsRoute = Ember.Route.extend
  model:->
    @store.find("visit")

