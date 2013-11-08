App.Experience  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  description:        DS.attr('string')
  company_name:        DS.attr('string')
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

  fullName: (->
    description = @get('description')
    role = @get('role')
    company_name = @get('company_name')

    if (!description && !role && !company_name)
      if (Ember.isNone(@get('id')))
        return '(New Experience)'
      else
        return '(No Name)'
    description = "" if description is null
    company_name = "" if company_name is null
    role = "" if role is null
    "#{company_name} #{role}"
  ).property('description', 'role', 'company_name')
