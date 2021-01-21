<?php
$data= json_decode(file_get_contents("php://input"));
// var_dump($data);
require_once "../../classes/database.php";
$table_name=$data[0]->table_name;
$pk_value=$data[0]->pk_value;
switch($table_name){
  case "category":
    require_once "model.category.php";
    $objCategory=new modelCategory();
    $objCategory->setCategoryTitle($pk_value);
    $objCategory->deleteCategory();
  break;
  case "subcategory":
    require_once "model.subcategory.php";
    $objSubcategory=new modelSubcategory();
    $objSubcategory->setSubcategoryTitle($pk_value);
    $objSubcategory->deleteSubcategory();
  break;
  case "destination":
    require_once "model.destination.php";
    $objDestination=new modelDestination();
    $objDestination->setDestinationId($pk_value);
    $objDestination->deleteDestination();
  break;
  case "arrangement":
    require_once "model.arrangement.php";
    $objArrangement=new modelArrangement();
    $objArrangement->setArrangementId($pk_value);
    $objArrangement->deleteArrangement();
  break;
  case "contact":
    require_once "model.contact.php";
    $objContact=new modelContact();
    $objContact->setContactId($pk_value);
    $objContact->deleteContact();
  break;
  case "guides":
    require_once "model.guides.php";
    $objGuide=new modelGuide();
    $objGuide->setGuideId($pk_value);
    $objGuide->deleteGuide();
  break;
  case "blog_post":
    require_once "model.blog.php";
    $objPost=new modelPost();
    $objPost->setPostId($pk_value);
    $objPost->deletePost();
  break;
}
?>