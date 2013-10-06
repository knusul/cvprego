App.CardController = Em.ObjectController.extend
  needs: ['application']
  focus: ->
    @transitionToRoute('card-edit')
