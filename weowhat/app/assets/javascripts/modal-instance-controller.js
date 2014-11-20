app.controller('ModalInstanceController', function ($scope, $modalInstance, $http, items) {
  $scope.event_id = items;

  $http.get("/event_users/"+ $scope.event_id +".json").success(function(data){
    $scope.members = data;
    $scope.payer = $scope.members;
  });

  $scope.newPayment = {};

  $scope.ok = function () {
    $scope.newPayment.currency_id = 1;
    $scope.newPayment.event_id = $scope.event_id;
    console.log($scope.newPayment);
    $modalInstance.close($scope.newPayment);
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };

});
