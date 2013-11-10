App.ExperienceInListView = Em.View.extend
  templateName: 'experience_in_list'
  tagName: 'li'
  classNames: "clearfix"
  classNameBindings: 'clickable isActive:active'

  isActive: (->
    @get('content.id') is this.get('controller.activeExperienceId')
  ).property('controller.activeExperienceId')
