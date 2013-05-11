# use require to load any .js file available to the asset pipeline
#
describe "ExperienceController", ->
  beforeEach ->
    @controller = App.ExperienceController.create()

  describe "#destroyRecord", ->
    it "popups confirmation box", ->
      spyOn(window, "confirm")
      @controller.destroyRecord()
      expect(window.confirm).toHaveBeenCalled()

    it "on confirm delete content record", ->
      #wip
      window.confirm = ->
        true
      model = {}
      model.deleteRecord = sinon.stub.returns(true)
      store = {}
      store.commit = sinon.stub.returns(true)
      router = {}
      router.transitionTo = sinon.stub().withArgs('experiences.index').returns(true)
      target = {}
      @controller.set("content", model)
      @controller.set("store", store)
      @controller.set("target", target)
      @controller.set("target.router", router)

