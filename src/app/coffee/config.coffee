angular.module('milcotaker').config([
  '$logProvider', '$compileProvider'
  ($logProvider, $compileProvider) ->

    $compileProvider.debugInfoEnabled(false)
    $logProvider.debugEnabled(false)
])
