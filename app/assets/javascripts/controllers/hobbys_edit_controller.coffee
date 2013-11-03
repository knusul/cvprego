App.HobbiesEditController = Em.ArrayController.extend
  createHobby: ->
    name = @get('newName')
    if (!name.trim())
      return
    hobby = @get('store').createRecord('hobby', {name: name})
    @set('newName', '')
    hobby.save()

  actions:
    removeHobby: (hobby)->
      hobby.deleteRecord()
      hobby.save()

    ok: ->
      @createHobby()
      $(".modal.in").modal('hide')

