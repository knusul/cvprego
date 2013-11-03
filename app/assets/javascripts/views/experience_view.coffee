App.ExperienceView = Em.View.extend
  classNames: 'modal fade in form-custom-field-modal'.w()
  didInsertElement: ->
    this.$('textarea:first').focus()
    @$().modal 'show'
    @$().on 'hidden.bs.modal', =>
      @get('controller.target.router').transitionTo('index')

  willDestroyElement: ->
    @$().modal 'hide'
