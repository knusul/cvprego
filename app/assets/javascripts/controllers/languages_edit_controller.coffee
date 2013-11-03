App.LanguagesEditController = Em.ArrayController.extend
  needs: ['application']

  stopEditing:  ->
    @transitionToRoute('index')

  cancel: ->
    @stopEditing()

  actions:
    save: ->
      $(".modal.in").modal('hide')

    removeLanguage: (language)->
      language.deleteRecord()
      language.save()

  addLanguage:  ->
    @get('store').createRecord('language', {name: ""})
