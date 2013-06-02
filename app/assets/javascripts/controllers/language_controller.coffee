App.LanguagesController = Em.ArrayController.extend
  focus: ->
    @transitionToRoute('languages-edit')
