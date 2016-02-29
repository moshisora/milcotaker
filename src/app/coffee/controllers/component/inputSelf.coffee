angular.module('milcotaker').controller('InputSelfController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->

    inputStore   = Milkcocoa.getDataStore('input')
    messageStore = Milkcocoa.getDataStore('message')
    memberStore  = Milkcocoa.getDataStore('member')

    inputName    = $('#c-input-self__name')
    inputMessage = $('#c-input-self__message')

    inputMessage.keyup ->
      inputStore.send({
        name: inputName.val()
        message: inputMessage.val()
      })

    inputName.change ->
      memberStore.send({
        type: 'join'
        name: inputName.val()
      })

    inputMessage.change ->
      messageStore.send({
        name: inputName.val()
        message: inputMessage.val()
      })
      inputMessage.val('')

    $scope.$on 'destroy', ->
      memberStore.send({
        type: 'leave'
        name: inputName.val()
      })

    return
])
