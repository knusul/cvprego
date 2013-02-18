Handlebars.registerHelper 'submitButton', (text)->
  return new Handlebars.SafeString('<button type="submit" class="btn btn-primary">' + text + '</button>')

Handlebars.registerHelper 'mailto', (field)->
  address = this.get(field)
  if (address)
    new Handlebars.SafeString('<a href="mailto: ' + address + '" />' + address + '</a>')

