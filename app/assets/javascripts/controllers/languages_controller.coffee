App.LanguagesController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  focus: ->
    @transitionToRoute('languages-edit')
