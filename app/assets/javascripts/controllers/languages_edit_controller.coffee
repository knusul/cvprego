App.LanguagesEditController = Em.ArrayController.extend
  needs: ['application']

  stopEditing:  ->
    @transitionToRoute('index')

  cancel: ->
    @stopEditing()

  actions:
    save: ->
      @get('content').save()
      @stopEditing()

    addLanguage:  ->
      @get('store').createRecord('language', {name: ""})

    removeLanguage: (language)->
      language.deleteRecord()
      language.save()
