app.config(function($routeProvider, $locationProvider){
  $routeProvider.when('/event/:id',{
    controller: 'EventController',
    templateUrl: '/static/index.html'
  })
});