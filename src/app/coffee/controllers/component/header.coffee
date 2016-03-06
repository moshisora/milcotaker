angular.module('milcotaker').controller('HeaderController', [
  '$scope', '$cookies'
  ($scope, $cookies) ->

    $scope.milkcocoaAppId = $cookies.get('milkcocoaAppId') || ''

    closeAllSubViews = ->
      $scope.showMilkcocoaAppIdView    = false
      $scope.showTextFormatSettingView = false
    closeAllSubViews()

    $scope.openMilkcocoaAppIdView = ->
      closeAllSubViews()
      $scope.showMilkcocoaAppIdView = !$scope.showMilkcocoaAppIdView

    $scope.openTextFormatSettingView = ->
      closeAllSubViews()
      $scope.showTextFormatSettingView = !$scope.showTextFormatSettingView

    $scope.setMilkcocoaAppId = ->
      appId = $("#c-header__overlay__input--milkcocoa").val()
      $cookies.put 'milkcocoaAppId', appId
      window.location.reload()

    $scope.setTextFormat = ->
      console.log 'set text format'

    $scope.saveTakedText = ($event) ->
      text = $('#c-main').text()
      blob = new Blob [text], { type: 'text/plain' }
      $event.target.href = window.URL.createObjectURL(blob)

    return
])
