App.ApplicationController = Em.ObjectController.extend
  clickable: true
  ok: ->
    @set('clickable', false)
    @transitionToRoute "show", App.Card.find('singleton').get('email')

  edit: ->
    @set('clickable', true)
    @transitionToRoute "index"
