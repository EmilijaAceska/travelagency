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
    window.location.reload()
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
  //FUNCTION-INSERT-CATEGORY
  $scope.function_category_form=function(category_title,pk_value,action){
    //console.log($scope.category[keys].category_title+" ");
    var find=0;
    angular.forEach($scope.category, function(value,keys){
      if($scope.category[keys].category_title == category_title){
        find=1;
        $scope.infoAlert=true;
        console.log($scope.category[keys].category_title+" ");
      }
    });
    if(find==0){
      var categoryJson=[{"category_title":category_title, "table_name":"category", "action":action}];
      console.log(categoryJson);
      postJSON(categoryJson);
      $scope.dangerAlert=false;
      $scope.successAlert=true;
      $scope.infoAlert=false;
    }
    
  }//END INSERT CATEGORY

  //FUNCTION-INSERT-SUBCATEGORY
  $scope.function_subcategory_form=function(subcategory_title,pk_value,action){
    //console.log($scope.subcategory[keys].subcategory_title+" ");
    var find=0;
    angular.forEach($scope.subcategory, function(value,keys){
      if($scope.subcategory[keys].subcategory_title == subcategory_title){
        find=1;
        $scope.infoAlert=true;
        console.log($scope.subcategory[keys].subcategory_title+" ");
      }
    });
    if(find==0){
      var subcategoryJson=[{"subcategory_title":subcategory_title, "table_name":"subcategory", "action":action}];
      console.log(subcategoryJson);
      postJSON(subcategoryJson);
      $scope.dangerAlert=false;
      $scope.successAlert=true;
      $scope.infoAlert=false;
    }
    
  }//END INSERT SUBCATEGORY 

  //FUNCTION-INSERT-DESTINATION
  $scope.function_destination_form=function(destination_name,destination_desc,destination_img,subcategory_title,category_title,pk_value,action){
    var find=0;
    angular.forEach($scope.destination, function(value,keys){
      if($scope.destination[keys].destination_name == destination_name){
        find=1;
        $scope.infoAlert=true;
        $scope.successfullAlert=false;
        console.log($scope.destination[keys].destination_name+" ");
      } 
    });
    if(find==0){
      var destionationJson=[{"destination_name":destination_name,"destination_desc":destination_desc,"destination_img":destination_img,"subcategory_title":subcategory_title,"category_title":category_title, "table_name":"destination", "action":action}];
      console.log(destionationJson);
      postJSON(destionationJson);
      $scope.dangerAlert=false;
      $scope.successAlert=true;
      $scope.infoAlert=false;
    }else{
      var destionationJson=[{"destination_name":destination_name,"destination_desc":destination_desc,"destination_img":destination_img,"subcategory_title":subcategory_title,"category_title":category_title, "pk_value":pk_value, "table_name":"destination", "action":action}];
      console.log(destionationJson);
      postUpdateJSON(destionationJson);
      $scope.successfullAlert=true; 
      $scope.infoAlert=false;
    }
  }//END INSERT DESTIONATION

  //FUNCTION-INSERT-ARRANGEMENT
  $scope.function_arrangement_form=function(arrangement_title,arrangement_description,accommodation_type,room_type,check_in,check_out,price,transport_type,accommodation_img,destination_id,guide_id,pk_value,action){
    var arrangementJson=[{"arrangement_title":arrangement_title,"arrangement_description":arrangement_description,"accommodation_type":accommodation_type,"room_type":room_type,
                          "check_in":check_in,"check_out":check_out,"price":price,"transport_type":transport_type,"accommodation_img":accommodation_img,"destination_id":destination_id,
                          "guide_id":guide_id,"pk_value":pk_value, "table_name":"arrangement", "action":action}];
    console.log(arrangementJson);
    if(action=='insert'){
      postJSON(arrangementJson);
      $scope.successAlert=true;
    }else{
      postUpdateJSON(arrangementJson);
      $scope.successfullAlert=true;
    }
    $scope.dangerAlert=false;
  }//END INSERT ARRANGEMENT

  //FUNCTION-INSERT-CONTACT
  $scope.function_contact_form=function(first_name,last_name,email,phone,message,pk_value){
    var contactJson=[{"first_name":first_name,"last_name":last_name,"email":email,"phone":phone,"message":message, "pk_value":pk_value, "table_name":"contact"}];
    console.log(contactJson);
    postJSON(contactJson);
    $scope.successAlert=true;
    $scope.dangerAlert=false;
  }//END INSERT CONTACT

  //FUNCTION-INSERT-GUIDES
  $scope.function_guides_form=function(first_name,last_name,spoken_language,guide_img,pk_value,action){
    var guidesJson=[{"first_name":first_name,"last_name":last_name,"spoken_language":spoken_language,"guide_img":guide_img,"pk_value":pk_value, "table_name":"guides", "action":action}];
    console.log(guidesJson);
    if(action=='insert'){
      postJSON(guidesJson);
      $scope.successAlert=true;
    }else{
      postUpdateJSON(guidesJson);
      $scope.successfullAlert=true;
    }
    $scope.dangerAlert=false;
  }//END INSERT GUIDES

  //FUNCTION-INSERT-TRVAEL BLOG
  $scope.function_blog_form=function(post_title,post_text,post_img,pk_value,action){
    var blogJson=[{"post_title":post_title,"post_text":post_text,"post_img":post_img,"pk_value":pk_value, "table_name":"blog_post", "action":action}];
    console.log(blogJson);
    if(action=='insert'){
      postJSON(blogJson);
      $scope.successAlert=true;
    }else{
      postUpdateJSON(blogJson);
      $scope.successfullAlert=true;
    }
    $scope.dangerAlert=false;
  }//END INSERT BLOG POST

  //FUNCTION ERROR
  $scope.function_error=function(){
    $scope.successAlert=false;
    $scope.dangerAlert=true;
    $scope.infoAlert=false;
    //console.log("error");
  }

  //FUNCTION DELETE
  $scope.function_deleteRow= function(table_name,pk_value){
    $scope.deleteAlert=true;
  var deleteJson=[{"table_name":table_name,"pk_value":pk_value}];
  console.log(deleteJson);
  postJSONDelete(deleteJson);
}//end DELETE

  //FUNCTION DELETE-CATEGORY
  $scope.function_deleteRowCategory= function(pk_value){
    // console.log("deleteRowCategory");
    $scope.deleteAlert=true;
    var find=0;
    angular.forEach($scope.destination, function(value,keys){
      if($scope.destination[keys].category_title == pk_value){
        find = 1;
        $scope.deleteAlert=false;
        $scope.infoAlert=true;
      }
    });
  }//END deleteRowCategory

  //FUNCTION DELETE SUBCATEGORY
  $scope.function_deleteRowSubcategory=function(pk_value){
    //console.log("deleteRowSubcategory");
    $scope.deleteAlert=true;
    var find=0;
    angular.forEach($scope.destination, function(value,keys){
      if($scope.destination[keys].subcategory_title == pk_value){
        find=1;
        $scope.deleteAlert=false;
        $scope.infoAlert=true;
      }
    });
  }//end deleteRowSubcategory

  //FUNCTION DELETE DESTINATION
  $scope.function_deleteRowDestination= function(pk_value){
    // console.log("deleteRowDestination");
    $scope.deleteAlert=true;
    var find=0;
    angular.forEach($scope.arrangement, function(value,keys){
      if($scope.arrangement[keys].destination_id == pk_value){
        find = 1;
        $scope.deleteAlert=false;
        $scope.infoAlert=true;
      }
    });
  }//END deleteRowDestination

  //FUNCTION DELETE-GUIDES
  $scope.function_deleteRowGuides= function(pk_value){
    // console.log("deleteRowGuides");
    $scope.deleteAlert=true;
    var find=0;
    angular.forEach($scope.arrangement, function(value,keys){
      if($scope.arrangement[keys].guide_id == pk_value){
        find = 1;
        $scope.deleteAlert=false;
        $scope.infoAlert=true;
      }
    });
  }//END deleteRowGuides

  //GET ID
  $scope.function_getId = function(pk_value){
  $scope.getId=pk_value;
  $scope.infoAlert=false;
  console.log("GET ID " + pk_value);
  }

});

app.controller('myLogin', function($scope,$http,$routeParams) {
  $scope.logIn = function(admin_name,admin_password){
   
    $scope.administration=[];
    $http.get("model/login.php?admin_name="+admin_name+"&admin_password="+admin_password)
    .then(function(response){
    $scope.administration=response.data.records;
    console.log($scope.administration[0].id);
    
    if($scope.administration[0].id>-1){
      // console.log("found");
      window.location = "http://localhost/agency/admin/main.html";   
    }else{
      window.location = "http://localhost/agency/admin/index.html";
    }
    });
  }
});