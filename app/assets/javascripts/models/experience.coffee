App.Experience  = DS.Model.extend
  fromDate:    DS.attr('string')
  toDate:     DS.attr('string')
  email:        DS.attr('string')
  notes:        DS.attr('string')

  fullName: (->
    fromDate = @get('fromDate')
    toDate = @get('toDate')
    notes = @get('notes')

    if (!fromDate && !toDate)
      if (Ember.isNone(@get('id')))
        return '(New Experience)'
      else
        return '(No Name)'
    fromDate = "" if fromDate is undefined
    toDate = "" if toDate is undefined
    notes = "" if notes is undefined
    notes + ": " +fromDate + ' ' + toDate
  ).property('fromDate', 'toDate')

  gravatar:  (->
    email = @get('email')
    if (!email)
      email = ''
    'http://www.gravatar.com/avatar/' + MD5(email)
  ).property('email')
