angular.module('milcotaker').directive('cMain', [ ->
    return {
      restrict: 'A'
      scope: {}
      templateUrl: 'app/template/component/main.html'
      controller: 'MainController'
    }
])
