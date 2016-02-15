angular.module('milcotaker').controller('InputController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    dataStore = Milkcocoa.getDataStore('message')

    return
])
