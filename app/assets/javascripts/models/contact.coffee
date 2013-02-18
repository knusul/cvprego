App.Contact  = DS.Model.extend
  firstName:    DS.attr('string')
  lastName:     DS.attr('string')
  email:        DS.attr('string')
  notes:        DS.attr('string')
  phoneNumbers: DS.hasMany('App.PhoneNumber')

  fullName: (->
    firstName = @get('firstName')
    lastName = @get('lastName')

    if (!firstName && !lastName)
      if (Ember.isNone(@get('id')))
        return '(New Contact)'
      else
        return '(No Name)'
    firstName = "" if firstName is undefined
    lastName = "" if lastName is undefined

    firstName + ' ' + lastName
  ).property('firstName', 'lastName')

  gravatar:  (->
    email = @get('email')
    if (!email)
      email = ''
    'http://www.gravatar.com/avatar/' + MD5(email)
  ).property('email')
