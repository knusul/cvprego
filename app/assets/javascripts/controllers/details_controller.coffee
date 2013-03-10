App.DetailsController = Em.ObjectController.extend
  focus: ->
    @transitionToRoute('details-edit')


App.DetailsEditController = Em.ObjectController.extend
  save: ->
  # commit and then clear the local transaction
    @transaction.commit()
    @transaction = null
    console.log "save"

  transitionAfterSave: (->
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    if (@get('content.id'))
      @transitionToRoute('index')
  ).observes('content.id')

  startEditing:  ->
    # create a new record on a local transaction
    @transaction = @get('store').transaction()
    @set('content', @transaction.add(App.Details.find(1)))

  stopEditing:  ->
    # rollback the local transaction if it hasn't already been cleared
    if (@transaction)
      @transaction.rollback()
      @transaction = null
