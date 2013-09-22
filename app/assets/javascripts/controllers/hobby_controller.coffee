App.HobbiesController = Em.ArrayController.extend
  focus: ->
    @transitionToRoute('hobbies-edit')
