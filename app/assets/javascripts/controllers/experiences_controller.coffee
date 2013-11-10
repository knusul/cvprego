App.ExperiencesController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  sortProperties: ['toDate', 'fromDate']

  focus: (experience)->
    @transitionToRoute('experience', experience)
