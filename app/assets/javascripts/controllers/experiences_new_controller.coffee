App.NewExperienceController = Em.ObjectController.extend
  startEditing:  ->
    @transaction = @get('store').transaction()
    @set('content', @transaction.createRecord(App.Experience, {}))

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  save: ->
    @transaction.commit()
    @transaction = null

  transitionAfterSave: (->
    if (@get('content.id'))
      @transitionToRoute('index')
  ).observes('content.id')

  cancel:  ->
    @stopEditing()
    @transitionToRoute('index')
