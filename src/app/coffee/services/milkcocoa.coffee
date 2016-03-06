angular.module('milcotaker').factory('Milkcocoa', [
  '$cookies'
  ($cookies) ->

    milkcocoaId = $cookies.get('milkcocoaAppId') + '.mlkcca.com'
    milkcocoa   = new MilkCocoa(milkcocoaId)

    return {
      object: milkcocoa

      getDataStore: (name) ->
        dataStoreName = name | 'default'
        dataStore = milkcocoa.dataStore(name)
        return dataStore
    }
])
