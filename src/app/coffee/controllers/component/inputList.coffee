angular.module('milcotaker').controller('InputListController', [
  '$scope', 'Milkcocoa'
  ($scope, Milkcocoa) ->
    $scope.members = []

    inputStore  = Milkcocoa.getDataStore('input')
    memberStore = Milkcocoa.getDataStore('member')

    inputStore.on 'send', (data) ->
      console.log 'log: got inputStore data'
      for member in $scope.members
        if member.name is data.value.name
          member.message = data.value.message
          $scope.$apply()
          break

    memberStore.on 'send', (data) ->
      if (data.value.type is 'join') and data.value.name? and (data.value.name isnt '')
        console.log 'log: got memberStore data - type: join'
        isUnique = true
        for member in $scope.members
          if data.value.name is member.name
            isUnique = false
            break

        if isUnique
          member = {
            name: data.value.name
            message: ""
          }
          $scope.members.push member
          $scope.$apply()

      if data.value.type is 'leave' and data.value.name?
        console.log 'log: got memberStore data - type: leave'
        for member in $scope.members
          newMembers = []
          newMembers.push member unless member.name is data.value.name
        $scope.members = newMembers
        $scope.$apply()

      console.log $scope.members

    return
])
