App.CardEditController = Em.ObjectController.extend
  actions:
    save: ->
      @addContactType()
      card = @get('model')
      if card.validate()
        card.save()
        @transitionToRoute('index')
      else
        messages = card.get('validationErrors.allMessages')
        $(".card-errors").html(messages.map (message) ->
          message.join(": ")
        .join("</br>"))

    cancel: ->
      @transitionToRoute('index')

    submitPhotoUpload: (event) ->
      event.preventDefault()
      person = PersonApp.Person.createRecord({ username: 'heyo', attachment: this.get('controller').get('logo'), other: this.get('controller').get('other') })
      @get('controller.target').get('store').commit()

  addContactType:  ->
    name = @get('newName')
    number = @get('newNumber')
    number = "" if number is undefined
    name = "" if name is undefined
    if (!name.trim() and !number.trim())
      return
    contactType =  @get('store').createRecord('contactType',
      name: name
      number: number
    )
    @set('newName', '')
    @set('newNumber', '')
    @get('contactTypes').pushObject contactType
    contactType.save()
    $(@).find(".new-el input.primary").focus()
  removeContactType: (contactType)->
    contactType.deleteRecord()

