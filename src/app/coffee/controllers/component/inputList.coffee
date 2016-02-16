angular.module('milcotaker').controller('InputListController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    dataStore = Milkcocoa.getDataStore('message')

    return
])
