App.Experience  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  email:        DS.attr('string')
  description:        DS.attr('string')
  tittle:        DS.attr('string')
  role:        DS.attr('string')

  fullName: (->
    fromDate = @get('fromDate')
    toDate = @get('toDate')
    description = @get('description')
    role = @get('role')
    tittle = @get('tittle')

    if (!fromDate && !toDate)
      if (Ember.isNone(@get('id')))
        return '(New Experience)'
      else
        return '(No Name)'
    fromDate = "" if fromDate is undefined
    toDate = "" if toDate is undefined
    description = "" if description is undefined
    tittle = "" if tittle is undefined
    role = "" if role is undefined
    "#{tittle}: #{role}"
  ).property('fromDate', 'toDate')

  gravatar:  (->
    email = @get('email')
    if (!email)
      email = ''
    'http://www.gravatar.com/avatar/' + MD5(email)
  ).property('email')
