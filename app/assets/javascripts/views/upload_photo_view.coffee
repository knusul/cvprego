App.UploadPhotoView = Ember.View.extend
  templateName: 'upload_photo'

  didInsertElement: ->
    card = @get('card')
    $('#fileupload').fileupload
      url: '/uploads'
      dataType: 'json',
      done: (e, data) ->
        card.set('photoUrl', data.result.url)
        $("#progress").html("")
      progressall: (e, data) ->
          progress = parseInt(data.loaded / data.total * 100, 10)
          $('#progress .bar').css(
              'width',
              progress + '%'
          )
