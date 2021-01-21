<?php
class modelGuide extends DB{
  private $guide_id=-1;
  private $first_name="";
  private $last_name="";
  private $spoken_language="";
  private $guide_img="";
  private $table_name="guides";
  private $columns_name="first_name,last_name,spoken_language,guide_img";

  //SET-GET
  public function setGuideId($guide_id){
    $this->guide_id=$guide_id;
  }
  public function getGuideId(){
    return $this->guide_id;
  }

  public function setFirstName($first_name){
    $this->first_name=$first_name;
  }
  public function getFirstName(){
    return $this->first_name;
  }

  public function setLastName($last_name){
    $this->last_name=$last_name;
  }
  public function getLastName(){
    return $this->last_name;
  }

  public function setLanguage($spoken_language){
    $this->spoken_language=$spoken_language;
  }
  public function getLanguage(){
    return $this->spoken_language;
  }

  public function setGuideImg($guide_img){
    $this->guide_img=$guide_img;
  }
  public function getGuideImg(){
    return $this->guide_img;
  }

  //SELECT
  public function selectGuide(){
    return parent::selectRow($this->table_name);
    // return parent::callStoredProcedureSelect('_selectGuides');
  }
  //INSERT
  public function insertGuide(){
    $columns_value="'$this->first_name','$this->last_name','$this->spoken_language','$this->guide_img'";
    parent::insertRow($this->table_name,$this->columns_name,$columns_value);
    // parent::callStoredProcedureInsert('_insertGuides',$columns_value);
  }
  // //DELETE
  public function deleteGuide(){
        parent::deleteRow($this->table_name,"guide_id",$this->guide_id);
  }
  //UPDATE
  public function updateGuide(){
    $columns="first_name='$this->first_name',last_name='$this->last_name',spoken_language='$this->spoken_language',guide_img='$this->guide_img'";
    $condition="guide_id='$this->guide_id'";
    parent::updateRow($this->table_name,$columns,$condition);
  }
}
?>