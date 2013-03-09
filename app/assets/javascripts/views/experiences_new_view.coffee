App.ExperiencesNewView = Ember.View.extend
  classNames: 'modal fade in form-custom-field-modal'.w()
  didInsertElement: ->
    this.$('input:first').focus()
    @$().modal 'show'
    @$().on 'hidden', =>
      @get('controller.target.router').transitionTo('experiences.index')

  willDestroyElement: ->
    @$().modal 'hide'
