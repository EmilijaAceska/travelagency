app.config(function($routeProvider) {
  $routeProvider
  .when("/category", {
    templateUrl : "view/category.html",
    controller:"myCtrl"
  })
  .when("/category_form", {
    templateUrl : "view/category_form.html",
    controller:"myCtrl"
  })
  .when("/subcategory", {
    templateUrl : "view/subcategory.html",
    controller:"myCtrl"
  })
  .when("/subcategory_form", {
    templateUrl : "view/subcategory_form.html",
    controller:"myCtrl"
  })
  .when("/destination", {
    templateUrl : "view/destination.html",
    controller:"myCtrl"
  })
  .when("/destination_form", {
    templateUrl : "view/destination_form.html",
    controller:"myCtrl"
  })
  .when("/destination_form/:id", {
    templateUrl : "view/destination_form.html",
    controller:"myCtrl"
  })
  .when("/arrangement", {
    templateUrl : "view/arrangement.html",
    controller:"myCtrl"
  })
  .when("/arrangement_form", {
    templateUrl : "view/arrangement_form.html",
    controller:"myCtrl"
  })
  .when("/arrangement_form/:id", {
    templateUrl : "view/arrangement_form.html",
    controller:"myCtrl"
  })
  .when("/contact", {
    templateUrl : "view/contact.html",
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
  .when("/guides_form", {
    templateUrl : "view/guides_form.html",
    controller:"myCtrl"
  })
  .when("/guides_form/:id", {
    templateUrl : "view/guides_form.html",
    controller:"myCtrl"
  })
  .when("/blog", {
    templateUrl : "view/blog.html",
    controller:"myCtrl"
  })
  .when("/blog_form", {
    templateUrl : "view/blog_form.html",
    controller:"myCtrl"
  })
  .when("/blog_form/:id", {
    templateUrl : "view/blog_form.html",
    controller:"myCtrl"
  })
  .when("/main", {
    templateUrl : "main.html",
    controller:"myCtrl"
  })
  //za login
  .when("/index", {
    templateUrl : "index.html",
    controller:"myLogin"
  })
  .otherwise("/category", {
    templateUrl: "view/category.html",
    controller:"myCtrl"
  });
});