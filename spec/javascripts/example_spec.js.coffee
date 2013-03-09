# use require to load any .js file available to the asset pipeline

describe "ContactController", ->
  loadFixtures 'example_fixture' # located at 'spec/javascripts/fixtures/example_fixture.html.haml'
  it "#destroyRecord should popup confirmation box", ->
    controller = App.ContactController.create()
    controller.set("content", "foo")

describe "Bar", ->
  it "it is not foo", ->
    expect(2 isnt 3).toEqual true
    
