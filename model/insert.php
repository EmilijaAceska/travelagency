<?php
$data=json_decode(file_get_contents("php://input"));
var_dump($data);
require_once "../classes/database.php";
$table_name=$data[0]->table_name;
switch($table_name){
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
    $objContact->insertContact();
  break;
 
  
}
?>