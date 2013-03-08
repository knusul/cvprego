# use require to load any .js file available to the asset pipeline

describe "Foo", ->
  loadFixtures 'example_fixture' # located at 'spec/javascripts/fixtures/example_fixture.html.haml'
  it "it is not bar", ->
    expect(2).toEqual(2)

describe "Bar", ->
  it "it is not foo", ->
    expect(2 isnt 3).toEqual true
