App.Experience  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  email:        DS.attr('string')
  notes:        DS.attr('string')
  contactTypes: DS.hasMany('App.ContactType')

  fullName: (->
    fromDate = @get('fromDate')
    toDate = @get('toDate')

    if (!fromDate && !toDate)
      if (Ember.isNone(@get('id')))
        return '(New Experience)'
      else
        return '(No Name)'
    fromDate = "" if fromDate is undefined
    toDate = "" if toDate is undefined

    fromDate + ' ' + toDate
  ).property('fromDate', 'toDate')

  gravatar:  (->
    email = @get('email')
    if (!email)
      email = ''
    'http://www.gravatar.com/avatar/' + MD5(email)
  ).property('email')
