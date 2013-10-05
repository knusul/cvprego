App.ApplicationController = Em.ObjectController.extend
  ok: ->
    @transitionToRoute "show", App.Card.find().get('email')
