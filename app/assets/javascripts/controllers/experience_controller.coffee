App.ExperienceController = Em.ObjectController.extend
  startEditing:  ->
    experience = @get('content')
    transaction = experience.get('store').transaction()
    transaction.add(experience)
    experience.get('phoneNumbers').forEach (phoneNumber)->
      transaction.add(phoneNumber)
    @transaction = transaction

  stopEditing: ->
    transaction = @transaction
    if (transaction)
      transaction.rollback()
      @transaction = undefined
    @transitionToRoute('experiences')

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
    if (window.confirm("Are you sure you want to delete @experience?"))
      @get('content').deleteRecord()
      @get('store').commit()
      @get('target.router').transitionTo('experiences.index')
