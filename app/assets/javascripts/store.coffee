App.ApplicationAdapter = DS.RESTAdapter.extend()
App.ApplicationSerializer = DS.RESTSerializer.extend
  normalize: (type, hash, property) ->
    json = {}
    for prop of hash
      json[prop.camelize()] = hash[prop]
    @._super(type, json, property)
