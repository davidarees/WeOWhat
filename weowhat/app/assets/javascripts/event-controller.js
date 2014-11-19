app.controller('EventController', ["$scope", "$http", function($scope, $http, $modal) {

  $scope.events = [];
  $scope.newEvent = {};

  // get the list of events for the nav bar
  $http.get("/events.json").success(function(data){
    $scope.events = data;
  })
  
  // On event selection set up the following parts of the event page
  $scope.selectEvent = function(event){
    $scope.selectedEvent = event;
    // get a list of event members
    $http.get("/event_users/"+ event.id +".json").success(function(data){
      $scope.members = data;
    })

    // get a list of event payments
    $http.get("/event_payments/"+ event.id +".json").success(function(data){
      $scope.payments = data;
      var payments_made = 0;

      for( var i = 0 ; i < $scope.payments.length; i++) {
        var users = [];
        $scope.members.filter(function(value, index, ar) {
          if(value.id == $scope.payments[i].user_id) {
            users.push($scope.members[index]) 
          } 
        })
        $scope.payments[i].users = users

        payments_made += $scope.payments[i].amount
      }
      $scope.payments_total = payments_made;
      $scope.event_id = event.id;
    })

    // get the totals each user has paid
    $http.get("/event_payments_by_user/"+ event.id +".json").success(function(data){
      $scope.someData = data;
    })
  }
  // end of event select

  // on update (e.g. payment event) this will rerun the selectedEvent to update the screen. This listens for it.
  $scope.$on("update" , function(event, args) {
    $scope.selectEvent($scope.selectedEvent)
  }); 

  $scope.$on("events_update" , function(event, args) {
      // get the list of events for the nav bar
      $http.get("/events.json").success(function(data){
        $scope.events = data;
        $scope.newEvent={};
    });
  });

  // options used in chartjs
  $scope.someOptions = {
    segementStrokeWidth: 20,
    percentageInnerCutout: 50,
    animateRotate: true
  };

  $http.get('/users_list.json').success(function(data){
    $scope.possible_event_users = [];
    var possible_users = data;
    for( var i = 0 ; i < possible_users.length; i++) {
      var user = {
        name: possible_users[i].name, email: possible_users[i].email, id: possible_users[i].id, ticked: false };
        $scope.possible_event_users.push(user);
      }
    })
  

  //option to clear the selected event to show new event.
  $scope.clearSelectedEvent = function(){
    $scope.selectedEvent = false;
  };

  // on submission of new event if successful emit to event column updater.
  $scope.ok = function () {
    $http.post('/events.json', { newEvent: $scope.newEvent}).success(function(data){
      var user_ids = [];
      angular.forEach( $scope.possible_event_users, function( value, key ) {
        if ( value.ticked === true ) {
          user_ids.push(value.id)
        }
      });
      $http.post('/new_event_users/' + data.id + '.json', {user_ids: user_ids}).success(function(data){
        $scope.newEventForm.$setPristine();
        $scope.$emit("events_update", {});
      });      
    });
  };
}]);
