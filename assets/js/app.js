var app = angular.module('myApp', ["ngRoute"]);
app.controller('myCtrl', function($scope,$http,$routeParams) {
  $scope.successAlert=false;
  $scope.successfullAlert=false;
  $scope.dangerAlert=false;
  $scope.infoAlert=false;
  $scope.deleteAlert=true;
  $scope.getId=0;
  $scope.checkUrl=$routeParams.id;

  //functions - post
  function postJSON(dataObject){
    $http(
        {
            method: "post",
            url: 'model/insert.php',
            data: dataObject,
            headers: { 'Content-Type':
            'application/x-www-form-urlencoded' }
        }
    );
    }
    function postUpdateJSON(dataObject){
    $http(
        {
            method: "post",
            url: 'model/update.php',
            data: dataObject,
            headers: { 'Content-Type':
            'application/x-www-form-urlencoded' }
        }
    );
    }
    function postJSONDelete(dataObject){
      $http(
          {
              method: "post",
              url: 'model/delete.php',
              data: dataObject,
              headers: { 'Content-Type':
              'application/x-www-form-urlencoded' }
          }
      );
      window.location.reload();
    }
  //JSON - SELECT
  //SELECT CATEGORY
  $scope.category=[];
  $http.get("model/select.php?table_name=category")
  .then(function (response){
  $scope.category=response.data.records;
  });//end category

  //SELECT SUBCATEGORY
  $scope.subcategory=[];
  $http.get("model/select.php?table_name=subcategory")
  .then(function (response){
  $scope.subcategory=response.data.records;
  });//end subcategory

  //SELECT DESTINATION
  $scope.destination=[];
  $http.get("model/select.php?table_name=destination")
  .then(function (response){
  $scope.destination=response.data.records;
  });//end destination

  //SELECT ARRANGEMENT
  $scope.arrangement=[];
  $http.get("model/select.php?table_name=arrangement")
  .then(function (response){
  $scope.arrangement=response.data.records;
  });//end arrangement

  //SELECT CONTACT
  $scope.contact=[];
  $http.get("model/select.php?table_name=contact")
  .then(function (response){
  $scope.contact=response.data.records;
  });//end contact

   //SELECT GUIDES
  $scope.guides=[];
  $http.get("model/select.php?table_name=guides")
  .then(function (response){
  $scope.guides=response.data.records;
  });//end guides

   //SELECT BLOG POST
  $scope.blog_post=[];
  $http.get("model/select.php?table_name=blog_post")
  .then(function (response){
  $scope.blog_post=response.data.records;
  });//end blog_post

  //FUNCTIONS - INSERT
  
  //FUNCTION-INSERT-CONTACT
  $scope.function_contact_form=function(first_name,last_name,email,phone,message,pk_value){
    var contactJson=[{"first_name":first_name,"last_name":last_name,"email":email,"phone":phone,"message":message, "pk_value":pk_value, "table_name":"contact"}];
    console.log(contactJson);
    postJSON(contactJson);
    $scope.successAlert=true;
    $scope.dangerAlert=false;
  }//END INSERT CONTACT

  

  //FUNCTION ERROR
  $scope.function_error=function(){
    $scope.successAlert=false;
    $scope.dangerAlert=true;
    $scope.infoAlert=false;
    //console.log("error");
  }

  //GET ID
  $scope.function_getId = function(pk_value){
  $scope.getId=pk_value;
  $scope.infoAlert=false;
  // console.log("GET ID " + pk_value);
  }

});