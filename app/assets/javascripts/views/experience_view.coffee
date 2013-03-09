App.ExperienceView = Em.View.extend
  classNames: 'modal fade in form-custom-field-modal'.w()
  didInsertElement: ->
    this.$('input:first').focus()
    @$().modal 'show'
    @$().on 'hidden', =>
      @get('controller').stopEditing()
      @get('controller.target.router').transitionTo('index')

  willDestroyElement: ->
    @$().modal 'hide'
