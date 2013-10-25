App.ShowRoute = Ember.Route.extend
  model: (params) ->
    params.email

  setupController: (controller, email) ->
    @controllerFor('application').set 'clickable', false 
    @controllerFor('card').set 'model', @store.find('card', "singleton?email=#{email}")
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
