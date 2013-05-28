App.EducationInListView = Em.View.extend
  templateName: 'education_in_list'
  tagName: 'li'
  classNameBindings: 'isActive:active'

  isActive: (->
    @get('content.id') is this.get('controller.activeEducationId')
  ).property('controller.activeEducationId')
