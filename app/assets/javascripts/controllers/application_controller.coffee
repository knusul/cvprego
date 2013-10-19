App.ApplicationController = Em.ObjectController.extend
  clickable: true
  ok: ->
    @set('clickable', false)
    @transitionToRoute "show", @store.find('card', 'singleton')

  edit: ->
    @set('clickable', true)
    @transitionToRoute "index"
  savePDF: ->
    doc = new jsPDF()
    specialElementHandlers = "#editor": (element, renderer) ->
        true
    doc.fromHTML $("#content").get(0), 15, 15,
      width: 170,
      elementHandlers: specialElementHandlers
    doc.save("JakubNieznalski.pdf")

  href: (->
    window.location.href
  ).property()
