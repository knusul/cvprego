App.FocusView = Em.View.extend
  classNames: 'clearfix'.w()
  classNameBindings: ['clickable']

  clickable: (->
    if @get('controller').get('clickable')
      "clickable"
  ).property("debugger; @get(controller)")

  click: ->
    controller = @get('controller')
    if controller.get('clickable')
      controller.focus()
