App.CardEditView = Em.View.extend
  classNames: 'modal'.w()

  didInsertElement: ->
    this.$('input:first').focus()
    @$().modal 'show'

  willDestroyElement: ->
    @$().modal 'hide'

  keyPress: (e) ->
   if  e.charCode is 13
     if $("input:focus").parent().hasClass('new-el')
       $(".new-el a").click()
     else
      @$('form').submit()
