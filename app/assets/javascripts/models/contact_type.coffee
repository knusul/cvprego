App.ContactType = DS.Model.extend
  number:  DS.attr('string')
  card: DS.belongsTo('App.Card')
