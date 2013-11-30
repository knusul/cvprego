App.StatsController = Em.ArrayController.extend
  actions:
    edit: ->
      @set('clickable', true)
      @transitionToRoute "index"
