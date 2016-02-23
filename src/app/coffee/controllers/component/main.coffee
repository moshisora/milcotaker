angular.module('milcotaker').controller('MainController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    dataStore = Milkcocoa.getDataStore('message')

    dataStore.on('send', (data) ->
      console.log 'recieve message'
      content = $('<span>').text(data.value.message)
      $('#c-main').append(content)
    )

    return
])
