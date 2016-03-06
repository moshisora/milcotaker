angular.module('milcotaker').controller('HeaderController', [
  '$scope', '$cookies'
  ($scope, $cookies) ->

    $scope.milkcocoaAppId = $cookies.get('milkcocoaAppId') || ''

    closeAllSubViews = ->
      $scope.showMilkcocoaAppIdView    = false
      $scope.showTextFormatSettingView = false
    closeAllSubViews()

    $scope.openMilkcocoaAppIdView = ->
      if $scope.showMilkcocoaAppIdView
        $scope.showMilkcocoaAppIdView = false
      else
        closeAllSubViews()
        $scope.showMilkcocoaAppIdView = true if !$scope.showMilkcocoaAppIdView

    $scope.openTextFormatSettingView = ->
      if $scope.showTextFormatSettingView
        $scope.showTextFormatSettingView = false
      else
        closeAllSubViews()
        $scope.showTextFormatSettingView = true if !$scope.showTextFormatSettingView

    $scope.setMilkcocoaAppId = ->
      appId = $("#c-header__overlay__input--milkcocoa").val()
      $cookies.put 'milkcocoaAppId', appId
      window.location.reload()

    $scope.setTextFormat = ->
      console.log 'set text format'
      mainView = $('#c-main')

      backgroundColor = $('#c-header__overlay__input--background-color').val()
      fontColor       = $('#c-header__overlay__input--color').val()
      fontSize        = $('#c-header__overlay__input--font-size').val()

      mainView.css('backgroundColor', '#' + backgroundColor)
      mainView.css('color', '#' + fontColor)
      mainView.css('font-size', fontSize + 'px')
      return

    $scope.saveTakedText = ($event) ->
      text = $('#c-main').text()
      blob = new Blob [text], { type: 'text/plain' }
      $event.target.href = window.URL.createObjectURL(blob)

    return
])
