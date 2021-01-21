app.config(function($routeProvider) {
  $routeProvider
  .when("/main", {
    templateUrl : "view/main.html",
    controller:"myCtrl"
  })
  .when("/arrangement", {
    templateUrl : "view/arrangement.html",
    controller:"myCtrl"
  })
  .when("/arrangement/:id", {
    templateUrl : "view/arrangement.html",
    controller:"myCtrl"
  })
  .when("/contact_form", {
    templateUrl : "view/contact_form.html",
    controller:"myCtrl"
  })
  .when("/guides", {
    templateUrl : "view/guides.html",
    controller:"myCtrl"
  })
  .when("/blog", {
    templateUrl : "view/blog.html",
    controller:"myCtrl"
  })
  .when("/single_blog", {
    templateUrl : "view/single_blog.html",
    controller:"myCtrl"
  })
   .when("/single_blog/:id", {
    templateUrl : "view/single_blog.html",
    controller:"myCtrl"
  })
  .otherwise("/main", {
    templateUrl: "view/main.html",
    controller:"myCtrl"
  });
});