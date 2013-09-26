App.ApplicationController = Em.ObjectController.extend
  ok: ->
    window.location.href = "http://#{window.location.host}/show/?email=#{App.Card.find().get('email')}"
