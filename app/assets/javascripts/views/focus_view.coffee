App.FocusView = Em.View.extend
  classNames: 'clickable'.w()
  click: ->
    controller = @get('controller')
    controller.focus()
