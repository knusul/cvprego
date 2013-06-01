App.CardController = Em.ObjectController.extend
  focus: ->
    @transitionToRoute('card-edit')
