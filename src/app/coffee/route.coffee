angular.module('milcotaker').config([
  '$routeProvider', '$locationProvider'
  ($routeProvider, $locationProvider) ->

    $locationProvider.html5Mode {
      enabled: true
      requireBase: false
    }

    $routeProvider
      .when('/', {
        templateUrl: 'app/template/page/root.html'
        controller: 'RootController'
        controllerAs: 'root'
      })
      .otherwise({
        redirectTo: '/'
      })
])
