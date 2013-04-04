$ ->
  $("#login-form form#new_user").bind "ajax:success", (e, data, status, xhr) ->
      if data.success
        $('#login-form').modal('hide')
        window.location.href = "/"
  .bind "ajax:error", (xhr, status, error) ->
    alert "bee"

  $("#signup-form form#new_user").bind "ajax:success", (e, data, status, xhr) ->
      if data.success
        $('#signup-form').modal('hide')
        window.location.href = "/"
      else
        alert "Please provide correct email and same passwords"
