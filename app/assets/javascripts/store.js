App.Adapter = DS.RESTAdapter.extend({
  bulkCommit: false
});

App.Adapter.map('App.Experience', {
  contactTypes: {embedded: 'always'}
});

App.Adapter.map('App.Details')
DS.RESTAdapter.configure("plurals", {
  details: "details"
});

App.Store = DS.Store.extend({
  revision: 11,
  adapter: App.Adapter.create()
});
