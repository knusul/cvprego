App.SkillsController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  focus: ->
    @transitionToRoute('skills-edit')
