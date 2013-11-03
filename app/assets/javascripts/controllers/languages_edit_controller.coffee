App.LanguagesEditController = Em.ArrayController.extend
  needs: ['application']

  stopEditing:  ->
    @transitionToRoute('index')

  cancel: (language) ->
    $(".modal.in").modal('hide')

  actions:
    save: ->
      @get('model').invoke('save')
      $(".modal.in").modal('hide')

    removeLanguage: (language)->
      language.deleteRecord()
      language.save()

  addLanguage:  ->
     @get('store').createRecord('language', {name: ""})
