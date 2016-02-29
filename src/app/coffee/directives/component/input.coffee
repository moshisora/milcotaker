angular.module('milcotaker').directive('cInput', [ ->
    return {
      restrict: 'A'
      scope: {
        name: '='
        message: '='
      }
      templateUrl: 'app/template/component/input.html'
      controller: 'InputController'
    }
])
