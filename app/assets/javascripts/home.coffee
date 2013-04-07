$ ->
  login_form = $("#login-form form#new_user")
  login_form.bind "ajax:success", (e, data, status, xhr) ->
      if data.success
        $('#login-form').modal('hide')
        window.location.href = "/"
  .bind "ajax:error", (xhr, status, error) ->
    login_form.prepend("<p>Wrong username or password.</p>")


  signup_form = $("#signup-form form#new_user")
  signup_form.bind "ajax:success", (e, data, status, xhr) ->
      if data.success
        $('#signup-form').modal('hide')
        window.location.href = "/"
      else
        signup_form.prepend("<p>Email already taken or passwords mismatch.</p>")
