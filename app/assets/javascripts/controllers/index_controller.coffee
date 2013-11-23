App.IndexController = Em.Controller.extend
  actions:
    edit: ->
      @set('clickable', true)
      @transitionToRoute "index"

    routeToShow: ->
      @set('clickable', false)
      @transitionToRoute "show", App.currentUser.email

    routeToStats: ->
      @set('clickable', false)
      @transitionToRoute "stats"
  signup: ->
    $.post("/users",
      user:
        email: @get("email"),
        password: @get("password")
        password_confirmation: @get("password_confirmation")
    ).then((data)->
      if data.success
        window.location.href = "/"
      else
        $(".login-header").html("<div class='alert alert-error'> <p>#{data.message}</p></div>")
    )
