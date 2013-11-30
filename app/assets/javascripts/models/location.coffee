App.Location  = DS.Model.extend
  visit: DS.belongsTo('visit', embedded: 'always')
  city: DS.attr('string')
  country: DS.attr('string')
  longitude: DS.attr('string')
  latitude: DS.attr('string')
  ip: DS.attr('string')
