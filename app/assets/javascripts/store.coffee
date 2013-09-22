App.Adapter = DS.LSAdapter.extend()

App.Adapter = DS.RESTAdapter.extend({
  plurals: {
      'card': 'card'
      'hobby': 'hobbies'
    }
})

App.Adapter.configure("plurals", {
    card: "card"
    hobby: 'hobbies'
})
App.Adapter.map 'App.Card',
  contact_types:
    embedded: "always"

App.Store = DS.Store.extend(
  revision: 11,
  adapter: App.Adapter.create()
)

