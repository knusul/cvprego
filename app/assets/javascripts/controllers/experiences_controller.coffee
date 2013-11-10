App.ExperiencesController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  sortProperties: ["toDate", "fromDate"]
  sortAscending: false

  focus: (experience)->
    @transitionToRoute('experience', experience)
