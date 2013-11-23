App.ShowController = Em.ObjectController.extend
  needs: ['application', 'card']

  actions:
    edit: ->
      @set('controllers.application.clickable', true)
      @transitionToRoute "index"

    savePDF: ->
      @get('controllers.application').send('savePDF')

  href: (->
    "http://#{window.location.host}/#/#{@get('controllers.card.model.email')}"
  ).property()
