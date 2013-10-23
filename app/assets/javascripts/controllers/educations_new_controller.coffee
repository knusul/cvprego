App.NewEducationController = Em.ObjectController.extend
  rollback: ->
    @get('model').rollback()

  stopEditing: ->
    @transitionToRoute('index')

  actions:
    save: ->
      @get('model').save()
      @stopEditing()

    cancel:  ->
      @rollback()
      @stopEditing()
