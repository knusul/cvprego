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
      window.open "http://localhost:3000/show?email=#{@get("controllers.card.model.email")}&format=pdf"

  href: (->
    window.location.href
  ).property()
