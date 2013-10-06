App.LanguagesController = Em.ArrayController.extend
  needs: ['application']
  focus: ->
    @transitionToRoute('languages-edit')
