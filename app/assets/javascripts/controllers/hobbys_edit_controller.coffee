App.HobbiesEditController = Em.ArrayController.extend
  ok: ->
    @transitionToRoute('index')

  removeHobby: (hobby)->
    store = hobby.get('store')
    store.transaction()
    hobby.deleteRecord()
    store.commit()

  createHobby: ->
    name = @get('newName')
    if (!name.trim())
      return
    hobby = App.Hobby.createRecord
      name: name
    @set('newName', '')
    hobby.save()
