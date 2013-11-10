App.Education  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  name:        DS.attr('string')

  dateRange: (->
    fromDate = @get('fromDate')
    toDate = @get('toDate')
    fromDate = "" if fromDate is null
    if toDate is null
      toDate = ""
    else
      toDate = "-#{toDate}"
    if fromDate is null
      fromDate = ""
    else
      fromDate = "#{fromDate}"
    "#{fromDate} #{toDate}"
  ).property('fromDate', 'toDate')

  fromDateAsDate: (->
    Date.parse(@get('fromDate'))
  ).property('fromDate')

  toDateAsDate: (->
    console.log Date.parse(@get('toDate'))
    Date.parse(@get('toDate'))
  ).property('toDate')

  fullName: (->
    name = @get('name')
    name = "" if name is null
    "#{name}"
  ).property('name')
