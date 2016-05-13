var testingCenter = angular.module('TestingCenter', ['ngResource']);

testingCenter.factory("Testing", function($resource) {
  return $resource("testings/:id", { id: '@id' }, {
    index: { method: 'GET', isArray: true, responseType: 'json' },
  });
});

testingCenter.controller("testingsController", function($scope, Testing){
  $scope.testings = Testing.index()
  // $scope.testings.push(testing)
  // $scope.newTesting = {}

});
