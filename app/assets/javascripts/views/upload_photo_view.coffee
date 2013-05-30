App.UploadPhotoView = Ember.View.extend
  templateName: 'upload_photo'

  didInsertElement: ->
    card = this.get('card')
    $('#fileupload').fileupload
        dataType: 'json',
        done: (e, data) ->
          card.set('photoUrl', data.result.url)
        progressall: (e, data) ->
            progress = parseInt(data.loaded / data.total * 100, 10)
            $('#progress .bar').css(
                'width',
                progress + '%'
            )
