<?php
require_once "../classes/database.php";
$table_name=$_GET["table_name"];
$data=array();
switch($table_name){
  case "category":
    require_once "model.category.php";
    $objCategory=new modelCategory();
    $result=$objCategory->selectCategory();
    // var_dump($result);
    foreach($result as $row){
      $data["records"][]=array("category_title"=>$row["category_title"]);
    }
  break;
  case "subcategory":
    require_once "model.subcategory.php";
    $objSubcategory=new modelSubcategory();
    $result=$objSubcategory->selectSubcategory();
    // var_dump($result);
    foreach($result as $row){
      $data["records"][]=array("subcategory_title"=>$row["subcategory_title"]);
    }
  break;
  case "destination":
    require_once "model.destination.php";
    $objDestination=new modelDestination();
    $result=$objDestination->selectDestination();
    // var_dump($result);
    foreach($result as $row){
      $data["records"][]=array("destination_id"=>$row["destination_id"],"destination_name"=>$row["destination_name"],
      "destination_desc"=>$row["destination_desc"],"destination_img"=>$row["destination_img"],
      "subcategory_title"=>$row["subcategory_title"],"category_title"=>$row["category_title"]);
  }
  break;
  case "arrangement":
    require_once "model.arrangement.php";
    $objArrangement=new modelArrangement();
    $result=$objArrangement->selectArrangement();
    // var_dump($result);
    foreach($result as $row){
      $data["records"][]=array("arrangement_id"=>$row["arrangement_id"],"arrangement_title"=>$row["arrangement_title"],
      "arrangement_description"=>$row["arrangement_description"],"accommodation_type"=>$row["accommodation_type"],
      "room_type"=>$row["room_type"],"check_in"=>$row["check_in"],"check_out"=>$row["check_out"],"price"=>$row["price"],
      "transport_type"=>$row["transport_type"],"accommodation_img"=>$row["accommodation_img"],
      "destination_id"=>$row["destination_id"],"destination_name"=>$row["destination_name"],"destination_desc"=>$row["destination_desc"],
      "destination_img"=>$row["destination_img"],"guide_id"=>$row["guide_id"],"first_name"=>$row["first_name"],"last_name"=>$row["last_name"],
      "spoken_language"=>$row["spoken_language"]);
  }
  break;
  case "contact":
    require_once "model.contact.php";
    $objContact= new modelContact();
    $result=$objContact->selectContact();
    // var_dump($result);
    foreach($result as $row){
      $data["records"][]=array("contact_id"=>$row["contact_id"],"first_name"=>$row["first_name"],"last_name"=>$row["last_name"],
            "email"=>$row["email"],"phone"=>$row["phone"],"message"=>$row["message"]);    
  }
  break;
  case "guides":
    require_once "model.guides.php";
    $objGuide= new modelGuide();
    $result=$objGuide->selectGuide();
    // var_dump($result);
    foreach($result as $row){
      $data["records"][]=array("guide_id"=>$row["guide_id"],"first_name"=>$row["first_name"],"last_name"=>$row["last_name"],
            "spoken_language"=>$row["spoken_language"],"guide_img"=>$row["guide_img"]);    
  }
  break;
  case "blog_post":
    require_once "model.blog.php";
    $objPost= new modelPost();
    $result=$objPost->selectPost();
    // var_dump($result);
    foreach($result as $row){
      $data["records"][]=array("post_id"=>$row["post_id"],"post_title"=>$row["post_title"],"post_text"=>$row["post_text"],
            "post_img"=>$row["post_img"]);    
  }
  break;
}
echo json_encode($data);
?>