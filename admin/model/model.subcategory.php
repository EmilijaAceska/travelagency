<?php
class modelSubcategory extends DB{
  private $subcategory_title="";
  private $table_name="subcategory";
  private $columns_name="subcategory_title";

  //SET-GET
  public function setSubcategoryTitle($subcategory_title){
    $this->subcategory_title=$subcategory_title;
  }
  public function getSubcategoryTitle(){
    return $this->subcategory_title;
  }
  //SELECT
  public function selectSubcategory(){
    return parent::selectRow($this->table_name);
    // return parent::callStoredProcedureSelect('_selectSubcategory');
  }
  //INSERT
  public function insertSubcategory(){
    $columns_value="'$this->subcategory_title'";
    parent::insertRow($this->table_name,$this->columns_name,$columns_value);
    // parent::callStoredProcedureInsert('_insertSubcategory',$columns_value);
  }
  //DELETE
  public function deleteSubcategory(){
    parent::deleteRowString($this->table_name,"subcategory_title",$this->subcategory_title);
    // $pk_value="'$this->subcategory_title'";
    // parent::callStoredProcedureDelete('_deleteSubcategory',$pk_value);
  }
  //UPDATE
  // public function updateSubcategory(){
  //   $columns="subcategory_title='$this->subcategory_title'";
  //   $condition="subcategory_title='$this->subcategory_title'";
  //   parent::updateRow($this->table_name,$columns,$condition);
  // }
}
?>