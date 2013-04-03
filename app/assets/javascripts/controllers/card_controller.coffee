App.CardController = Em.ObjectController.extend
  focus: ->
    console.log "focus"
    @transitionToRoute('card-edit')

App.ApplicationController = Ember.Controller.extend
  needs: ['currentUser']
