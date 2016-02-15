angular.module('milcotaker').directive('cInput', [ ->
    return {
      restrict: 'A'
      scope: {}
      templateUrl: 'app/template/component/input.html'
      controller: 'InputController'
    }
])
