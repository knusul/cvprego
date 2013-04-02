App.Adapter = DS.RESTAdapter.extend({
  bulkCommit: false
})

#App.Adapter = DS.LSAdapter.extend()

App.Adapter.map('App.Card', {
  contactTypes: {embedded: 'always'}
});

App.Adapter.map('App.Experience')

App.Store = DS.Store.extend({
  revision: 11,
  adapter: App.Adapter.create()
});
