angular.module('milcotaker').controller('InputController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    return unless $scope.isSelf

    inputStore   = Milkcocoa.getDataStore('input')
    messageStore = Milkcocoa.getDataStore('message')
    memberStore  = Milkcocoa.getDataStore('member')

    inputName    = $('.c-input__input-name:last')
    inputMessage = $('.c-input__input-message:last')

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
