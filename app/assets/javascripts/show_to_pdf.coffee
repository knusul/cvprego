$.fn.childNodes = ->
  return this.pushStack( this.get(0).childNodes || [] )
$(->

  $("img, .download").click ->
    doc = new jsPDF()

    # We'll make our own renderer to skip this editor
    specialElementHandlers = ".navbar-wrapper": (element, renderer) ->
      true


    # All units are in the set measurement for the document
    # This can be changed to "pt" (points), "mm" (Default), "cm", "in"
    doc.fromHTML $("#printable").get(0), 15, 15,
      width: 140
      elementHandlers: specialElementHandlers
    doc.save($("h1").html().trim().replace(" ", "_")+".pdf")
)

