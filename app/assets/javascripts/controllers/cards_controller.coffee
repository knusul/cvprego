App.CardEditController = Em.ObjectController.extend
  save: ->
  # commit and then clear the local transaction
    @transaction.commit()
    @transaction = null
    @transitionToRoute('index')

  startEditing:  ->
    # create a new record on a local transaction
    card = @get('content')
    @transaction = card.get('store').transaction()
    @transaction.add(card)
    card.get('contactTypes').forEach (contactType) =>
      @transaction.add(contactType)
    @transaction

  stopEditing:  ->
    # rollback the local transaction if it hasn't already been cleared
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  cancel: ->
    @stopEditing()
    @transitionToRoute('index')

  addContactType:  ->
    @get('content.contactTypes').createRecord()

  removeContactType: (contactType)->
    contactType.deleteRecord()

