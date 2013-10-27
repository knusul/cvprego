App.ApplicationController = Em.ObjectController.extend
  clickable: true

  actions:
    edit: ->
      @set('clickable', true)
      @transitionToRoute "index"

    ok: ->
      @set('clickable', false)
      @transitionToRoute "show", App.currentUser.email

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
