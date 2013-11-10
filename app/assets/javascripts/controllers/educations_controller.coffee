App.EducationsController = Em.ArrayController.extend App.DisplayableMixin,
  needs: ['application']
  sortProperties: ["todaDateAsDate", "fromDateAsDate"]
  sortAscending: false

  focus: (education)->
    @transitionToRoute('education', education)
