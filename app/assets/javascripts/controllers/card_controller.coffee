App.CardController = Em.ObjectController.extend
  focus: ->
    @transitionToRoute('card-edit')

App.ApplicationController = Ember.Controller.extend
  needs: ['currentUser']
