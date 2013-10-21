App.IndexController = Em.Controller.extend
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
