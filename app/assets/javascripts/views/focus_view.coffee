App.FocusView = Em.View.extend
  click: ->
    controller = @get('controller')
    controller.focus()
