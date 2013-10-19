App.Experience  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  description:        DS.attr('string')
  company_name:        DS.attr('string')
  role:        DS.attr('string')

  fullName: (->
    fromDate = @get('fromDate')
    toDate = @get('toDate')
    description = @get('description')
    role = @get('role')
    company_name = @get('company_name')

    if (!fromDate && !toDate && !description && !role && !company_name)
      if (Ember.isNone(@get('id')))
        return '(New Experience)'
      else
        return '(No Name)'
    fromDate = "" if fromDate is null
    if toDate is null
      toDate = ""
    else
      toDate = "-#{toDate}"
    if fromDate is null
      fromDate = ""
    else
      fromDate = "#{fromDate}"
    description = "" if description is null
    company_name = "" if company_name is null
    role = "" if role is null
    "#{fromDate} #{toDate} #{company_name} #{role}"
  ).property('fromDate', 'toDate', 'description', 'role', 'company_name')
