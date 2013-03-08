App.ContactsNewController = Em.ObjectController.extend
  startEditing:  ->
    # create a new record on a local transaction
    @transaction = @get('store').transaction()
    @set('content', @transaction.createRecord(App.Contact, {}))

  stopEditing:  ->
    # rollback the local transaction if it hasn't already been cleared
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  save: ->
    # commit and then clear the local transaction
    @transaction.commit()
    @transaction = null

  transitionAfterSave: (->
    # when creating new records, it's necessary to wait for the record to be assigned
    # an id before we can transition to its route (which depends on its id)
    if (@get('content.id'))
      @transitionToRoute('contacts')
  ).observes('content.id')

  cancel:  ->
    @stopEditing()
    @transitionToRoute('contacts.index')

  addPhoneNumber:  ->
    @get('content.phoneNumbers').createRecord()

  removePhoneNumber: (phoneNumber)->
    phoneNumber.deleteRecord()
