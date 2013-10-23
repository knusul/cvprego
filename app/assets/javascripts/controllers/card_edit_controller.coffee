App.CardEditController = Em.ObjectController.extend
  actions:
    save: ->
      card = @get('content')
      if card.validate()
        card.save().then ->
          card.get('contactTypes').invoke('save')
        @transitionToRoute('index')
      else
        messages = card.get('validationErrors.allMessages')
        $(".card-errors").html(messages.map (message) ->
          message.join(": ")
        .join("</br>"))

    cancel: ->
      @transitionToRoute('index')

    addContactType:  ->
      record = @get('content.contactTypes').createRecord()

    removeContactType: (contactType)->
      contactType.deleteRecord()
      contactType.save()

    submitPhotoUpload: (event) ->
      event.preventDefault()
      person = PersonApp.Person.createRecord({ username: 'heyo', attachment: this.get('controller').get('logo'), other: this.get('controller').get('other') });
      @get('controller.target').get('store').commit()
