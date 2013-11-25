App.ApplicationView = Em.View.extend
  didInsertElement: ->
    @$().on 'hidden.bs.modal', =>
      @get('controller.target.router').transitionTo('index')
