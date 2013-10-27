App.CardEditController = Em.ObjectController.extend
  actions:
    save: ->
      card = @get('model')
      if card.validate()
        console.log card.get('contactTypes')
        card.save()
        @transitionTo('index')
      else
        messages = card.get('validationErrors.allMessages')
        $(".card-errors").html(messages.map (message) ->
          message.join(": ")
        .join("</br>"))

    cancel: ->
      @transitionToRoute('index')

    addContactType:  ->
      record = @get('model')
      record.get('contactTypes').pushObject @get('store').createRecord('contactType')

    removeContactType: (contactType)->
      console.log @get('model.contactTypes').toArray()
      contactType.deleteRecord()
      contactType.save()

    submitPhotoUpload: (event) ->
      event.preventDefault()
      person = PersonApp.Person.createRecord({ username: 'heyo', attachment: this.get('controller').get('logo'), other: this.get('controller').get('other') });
      @get('controller.target').get('store').commit()
