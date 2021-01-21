<?php
class modelCategory extends DB{
  private $category_title="";
  private $table_name="category";
  private $columns_name="category_title";

  //SET-GET
  public function setCategoryTitle($category_title){
    $this->category_title=$category_title;
  }
  public function getCategoryTitle(){
    return $this->category_title;
  }
  //SELECT
  public function selectCategory(){
    return parent::selectRow($this->table_name);
    // return parent::callStoredProcedureSelect('_selectCategory');
  }
  //INSERT
  public function insertCategory(){
    $columns_value="'$this->category_title'";
    parent::insertRow($this->table_name,$this->columns_name,$columns_value);
    // parent::callStoredProcedureInsert('_insertCategory',$columns_value);
  }
  //DELETE
  public function deleteCategory(){
    parent::deleteRowString($this->table_name,"category_title",$this->category_title);
  }
  //UPDATE
  public function updateCategory(){
    $columns="category_title='$this->category_title'";
    $condition="category_title='$this->category_title'";
    parent::updateRow($this->table_name,$columns,$condition);
  }
}
?>