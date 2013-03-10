App.CardController = Em.ObjectController.extend
  focus: ->
    @transitionToRoute('card-edit')


App.CardEditController = Em.ObjectController.extend
  save: ->
    console.log "save"
  # commit and then clear the local transaction
    @transaction.commit()
    @transaction = null

  transitionAfterSave: (->
    console.log "aftersave"
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    if (@get('content.id'))
      @transitionToRoute('index')
  ).observes('content.id')

  startEditing:  ->
    # create a new record on a local transaction
    @transaction = @get('store').transaction()
    @set('content', App.Card.find(1))

  stopEditing:  ->
    # rollback the local transaction if it hasn't already been cleared
    if (@transaction)
      @transaction.rollback()
      @transaction = null
