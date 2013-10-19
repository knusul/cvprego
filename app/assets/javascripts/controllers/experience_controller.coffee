App.ExperienceController = Em.ObjectController.extend
  stopEditing: ->
    @transitionToRoute('index')

  save:  ->
    @stopEditing()

  cancel:  ->
    @stopEditing()

  destroyRecord:  ->
    if (window.confirm("Are you sure you want to delete @experience?"))
      record = @get('content')
      record.deleteRecord()
      record.save()
      @stopEditing()
