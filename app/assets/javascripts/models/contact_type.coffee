App.ContactType = DS.Model.extend
  number:  DS.attr('string')
  experience: DS.belongsTo('App.Experience')
