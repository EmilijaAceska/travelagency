<?php
class modelDestination extends DB{
  private $destination_id=-1;
  private $destination_name="";
  private $destination_desc="";
  private $destination_img="";
  private $subcategory_title="";
  private $category_title="";
  private $table_name="destination";
  private $columns_name="destination_name,destination_desc,destination_img,subcategory_title,category_title";

  public function setDestinationId($destination_id){
    $this->destination_id=$destination_id;
  }
  public function getDestinationId(){
    return $this->destination_id;
  }
  public function setDestinationName($destination_name){
    $this->destination_name=$destination_name;
  }
  public function getDestinationName(){
    return $this->destination_name;
  }
  public function setDestinationDesc($destination_desc){
    $this->destination_desc=$destination_desc;
  }
  public function getDestinationDesc(){
    return $this->destination_desc;
  }
  public function setDestinationImg($destination_img){
    $this->destination_img=$destination_img;
  }
  public function getDestinationImg(){
    return $this->destination_img;
  }
  public function setSubcategory($subcategory_title){
    $this->subcategory_title=$subcategory_title;
  }
  public function getSubcategory(){
    return $this->subcategory_title;
  }
  public function setCategory($category_title){
    $this->category_title=$category_title;
  }
  public function getCategory(){
    return $this->category_title;
  }

  //INSERT
  public function insertDestination(){
    $columns_value="'$this->destination_name','$this->destination_desc','$this->destination_img',
                    '$this->subcategory_title','$this->category_title'";
    parent::insertRow($this->table_name,$this->columns_name,$columns_value);
    // parent::callStoredProcedureInsert('_insertDestination',$columns_value);
  }
  //SELECT
  public function selectDestination(){
    return parent::selectRow($this->table_name." INNER JOIN category ON destination.category_title=category.category_title
                                    INNER JOIN subcategory ON destination.subcategory_title=subcategory.subcategory_title");
    // return parent::callStoredProcedureSelect('_selectDestination');
  }
  
  //DELETE
  public function deleteDestination(){
        parent::deleteRow($this->table_name,"destination_id",$this->destination_id);
  }

  //UPDATE
  public function updateDestination(){
    $columns="destination_name='$this->destination_name',destination_desc='$this->destination_desc',destination_img='$this->destination_img',
                  subcategory_title='$this->subcategory_title',category_title='$this->category_title'";
    $condition="destination_id='$this->destination_id'";
    parent::updateRow($this->table_name,$columns,$condition);
  }
}
?>