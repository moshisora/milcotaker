angular.module('milcotaker').directive('cInput', [ ->
    return {
      restrict: 'A'
      scope: {
        name: '='
        message: '='
        isSelf: '='
      }
      templateUrl: 'app/template/component/input.html'
      controller: 'InputController'
    }
])
