App.NewExperienceController = Em.ObjectController.extend
  startEditing:  ->
    console.log "SE"
    @transaction = @get('store').transaction()
    @set('content', @transaction.createRecord(App.Experience, {}))

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  save: ->
    console.log "tr"
    @transaction.commit()
    @transaction = null
    @transitionToRoute('index')

  cancel:  ->
    @stopEditing()
    @transitionToRoute('index')
