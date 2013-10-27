App.ApplicationAdapter = DS.ActiveModelAdapter.extend()
App.ApplicationSerializer = DS.ActiveModelSerializer.extend()
App.CardSerializer = DS.ActiveModelSerializer.extend
  attrs:
    contactTypes: { embedded: 'always' }
