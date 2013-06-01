App.SkillsController = Em.ArrayController.extend
  focus: ->
    @transitionToRoute('skills-edit')
