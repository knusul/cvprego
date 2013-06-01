App.SkillsEditController = Em.ArrayController.extend
  save: ->
    @transaction.commit()
    @transaction = null
    @transitionToRoute('index')

  startEditing:  ->
    @transaction = @get('store').transaction()

  stopEditing:  ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null
    @transitionToRoute('index')

  cancel: ->
    @stopEditing()

  addSkill:  ->
    @transaction.createRecord(App.Skill, {name: ""})

  removeSkill: (skill)->
    skill.deleteRecord()
