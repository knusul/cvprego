App.UploadPhotoView = Ember.View.extend
  templateName: 'upload_photo'

  didInsertElement: ->
    card = @get('card')
    $('#fileupload').fileupload
      url: '/uploads'
      dataType: 'json',
      done: (e, data) ->
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
