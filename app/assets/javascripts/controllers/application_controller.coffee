App.ApplicationController = Em.ObjectController.extend
  clickable: true

  actions:
    routeToShow: ->
      @set('clickable', false)
      @transitionToRoute "show", App.currentUser.email

    routeToStats: ->
      @set('clickable', false)
      @transitionToRoute "stats"

    savePDF: ->
      window.open "/show?email=#{@get("controllers.card.model.email")}&format=pdf"

