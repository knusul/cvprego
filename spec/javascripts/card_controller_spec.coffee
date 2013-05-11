describe "CardController", ->
  beforeEach ->
    @controller = App.ExperienceController.create()

  describe "focus", ->
    it "makes transistion to card-edit state", ->
      @controller
