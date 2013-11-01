App.EducationsController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  sortProperties: ['toDate', 'fromDate']

