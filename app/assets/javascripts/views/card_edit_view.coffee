App.CardEditView = Em.View.extend
  classNames: 'modal fade in form-custom-field-modal'.w()

  didInsertElement: ->
    this.$('input:first').focus()
    @$().modal 'show'
    @$().on 'hidden', =>
      @get('controller.target.router').transitionTo('index')

  willDestroyElement: ->
    @$().modal 'hide'

  keyPress: (e) ->
   if  e.charCode is 13
     @$('form').submit()
