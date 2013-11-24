App.ShowController = Em.ObjectController.extend
  needs: ['application', 'card']

  actions:
    edit: ->
      @set('controllers.application.clickable', true)
      @transitionToRoute "index"

    savePDF: ->
      window.open "/show?email=#{@get("controllers.card.model.email")}&format=pdf"

  href: (->
    "http://#{window.location.host}/#/#{@get('controllers.card.model.email')}"
  ).property()
