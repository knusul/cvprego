App.ExperienceController = Em.ObjectController.extend
  startEditing:  ->
    experience = @get('content')
    transaction = experience.get('store').transaction()
    transaction.add(experience)
    @transaction = transaction

  stopEditing: ->
    transaction = @transaction
    if (transaction)
      transaction.rollback()
      @transaction = undefined
    @transitionToRoute('index')

  save:  ->
    @transaction.commit()
    @transaction = undefined
    @stopEditing()

  cancel:  ->
    @stopEditing()

  addContactType:  ->
    @get('content.contactTypes').createRecord()

  destroyRecord:  ->
    if (window.confirm("Are you sure you want to delete @experience?"))
      @get('content').deleteRecord()
      @transaction.commit()
      @get('store').commit()
      @get('target.router').transitionTo('index')
