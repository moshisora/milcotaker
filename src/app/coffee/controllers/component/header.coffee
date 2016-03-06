angular.module('milcotaker').controller('HeaderController', [
  '$scope', '$cookies'
  ($scope, $cookies) ->

    $scope.milkcocoaAppId = $cookies.get('milkcocoaAppId') || ''
    $scope.showMilkcocoaAppIdView = false

    $scope.openMilkcocoaAppIdView = ->
      $scope.showMilkcocoaAppIdView = !$scope.showMilkcocoaAppIdView

    $scope.setMilkcocoaAppId = ->
      appId = $("#c-header__overlay__input--milkcocoa").val()
      $cookies.put 'milkcocoaAppId', appId
      window.location.reload()

    $scope.saveTakedText = ($event) ->
      text = $('#c-main').text()
      blob = new Blob [text], { type: 'text/plain' }
      $event.target.href = window.URL.createObjectURL(blob)

    return
])
