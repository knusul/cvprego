App.CardController = Em.ObjectController.extend
  needs: ['application']
  clickable: true
  focus: ->
    @transitionToRoute('card-edit')
