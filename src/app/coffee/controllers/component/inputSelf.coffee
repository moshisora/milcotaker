angular.module('milcotaker').controller('InputSelfController', [
  '$scope', 'Milkcocoa', '$cookies'
  ($scope, Milkcocoa, $cookies) ->

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

    memberStore.on 'send', (data) ->
      if data.value.type is 'get' and inputName.val() isnt ''
        memberStore.send({
          type: 'reply'
          name: inputName.val()
        })

    memberStore.send({
      type: 'get'
    })

    shortcutKeys = {}
    loadShortcutKeys = ->
      for i in [1..12]
        key = 'shortcutF' + i
        shortcutKeys[key] = $cookies.get(key) || ''
    loadShortcutKeys()

    $scope.$on 'updateShortcutKeys', ->
      loadShortcutKeys()

    appendShortcutValue = (keyCode) ->
      key = 'shortcutF' + (keyCode - 112 + 1)
      return unless shortcutKeys[key]

      appendedText = inputMessage.val() + shortcutKeys[key]
      inputMessage.val(appendedText)

    $(document).keydown (event) ->
      appendShortcutValue(event.keyCode)

    return
])
