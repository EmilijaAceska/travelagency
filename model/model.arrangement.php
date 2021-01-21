<?php
class modelArrangement extends DB{
  private $arrangement_id=-1;
  private $arrangement_description="";
  private $accommodation_type="";
  private $room_type="";
  private $check_in="";
  private $check_out="";
  private $price=-1;
  private $transport_type="";
  private $accommodation_img="";
  private $destination_id=-1;
  private $guide_id=-1;
  private $table_name="arrangement";
  private $columns_name="arrangement_description,accommodation_type,room_type,
                        check_in,check_out,price,transport_type,accommodation_img,
                        destination_id,guide_id";

  public function setArrangementId($arrangement_id){
    $this->arrangement_id=$arrangement_id;
  }
  public function getArrangementId(){
    return $this->arrangement_id;
  }
  public function setArrangementDescription($arrangement_description){
    $this->arrangement_description=$arrangement_description;
  }
  public function getArrangementDescription(){
    return $this->arrangement_description;
  }
  public function setAccommodationType($accommodation_type){
    $this->accommodation_type=$accommodation_type;
  }
  public function getAccommodationType(){
    return $this->accommodation_type;
  }
  public function setRoomType($room_type){
    $this->room_type=$room_type;
  }
  public function getRoomType(){
    return $this->room_type;
  }
  public function setCheckIn($check_in){
    $this->check_in=$check_in;
  }
  public function getCheckIn(){
    return $this->check_in;
  }
  public function setCheckOut($check_out){
    $this->check_out=$check_out;
  }
  public function getCheckOut(){
    return $this->check_out;
  }
  public function setPrice($price){
    $this->price=$price;
  }
  public function getPrice(){
    return $this->price;
  }
  public function setTransportationType($transport_type){
    $this->transport_type=$transport_type;
  }
  public function getTransoprtationType(){
    return $this->transport_type;
  }
  public function setAccomodationImg($accommodation_img){
    $this->accommodation_img=$accommodation_img;
  }
  public function getAcommodationImg(){
    return $this->accommodation_img;
  }
  public function setDestinationId($destination_id){
    $this->destination_id=$destination_id;
  }
  public function getDestinationId(){
    return $this->destination_id;
  }
  public function setGuideId($guide_id){
    $this->guide_id=$guide_id;
  }
  public function getGuideId(){
    return $this->guide_id;
  }
  
  //INSERT
  public function insertArrangement(){
    $columns_value="'$this->arrangement_description','$this->accommodation_type','$this->room_type','$this->check_in',
                    '$this->check_in',$this->price,'$this->transport_type','$this->accommodation_img',$this->destination_id,
                    $this->guide_id";
    parent::insertRow($this->table_name,$this->columns_name,$columns_value);
    // parent::callStoredProcedureInsert('_insertArrangement',$columns_value);
  }

  //SELECT
  public function selectArrangement(){
    return parent::selectRow($this->table_name." INNER JOIN destination ON arrangement.destination_id=destination.destination_id
                                                INNER JOIN guides ON arrangement.guide_id=guides.guide_id");
    // return parent::callStoredProcedureSelect('_selectArrangement');
  }
  
  //DELETE
  public function deleteArrangement(){
        parent::deleteRow($this->table_name,"arrangement_id",$this->arrangement_id);
  }

  //UPDATE
  public function updateArrangement(){
    $columns="arrangement_description='$this->arrangement_description',accommodation_type='$this->accommodation_type',
                  room_type='$this->room_type',check_in='$this->check_in',check_out='$this->check_out',price=$this->price,
                  transport_type='$this->transport_type',accommodation_img='$this->accommodation_img',destination_id=$this->destination_id,
                  guide_id=$this->guide_id";
    $condition="arrangement_id='$this->arrangement_id'";
    parent::updateRow($this->table_name,$columns,$condition);
  }
}
?>