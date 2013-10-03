App.FocusView = Em.View.extend
  classNames: 'clearfix clickable'.w()
  click: ->
    controller = @get('controller')
    controller.focus()
