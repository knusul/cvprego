App.SkillsEditController = Em.ArrayController.extend
  save: ->
    @transitionToRoute('index')

  startEditing:  ->

  stopEditing:  ->

  cancel: ->
    @stopEditing()
    @transitionToRoute('index')

  removeSkill: (skill)->
    skill.deleteRecord()

  createSkill: ->
    name = @get('newName')
    if (!name.trim())
      return
    skill = App.Skill.createRecord
      name: name
    @set('newName', '')
    skill.save()
