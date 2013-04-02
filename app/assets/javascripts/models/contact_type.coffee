App.ContactType = DS.Model.extend
  number:  DS.attr('string')
  name: DS.attr('string')
  card: DS.belongsTo('App.Card')
