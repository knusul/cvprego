App.SkillsEditController = Em.ArrayController.extend
  save: ->
    @transaction.commit()
    @transaction = null
    @transitionToRoute('index')

  startEditing:  ->
    @transaction = @get('store').transaction()
    @forEach (skill) =>
      @transaction.add(skill)

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null

  cancel: ->
    @stopEditing()
    @transitionToRoute('index')

  addSkill:  ->
    @transaction.createRecord(App.Skill, {name: ""})

  removeSkill: (skill)->
    skill.deleteRecord()
