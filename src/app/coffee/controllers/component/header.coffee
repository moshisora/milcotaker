angular.module('milcotaker').controller('HeaderController', [
  '$scope', '$cookies', '$rootScope'
  ($scope, $cookies, $rootScope) ->

    $scope.milkcocoaAppId = $cookies.get('milkcocoaAppId') || ''

    $scope.textFormatBackgroundColor = $cookies.get('textFormatBackgroundColor') || ''
    $scope.textFormatFontColor       = $cookies.get('textFormatFontColor') || ''
    $scope.textFormatFontSize        = $cookies.get('textFormatFontSize') || ''

    $scope.shortcutF1 = $cookies.get('shortcutF1') || ''
    $scope.shortcutF2 = $cookies.get('shortcutF2') || ''
    $scope.shortcutF3 = $cookies.get('shortcutF3') || ''

    closeAllSubViews = ->
      $scope.showMilkcocoaAppIdView    = false
      $scope.showTextFormatSettingView = false
      $scope.showShortcutSettingView   = false
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

    $scope.openShortcutSettingView = ->
      if $scope.showShortcutSettingView
        $scope.showShortcutSettingView = false
      else
        closeAllSubViews()
        $scope.showShortcutSettingView = true if !$scope.showShortcutSettingView

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

    $scope.setShortcutKeys = ->
      $scope.shortcutF1 = $('#c-header__overlay__input__shortcutF1').val()
      $scope.shortcutF2 = $('#c-header__overlay__input__shortcutF2').val()
      $scope.shortcutF3 = $('#c-header__overlay__input__shortcutF3').val()

      $cookies.put 'shortcutF1', $scope.shortcutF1
      $cookies.put 'shortcutF2', $scope.shortcutF2
      $cookies.put 'shortcutF3', $scope.shortcutF3

      $rootScope.$broadcast('updateShortcutKeys')
      $scope.showShortcutSettingView = false

      return

    $scope.saveTakedText = ($event) ->
      text = $('#c-main').text()
      blob = new Blob [text], { type: 'text/plain' }
      $event.target.href = window.URL.createObjectURL(blob)

    return
])
