App.ImageSelectorView = Em.View.extend(
  templateName: "image_selector"
  classNames: ["image-selector"]
  title: "upload picture"
  init: ->
    @_super()
    @set "localSelected", true

  selectLocal: ->
    @set "localSelected", true

  selectRemote: ->
    @set "localSelected", false

  remoteSelected:( ->
    not @get("localSelected")
  ).property("localSelected")
  upload: ->
    @get("uploadTarget").fileupload "add",
      fileInput: $("#filename-input")


  add: ->
    @get("composer").addMarkdown "![image](" + $("#fileurl-input").val() + ")"
    $("#discourse-modal").modal "hide"
)
