<?php
class modelPost extends DB{
  private $post_id=-1;
  private $post_title="";
  private $post_text="";
  private $post_img="";
  private $table_name="blog_post";
  private $columns_name="post_title,post_text,post_img";

  //SET-GET
  public function setPostId($post_id){
    $this->post_id=$post_id;
  }
  public function getPostId(){
    return $this->post_id;
  }

  public function setPostTitle($post_title){
    $this->post_title=$post_title;
  }
  public function getPostTitle(){
    return $this->post_title;
  }

  public function setPostText($post_text){
    $this->post_text=$post_text;
  }
  public function getPostText(){
    return $this->post_text;
  }

  public function setPostImg($post_img){
    $this->post_img=$post_img;
  }
  public function getPostImg(){
    return $this->post_img;
  }

  //SELECT
  public function selectPost(){
    return parent::selectRow($this->table_name);
    // return parent::callStoredProcedureSelect('_selectBlogPost');
  }
  //INSERT
  public function insertPost(){
    $columns_value="'$this->post_title','$this->post_text','$this->post_img'";
    parent::insertRow($this->table_name,$this->columns_name,$columns_value);
    // parent::callStoredProcedureInsert('_insertBlogPost',$columns_value);
  }
  // //DELETE
  public function deletePost(){
        parent::deleteRow($this->table_name,"post_id",$this->post_id);
  }
  //UPDATE
  public function updatePost(){
    $columns="post_title='$this->post_title',post_text='$this->post_text',post_img='$this->post_img'";
    $condition="post_id='$this->post_id'";
    parent::updateRow($this->table_name,$columns,$condition);
  }
}
?>