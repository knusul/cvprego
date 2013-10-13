App.Education  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  name:        DS.attr('string')

  fullName: (->
    toDate = @get('toDate') or 'now'
    "#{@get('fromDate')}-#{toDate}: #{@get('name')}"
  ).property('fromDate', 'toDate', 'name')
