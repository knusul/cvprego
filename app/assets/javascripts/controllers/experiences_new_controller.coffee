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
    @transitionToRoute('index')

  cancel:  ->
    @stopEditing()
    @transitionToRoute('index')
