$ ->
  links = $("ul.nav")
  links.bind 'click', (e)->
    $($(e.target).attr('href')).on 'shown', ->
      $(this).find("[autofocus]:first").focus()
  login_form = $("#login-form form#new_user")
  login_form.bind "ajax:success", (e, data, status, xhr) ->
      if data.success
        $('#login-form').modal('hide')
        window.location.href = "/"
  .bind "ajax:error", (xhr, status, error) ->
    login_form.find(".login-header").html("<div class='alert alert-error'> <p>Wrong username or password.</p></div>")


  signup_form = $("form#new_user")
  signup_form.bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      $('#signup-form').modal('hide')
      window.location.href = "/"
    else
      signup_form.find(".login-header").html("<div class='alert alert-error'> <p>#{data.message}</p></div>")
