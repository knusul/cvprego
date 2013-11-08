App.ExperienceInListView = Em.View.extend
  templateName: 'experience_in_list'
  tagName: 'li clickable'
  classNameBindings: 'isActive:active'

  isActive: (->
    @get('content.id') is this.get('controller.activeExperienceId')
  ).property('controller.activeExperienceId')
