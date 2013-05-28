App.EducationController = Em.ObjectController.extend
  startEditing:  ->
    education = @get('content')
    @transaction = education.get('store').transaction()
    @transaction.add(education)

  stopEditing: ->
    if (@transaction)
      @transaction.rollback()
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
    if (window.confirm("Are you sure you want to delete @education?"))
      @get('content').deleteRecord()
      @transaction.commit()
      @get('store').commit()
      @get('target.router').transitionTo('index')
