App.ExperienceView = Em.View.extend
  classNames: 'modal fade in form-custom-field-modal'.w()
  didInsertElement: ->
    this.$('textarea:first').focus()
    @$().modal 'show'

  willDestroyElement: ->
    @$().modal 'hide'
