App.HobbiesEditController = Em.ArrayController.extend
  actions:

    createHobby: ->
      name = @get('newName')
      if (!name.trim())
        return
      hobby = @get('store').createRecord('hobby', {name: name})
      @set('newName', '')
      hobby.save()

    removeHobby: (hobby)->
      hobby.deleteRecord()
      hobby.save()

    ok: ->
      @transitionToRoute('index')

