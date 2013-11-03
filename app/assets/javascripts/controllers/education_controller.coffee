App.EducationController = Em.ObjectController.extend
  stopEditing: ->
    $(".modal.in").modal('hide')

  actions:

    save:  ->
      record = @get('content')
      record.save()
      @stopEditing()

    cancel:  ->
      @stopEditing()

    destroyRecord:  ->
      if (window.confirm("Are you sure you want to delete this record?"))
        record = @get('content')
        record.deleteRecord()
        record.save()
        @stopEditing()
