App.ShowRoute = App.ApplicationRoute.extend
  model: (params) ->
    params.email
  setupController: (controller, email) ->
    @controllerFor('experiences').set 'model', App.Experience.find
      email: email
    @controllerFor('educations').set 'model', App.Education.find
      email: email
    @controllerFor('card').set 'model', App.Card.find("singleton?email=#{email}")
    @controllerFor('skills').set 'model', App.Skill.find
      email: email
    @controllerFor('languages').set 'model', App.Language.find
      email: email
    @controllerFor('hobbies').set 'model', App.Hobby.find
      email: email
    @controllerFor('application').set 'clickable', false
