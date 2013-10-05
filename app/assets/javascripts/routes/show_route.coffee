App.ShowRoute = App.ApplicationRoute.extend
  setupController: ->
    for controller in ['experiences', 'educations', 'card', 'skills', 'languages', 'hobbies']
      @controllerFor(controller).set 'clickable', false
