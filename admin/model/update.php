<?php
$data=json_decode(file_get_contents("php://input"));
var_dump($data);
require_once "../../classes/database.php";
$table_name=$data[0]->table_name;
$pk_value=$data[0]->pk_value;
switch($table_name){
  case "category":
    require_once 'model.category.php';
    $objCategory=new modelCategory();
    $category_title=$data[0]->category_title;
    $objCategory->setCategoryTitle($category_title);
    $objCategory->setCategoryTitle($pk_value);
    $objCategory->updateCategory();
  break;
  case "subcategory":
    require_once 'model.subcategory.php';
    $objSubcategory=new modelSubcategory();
    $subcategory_title=$data[0]->subcategory_title;
    $objSubcategory->setSubcategoryTitle($subcategory_title);
    $objSubcategory->setSubcategoryTitle($pk_value);
    $objSubcategory->updateSubcategory();
  break;
  case "destination":
    require_once "model.destination.php";
    $objDestination= new modelDestination();
    $destination_name=$data[0]->destination_name;
    $destination_desc=$data[0]->destination_desc;
    $destination_img=$data[0]->destination_img;
    $subcategory_title=$data[0]->subcategory_title;
    $category_title=$data[0]->category_title;
    $objDestination->setDestinationName($destination_name);
    $objDestination->setDestinationDesc($destination_desc);
    $objDestination->setDestinationImg($destination_img);
    $objDestination->setSubcategory($subcategory_title);
    $objDestination->setCategory($category_title);
    $objDestination->setDestinationId($pk_value);
    $objDestination->updateDestination();
  break;
  case "arrangement":
    require_once "model.arrangement.php";
    $objArrangement=new modelArrangement();
    $arrangement_title=$data[0]->arrangement_title;
    $arrangement_description=$data[0]->arrangement_description;
    $accommodation_type=$data[0]->accommodation_type;
    $room_type=$data[0]->room_type;
    $check_in=$data[0]->check_in;
    $check_out=$data[0]->check_out;
    $price=$data[0]->price;
    $transport_type=$data[0]->transport_type;
    $accommodation_img=$data[0]->accommodation_img;
    $destination_id=$data[0]->destination_id;
    $guide_id=$data[0]->guide_id;
    $objArrangement->setArrangementTitle($arrangement_title);
    $objArrangement->setArrangementDescription($arrangement_description);
    $objArrangement->setAccommodationType($accommodation_type);
    $objArrangement->setRoomType($room_type);
    $objArrangement->setCheckIn($check_in);
    $objArrangement->setCheckOut($check_out);
    $objArrangement->setPrice($price);
    $objArrangement->setTransportationType($transport_type);
    $objArrangement->setAccomodationImg($accommodation_img);
    $objArrangement->setDestinationId($destination_id);
    $objArrangement->setGuideId($guide_id);
    $objArrangement->setArrangementId($pk_value);
    $objArrangement->updateArrangement();
  break;
  case "contact":
    require_once "model.contact.php";
    $objContact=new modelContact();
    $first_name=$data[0]->first_name;
    $last_name=$data[0]->last_name;
    $email=$data[0]->email;
    $phone=$data[0]->phone;
    $message=$data[0]->message;
    $objContact->setFirstName($first_name);
    $objContact->setLastName($last_name);
    $objContact->setEmail($email);
    $objContact->setPhone($phone);
    $objContact->setMessage($message);
    $objContact->setContactId($pk_value);
    $objContact->updateContact();
  break;
  case "guides":
    require_once "model.guides.php";
    $objGuide=new modelGuide();
    $first_name=$data[0]->first_name;
    $last_name=$data[0]->last_name;
    $spoken_language=$data[0]->spoken_language;
    $guide_img=$data[0]->guide_img;
    $objGuide->setFirstName($first_name);
    $objGuide->setLastName($last_name);
    $objGuide->setLanguage($spoken_language);
    $objGuide->setGuideImg($guide_img);
    $objGuide->setGuideId($pk_value);
    $objGuide->updateGuide();
  break;
  case "blog_post":
    require_once "model.blog.php";
    $objPost=new modelPost();
    $post_title=$data[0]->post_title;
    $post_text=$data[0]->post_text;
    $post_img=$data[0]->post_img;
    $objPost->setPostTitle($post_title);
    $objPost->setPostText($post_text);
    $objPost->setPostImg($post_img);
    $objPost->setPostId($pk_value);
    $objPost->updatePost();
  break;
}
?>