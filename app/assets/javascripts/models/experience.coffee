App.Experience  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  description:        DS.attr('string')
  companyName:        DS.attr('string')
  role:        DS.attr('string')

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
    description = @get('description')
    role = @get('role')

    if (!description && !role)
      if (Ember.isNone(@get('id')))
        return '(New Experience)'
      else
        return '(No Name)'
    description = "" if description is null
    role = "" if role is null
    "#{role}"
  ).property('description', 'role')
