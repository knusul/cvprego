App.SkillsController = Em.ArrayController.extend
  needs: ['application']
  focus: ->
    @transitionToRoute('skills-edit')
