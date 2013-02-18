App.ContactView = Em.View.extend
  classNames: 'modal fade in form-custom-field-modal'.w()
  didInsertElement: ->
    this.$('input:first').focus()
    @$().modal 'show'
    @$().on 'hidden', =>
      @get('controller').stopEditing()
      @get('controller.target.router').transitionTo('contacts.index')

  willDestroyElement: ->
    @$().modal 'hide'
