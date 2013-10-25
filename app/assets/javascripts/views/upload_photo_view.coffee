App.UploadPhotoView = Ember.View.extend
  templateName: 'upload_photo'

  didInsertElement: ->
    console.log "BANG BANG"
    card = @get('card')
    console.log $("#fileupload")
    $('#fileupload').fileupload
      url: '/uploads'
      dataType: 'json',
      done: (e, data) ->
        $(this).parent().find('#progress').remove()
        if(data.result['errors'])
          html = $.parseHTML("<div class='alert alert-error'>#{data.result['errors'][0]} </div>")
          $(@).closest('.ember-view').prepend(html)
          $(html[0]).delay(3000).fadeOut('slow'); 
        else
          card.set('photoUrl', data.result.url)
        $("#progress").html("")
      progressall: (e, data) ->
          progress = parseInt(data.loaded / data.total * 100, 10)
          $('#progress .bar').css(
              'width',
              progress + '%'
          )
      send: (e, data) ->
        $(this).parent().append("<div id='progress' class='progress progress-success progress-striped'><div class='bar'></div></div>")
