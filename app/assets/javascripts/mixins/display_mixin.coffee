App.DisplayableMixin = Em.Mixin.create
  length: ->
    @get('model.length')

  clickable: ->
    @get('controllers.application.clickable')

  displayable: (->
    @length() or @clickable()
  ).property('length', 'clickable')

