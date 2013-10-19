App.Education  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  name:        DS.attr('string')

  fullName: (->
    toDate = 'now' if @get('toDate') is null
    fromDate = @get('fromDate')
    if fromDate is null
      fromDate = ""
    else
      fromDate = "#{fromDate}-"
    name = @get('name')
    name = "" if name is null
    "#{fromDate}#{toDate}: #{name}"
  ).property('fromDate', 'toDate', 'name')
