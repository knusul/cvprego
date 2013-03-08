App.ContactController = Em.ObjectController.extend
  needs: ['contact']

  startEditing:  ->
    contact = @get('content')
    transaction = contact.get('store').transaction()
    transaction.add(contact)
    contact.get('phoneNumbers').forEach (phoneNumber)->
      transaction.add(phoneNumber)
    @transaction = transaction

  stopEditing: ->
    console.log "stop"
    transaction = @transaction
    if (transaction)
      transaction.rollback()
      @transaction = undefined
    @transitionToRoute('contacts')

  save:  ->
    @transaction.commit()
    @transaction = undefined
    @stopEditing()

  cancel:  ->
    @stopEditing()

  addPhoneNumber:  ->
    @get('content.phoneNumbers').createRecord()

  removePhoneNumber: (phoneNumber)->
    phoneNumber.deleteRecord()

  destroyRecord:  ->
    if (window.confirm("Are you sure you want to delete @contact?"))
      @get('content').deleteRecord()
      @get('store').commit()
      @get('target.router').transitionTo('contacts.index')
