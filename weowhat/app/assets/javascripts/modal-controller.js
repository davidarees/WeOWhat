app.controller('ModalController' , function ($scope, $modal, $log, $http) {

  $scope.open = function (event_id) {
    console.log("in modal controller")
    var modalInstance = $modal.open({
      templateUrl: '/new-payment-form.html',
      controller: 'ModalInstanceController',
      resolve: {
        items: function () {
          return $scope.event_id;
        }
      }
    });

    modalInstance.result.then(function (payment) {
      $http.post('/payments.json', {payment: payment}).success(function(data){
       console.log(data)
       $scope.$emit("update", {})
     });
    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });
  };
});
