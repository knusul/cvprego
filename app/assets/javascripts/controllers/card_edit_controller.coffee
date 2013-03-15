App.CardEditController = Em.ObjectController.extend
  save: ->
    @transaction.commit()
    @transaction = null
    @transitionToRoute('index')

  startEditing:  ->
    card = @get('content')
    @transaction = card.get('store').transaction()
    @transaction.add(card)
    card.get('contactTypes').forEach (contactType) =>
      @transaction.add(contactType)

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null
    @transitionToRoute('index')

  cancel: ->
    @stopEditing()

  addContactType:  ->
    @get('content.contactTypes').createRecord()

  removeContactType: (contactType)->
    contactType.deleteRecord()

