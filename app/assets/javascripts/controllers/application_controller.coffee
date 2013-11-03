App.ApplicationController = Em.ObjectController.extend
  needs: ['card']
  clickable: true

  actions:
    edit: ->
      @set('clickable', true)
      @transitionToRoute "index"

    ok: ->
      @set('clickable', false)
      @transitionToRoute "show", App.currentUser.email

    savePDF: ->
      window.open "/show?email=#{@get("controllers.card.model.email")}&format=pdf"

  href: (->
    "http://#{window.location.host}/#/#{@get('controllers.card.model.email')}"
  ).property()
