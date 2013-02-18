App.ContactInListView = Em.View.extend
  templateName: 'contact_in_list'
  tagName: 'li'
  classNameBindings: 'isActive:active'

  isActive: (->
    @get('content.id') is this.get('controller.activeContactId')
  ).property('controller.activeContactId')
