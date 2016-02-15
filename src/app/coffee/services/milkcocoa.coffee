angular.module('milcotaker').factory('Milkcocoa', [ ->
  milkcocoa = new MilkCocoa('flagiknz7vkf.mlkcca.com')

  return {
    object: milkcocoa

    getDataStore: (name) ->
      dataStoreName = name | 'default'
      dataStore = milkcocoa.dataStore(name)
      return dataStore
  }
])
