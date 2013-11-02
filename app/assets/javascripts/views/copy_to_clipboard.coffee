App.CopyToClipboard = Em.View.extend
  template: Ember.Handlebars.compile("{{input value=href readonly='true' id='copy-to-clipboard'}}")
  click: ->
    $('#copy-to-clipboard').select()
