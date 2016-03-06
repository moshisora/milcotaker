angular.module('milcotaker').controller('HeaderController', [
  '$scope', '$cookies'
  ($scope, $cookies) ->

    $scope.milkcocoaAppId = $cookies.get('milkcocoaAppId') || ''

    $scope.textFormatBackgroundColor = $cookies.get('textFormatBackgroundColor') || ''
    $scope.textFormatFontColor       = $cookies.get('textFormatFontColor') || ''
    $scope.textFormatFontSize        = $cookies.get('textFormatFontSize') || ''

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
      mainView = $('#c-main')

      $scope.textFormatBackgroundColor = $('#c-header__overlay__input--background-color').val()
      $scope.textFormatFontColor       = $('#c-header__overlay__input--color').val()
      $scope.textFormatFontSize        = $('#c-header__overlay__input--font-size').val()

      mainView.css('backgroundColor', '#' + $scope.textFormatBackgroundColor)
      mainView.css('color', '#' + $scope.textFormatFontColor)
      mainView.css('font-size', $scope.textFormatFontSize + 'px')

      $cookies.put 'textFormatBackgroundColor', $scope.textFormatBackgroundColor
      $cookies.put 'textFormatFontColor', $scope.textFormatFontColor
      $cookies.put 'textFormatFontSize', $scope.textFormatFontSize

      $scope.showTextFormatSettingView = false

      return

    $scope.saveTakedText = ($event) ->
      text = $('#c-main').text()
      blob = new Blob [text], { type: 'text/plain' }
      $event.target.href = window.URL.createObjectURL(blob)

    return
])
