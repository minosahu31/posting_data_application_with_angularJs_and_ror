var app = angular.module('studentApp',['ngRoute']);

  app.config(['$routeProvider', function($routeProvider){
    $routeProvider.

      when('/showStudent/:student_id',{
        templateUrl: 'templates/show.htm',
        controller: 'studentsController'
      }).

      when('/newStudent',{
        templateUrl: 'templates/new.htm',
        controller: 'studentsController'
      }).

      when('/editStudent/:student_id',{
        templateUrl: 'templates/edit.htm',
        controller: 'studentsController'
      }).

      otherwise({
        redirect_to: '/showStudent'
      });
  }]);

  app.controller("studentsController", function($scope, $http, $window, $routeParams){

    // Function for students data
    window.onload = function(){
      $http.get("http://192.168.199.165:3000/students")
      .then(function(response){
        $scope.students = response.data.students;
      });
    }

    //function to show student
    $scope.showStudent = function(id){
      $http.get("http://192.168.199.165:3000/students/"+id)
      .then(function(response){
        $scope.student = response.data.student;
      });
    }

    // Function for new student
    $scope.newStudent = function(){
      $http.get("http://192.168.199.165:3000/students/new")
      .then(function(response){
        $scope.student = response.data.student;
      });
    }

    // Function to add student
    $scope.addStudent = function(student){
      $http.post("http://192.168.199.165:3000/students",student)
      .then(function(response){
        alert("Record created successfully....");
        $scope.students = response.data.students;
        });
    }

    // Function to edit student
    $scope.editStudent = function(id){
        $http.get("http://192.168.199.165:3000/students/"+id+"/edit")
        .then(function(response){
          $scope.student = response.data.student;
        });
    }

    //Update student
    $scope.updateStudent = function(student){
      $http.patch("http://192.168.199.165:3000/students/"+student.id,student)
      .then(function(response){
        alert("Record updated successfully");
        $scope.students = response.data.students;
      });
    }

    // destroy student
    $scope.deleteStudent = function(id){
      if ($window.confirm("Are you sure want to delete?")){
        $http.delete("http://192.168.199.165:3000/students/"+id)
        .then(function(response){
          alert("Record deleted successfully");
          $scope.students = response.data.students;
        });
      }
    }

  });
