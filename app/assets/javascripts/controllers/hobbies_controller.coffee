App.HobbiesController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  focus: ->
    @transitionToRoute('hobbies-edit')
