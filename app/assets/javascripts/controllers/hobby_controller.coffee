App.HobbiesController = Em.ArrayController.extend
  needs: ['application']
  focus: ->
    @transitionToRoute('hobbies-edit')
