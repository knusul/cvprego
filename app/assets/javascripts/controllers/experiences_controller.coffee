App.ExperiencesController = Em.ArrayController.extend
  needs: ['application']
  sortProperties: ['toDate', 'fromDate']
  activeExperienceId: null
