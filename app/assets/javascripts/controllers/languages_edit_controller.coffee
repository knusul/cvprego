App.LanguagesEditController = Em.ArrayController.extend
  needs: ['application']
  save: ->
    @transaction.commit()
    @transaction = null
    @transitionToRoute('index')

  startEditing:  ->
    @transaction = @get('store').transaction()
    @forEach (language) =>
      @transaction.add(language)

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  cancel: ->
    @stopEditing()
    @transitionToRoute('index')

  addLanguage:  ->
    @transaction.createRecord(App.Language, {name: ""})

  removeLanguage: (language)->
    language.deleteRecord()
