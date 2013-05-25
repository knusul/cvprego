describe "Card", ->
  afterEach ->
     jQuery.ajax.restore()

  beforeEach ->
    @spy = sinon.spy(jQuery, 'ajax')
    @card = App.Card.createRecord()
    @card.get('contactTypes').createRecord(name: "contactTypeName")
    @card.store.commit()


  it "sends PUT to server with dedependent contactTypes", ->
    expect(jQuery.ajax.calledOnce)
    expect(jQuery.ajax.getCall(0).args[0]['data']).toMatch /contactTypeName/
