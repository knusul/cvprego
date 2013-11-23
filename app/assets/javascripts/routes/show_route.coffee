App.ShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find('card', "singleton?email=#{params.email}").then (card)=>
      params.email
    , =>
      @transitionTo "404", params.email

  setupController: (controller, email) ->
    card = @store.find('card', "singleton?email=#{email}")
    controller.set 'model', card
    @controllerFor('application').set 'clickable', false
    @controllerFor('card').set 'model', card
    @controllerFor('experiences').set 'model', @store.find('experience',
      email: email
    )
    @controllerFor('experiences').set 'model', @store.find('experience',
      email: email
    )
    @controllerFor('educations').set 'model', @store.find('education',
      email: email
    )
    @controllerFor('skills').set 'model', @store.find('skill',
      email: email
    )
    @controllerFor('languages').set 'model', @store.find('language',
      email: email
    )
    @controllerFor('hobbies').set 'model', @store.find('hobby',
      email: email
    )
    @controllerFor('card').set 'clickable', false
