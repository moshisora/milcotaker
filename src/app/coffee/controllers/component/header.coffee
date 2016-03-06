angular.module('milcotaker').controller('HeaderController', [
  '$scope', '$cookies'
  ($scope, $cookies) ->

    $scope.milkcocoaAppId = $cookies.milkcocoaAppId || ''
    $scope.showMilkcocoaAppIdView = false

    $scope.openMilkcocoaAppIdView = ->
      $scope.showMilkcocoaAppIdView = !$scope.showMilkcocoaAppIdView

    $scope.setMilkcocoaAppId = ->
      appId = $("#c-header__overlay__input--milkcocoa").val()
      $cookies.put 'milkcocoaAppId', appId

    return
])
