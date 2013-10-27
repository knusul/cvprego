App.Card  = DS.Model.extend Ember.Validations,
  validations:
    firstName:
      presence: true
    lastName:
      presence: true

  firstName:    DS.attr('string')
  lastName:     DS.attr('string')
  email:        DS.attr('string')
  photoUrl:     DS.attr('string')
  contactTypes: DS.hasMany('contactType', embedded: 'always')

  fullName: (->
    fromDate = @get('firstName')
    toDate = @get('lastName')

    if (!firstName && !lastName)
      if (Ember.isNone(@get('id')))
        return '(New Cards)'
      else
        return '(No Name)'
    firstName = "" if fromDate is undefined
    lastName = "" if toDate is undefined

    firstName + ' ' + lastName
  ).property('firstName', 'lastName')

  gravatar:  (->
    email = @get('email')
    if (!email)
      email = ''
    'http://www.gravatar.com/avatar/' + MD5(email)
  ).property('email')
