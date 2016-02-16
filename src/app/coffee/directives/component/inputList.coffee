angular.module('milcotaker').directive('cInputList', [ ->
    return {
      restrict: 'A'
      scope: {}
      templateUrl: 'app/template/component/input-list.html'
      controller: 'InputListController'
    }
])
