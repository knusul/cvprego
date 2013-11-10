App.FocusView = Em.View.extend
  classNames: 'clearfix'.w()
  classNameBindings: ['clickable']

  clickable: (->
    if @get('controller.controllers.application').get('clickable')
      "clickable"
  ).property("controller.controllers.application.clickable")

  click: ->
    controller = @get('controller')
    if controller.get('controllers.application').get('clickable')
      controller.focus(@object)
