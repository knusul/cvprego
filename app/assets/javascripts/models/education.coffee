App.Education  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  name:        DS.attr('string')


  fullName: (->
    @get('name') or "unknown"
  ).property('fromDate', 'toDate', 'name')
