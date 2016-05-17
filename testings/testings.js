var app = angular.module('testApp',[])
  app.controller("testController", function($scope, $http, $window){

    //Function for index
    window.onload = function(){
      $http.get("http://192.168.199.165:3000/testings")
      .then(function(response){
        $scope.showme = false;
        $scope.showedit = false;
        $scope.shownew = false;
        $scope.createError = false;
        $scope.updateError = false;
        $scope.testings = response.data.testings;
      });
    }

    //Function to show a record
    $scope.show = function(id){
      $http.get("http://192.168.199.165:3000/testings/"+id+"/edit")
      .then(function(response){
          $scope.showedit = false;
          $scope.shownew = false;
          $scope.showme = true;
         $scope.testing = response.data.testing
        //alert("Title: "+ response.data.testing.title+"\n"+"Description: "+response.data.testing.description)
        // $window.location.href = "/home/sahu/Desktop/sahu/AngularJS/testings/show.html";
      });
    }

    //Function to create new record form
    $scope.newForm = function(){
      $http.get("http://192.168.199.165:3000/testings/new")
      .then(function(response){
        $scope.showme = false;
        $scope.showedit = false;
        $scope.shownew = true;
        $scope.newTesting = response.data.testing
      });
    }

    //Function to create new record
    $scope.addTest = function(test){
      $http.post("http://192.168.199.165:3000/testings",test)
      .then(function(response){
        if(response.data.success){
          alert("Record created successfully....");
          $scope.newTesting = {};
          $scope.testings = response.data.testings;
        }else{
          $scope.createError = true;
          alert("Recode not created ... have some errors");
          $scope.title_errors = response.data.testing_errors.title;
          $scope.description_errors = response.data.testing_errors.description;
        }
      });
    }
    //Function to edit test
    $scope.edit = function(id){
      $http.get("http://192.168.199.165:3000/testings/"+id)
      .then(function(response){
          $scope.showme = false;
          $scope.shownew = false;
          $scope.showedit = true;
         $scope.updateTesting = response.data.testing
      });
    }

    //Function to update a record
    $scope.updateTest = function(testing){
      $http.patch("http://192.168.199.165:3000/testings/"+testing.id,testing)
      .then(function(response){
        if(response.data.success){
          alert("Record Updated successfully");
          $scope.testings = response.data.testings;
          $scope.updateTesting = {};
        }else{
          $scope.updateError = true;
          alert("Recode not created ... have some errors");
          $scope.title_errors = response.data.testing_errors.title;
          $scope.description_errors = response.data.testing_errors.description;
        }
      });
    }



    //Function to delete a record
    $scope.delete1 = function(id){
      if ($window.confirm("Are you sure want to delete?")){
        $http.delete("http://192.168.199.165:3000/testings/"+id)
        .then(function(response){
          alert("Record deleted successfully");
            $scope.testings = response.data.testings
      });
     }
    }

  });
