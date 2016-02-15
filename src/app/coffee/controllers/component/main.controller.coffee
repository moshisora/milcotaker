angular.module('milcotaker').controller('MainController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    dataStore = Milkcocoa.getDataStore('message')

    dataStore.on('send', (data) ->
      content = $('<span>').text(data.value.content)
      $('#c-main').append(content)
    )

    return
])
