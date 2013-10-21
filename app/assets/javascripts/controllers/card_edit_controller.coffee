App.CardEditController = Em.ObjectController.extend
  contactTypes: []
  save: ->
    card = @get('content')
    if card.validate()
      card.save()
      @contactTypes.invoke('save')
      @transitionToRoute('index')
    else
      messages = card.get('validationErrors.allMessages')
      $(".card-errors").html(messages.map (message) ->
        message.join(": ")
      .join("</br>"))

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  cancel: ->
    @stopEditing()
    @transitionToRoute('index')

  addContactType:  ->
    record = @get('content.contactTypes').createRecord()
    @contactTypes.addObject(record)

  removeContactType: (contactType)->
    contactType.deleteRecord()

  submitPhotoUpload: (event) ->
    event.preventDefault()
    person = PersonApp.Person.createRecord({ username: 'heyo', attachment: this.get('controller').get('logo'), other: this.get('controller').get('other') });
    @get('controller.target').get('store').commit()
