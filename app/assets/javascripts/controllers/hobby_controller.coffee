App.HobbysController = Em.ArrayController.extend
  focus: ->
    @transitionToRoute('hobbys-edit')
