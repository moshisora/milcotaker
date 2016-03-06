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

    return
])
