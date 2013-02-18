App.ContactsRoute = Ember.Route.extend
  model: ->
    App.Contact.find()
