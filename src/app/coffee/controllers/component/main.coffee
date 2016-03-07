angular.module('milcotaker').controller('MainController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    messageStore = Milkcocoa.getDataStore('message')

    messageStore.on('send', (data) ->
      content = $('<span>').text(data.value.message)
      $('#c-main').append(content)
    )

    return
])
