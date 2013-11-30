App.Visit  = DS.Model.extend
  email: DS.attr('string')
  count: DS.attr('number')
  date: DS.attr('date')
  locations: DS.hasMany('location', embedded: 'always')
