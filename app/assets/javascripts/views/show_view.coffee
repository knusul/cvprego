App.ShowView = Ember.View.extend
  didInsertElement: ->
    card = @get('controller.model')
    card.content.visit()
