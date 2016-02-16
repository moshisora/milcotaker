angular.module('milcotaker').directive('cHeader', [ ->
    return {
      restrict: 'A'
      scope: {}
      templateUrl: 'app/template/component/header.html'
      controller: 'HeaderController'
    }
])
