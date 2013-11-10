App.ExperiencesController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  sortProperties: ["todaDateAsDate", "fromDateAsDate"]
  sortAscending: false

  focus: (experience)->
    @transitionToRoute('experience', experience)
