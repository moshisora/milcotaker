angular.module('milcotaker').directive('cInputSelf', [ ->
    return {
      restrict: 'A'
      scope: {
        name: '='
        message: '='
      }
      templateUrl: 'app/template/component/input-self.html'
      controller: 'InputSelfController'
    }
])
