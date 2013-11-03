App.NewExperienceController = Em.ObjectController.extend
  rollback: ->
    @get('model').rollback()

  stopEditing: ->
    $(".modal.in").modal('hide')

  actions:

    save: ->
      @get('model').save()
      @stopEditing()

    cancel:  ->
      @rollback()
      @stopEditing()
