App.SkillsEditController = Em.ArrayController.extend
  ok: ->
    @transitionToRoute('index')

  removeSkill: (skill)->
    store = skill.get('store')
    store.transaction()
    skill.deleteRecord()
    store.commit()

  createSkill: ->
    name = @get('newName')
    if (!name.trim())
      return
    skill = App.Skill.createRecord
      name: name
    @set('newName', '')
    skill.save()
