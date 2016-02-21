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
      console.log 'log: send to inputStore'
      inputStore.send({
        name: inputName.val()
        message: inputMessage.val()
      })

    inputName.change ->
      console.log 'log: send to memberStore - type: join'
      memberStore.send({
        type: 'join'
        name: inputName.val()
      })

    $scope.$on 'destroy', ->
      console.log 'log: send to memberStore - type: leave'
      memberStore.send({
        type: 'leave'
        name: inputName.val()
      })

    return
])
