App.ApplicationController = Em.ObjectController.extend
  clickable: true

  actions:
    edit: ->
      @set('clickable', true)
      @transitionToRoute "index"

    ok: ->
      @set('clickable', false)
      @transitionToRoute "show", App.currentUser.email

  actions:
    savePDF: ->
      window.open "http://localhost:3000/show?email=knusul@gmail.com&format=pdf"

  href: (->
    window.location.href
  ).property()
