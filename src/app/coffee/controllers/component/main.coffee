angular.module('milcotaker').controller('MainController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    messageStore = Milkcocoa.getDataStore('message')
    memberStore  = Milkcocoa.getDataStore('member')

    messageStore.on('send', (data) ->
      content = $('<span>').text(data.value.message)
      $('#c-main').append(content)
    )

    memberStore.on('send', (data) ->
      console.log data.value.type
    )

    memberStore.send({
      type: 'get'
    })

    return
])
