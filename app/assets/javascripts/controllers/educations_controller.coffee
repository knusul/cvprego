App.EducationsController = Em.ArrayController.extend
  needs: ['application']
  sortProperties: ['toDate', 'fromDate']
  activeExperienceId: null
