App.StatsController = Em.ObjectController.extend
  actions:
    edit: ->
      @set('clickable', true)
      @transitionToRoute "index"
