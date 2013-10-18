App.CardEditController = Em.ObjectController.extend
  save: ->
    card = @get('content')
    if card.validate()
      @transaction.commit()
      @transaction = null
      @transitionToRoute('index')
    else
      messages = card.get('validationErrors.allMessages')
      $(".card-errors").html(messages.map (message) ->
        message.join(": ")
      .join("</br>"))


  startEditing:  ->
    card = @get('content')
    card = App.Card.find('singleton')
    @transaction = card.get('store').transaction()
    @transaction.add(card)
    card.get('contactTypes').forEach (contactType) =>
      @transaction.add(contactType)

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  cancel: ->
    @stopEditing()
    @transitionToRoute('index')

  addContactType:  ->
    record = @get('content.contactTypes').createRecord()
    @transaction.add(record)

  removeContactType: (contactType)->
    contactType.deleteRecord()

  submitPhotoUpload: (event) ->
    event.preventDefault()
    person = PersonApp.Person.createRecord({ username: 'heyo', attachment: this.get('controller').get('logo'), other: this.get('controller').get('other') });
    @get('controller.target').get('store').commit()
