App.ShowController = Em.ObjectController.extend
  needs: ['application']

  actions:
    savePDF: ->
      @get('controllers.application').send('savePDF')
