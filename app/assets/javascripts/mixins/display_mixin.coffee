App.DisplayableMixin = Em.Mixin.create
  displayable: (->
    @get('model.length') or @get('controllers.application.clickable')
  ).property('model.length', 'controllers.application.clickable')
