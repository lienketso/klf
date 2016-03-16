<?php
function home(){
global $assign_list, $lang, $mod, $clsCore;
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$clsCatNews = new CatNews();
$clsMenu = new Menu();
$clsCategory = new Category();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond=" WHERE lang_code='$lang' LIMIT $start,$limit";
$category_id = isset($_GET["category_id"]) ? $_GET["category_id"] : "";
if($category_id!=""){
	$cond="WHERE parent=$category_id AND lang_code='$lang";
	}
$cat_id= isset($_GET["cat_id"]) ? $_GET["cat_id"] : "";
if($cat_id!=""){
$cond=" WHERE parent=$cat_id AND lang_code='$lang";
}
$recond = $clsCategory->getCond($cond);
$total = count($clsCategory->getAll("lang_code='$lang'"));
$recond = $clsMenu->getCond($cond);
$total = count($clsMenu->getAll("lang_code='$lang'"));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//
$assign_list["recond"] = $recond;
$select_cha = $clsMenu->getAllMenuArr();
$select_cha = $clsCategory->getAllCategory();
$assign_list["select_cha"] = $select_cha;
$assign_list["cat_id"] = $cat_id;
$assign_list["clsCatNews"] = $clsCatNews;
$assign_list["clsCategory"] = $clsCategory;
$assign_list["clsMenu"] = $clsMenu;
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$parent = $_POST[$v["menu_id"]."_parent"];
	$cat = $_POST[$v["menu_id"]."_cat_id"];
	$cate = $_POST[$v["menu_id"]."_category_id"];
	$is_order = $_POST[$v["menu_id"]."_is_order"];
	$is_online = $_POST[$v["menu_id"]."_is_online"];
	$clsMenu->updateOne($v["menu_id"],"parent='$parent', cat_id='$cat', category_id='$cate', is_order='$is_order', is_online='$is_online'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['menu_id']] =='on'){
		$clsMenu->deleteOne($val['menu_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
 }
}
function add(){
global $assign_list, $lang, $mod;
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$clsMenu = new Menu();
$clsCatNews = new CatNews();
$clsCategory = new Category();
$select_cha = $clsCategory->getAllCategory();
$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$name = isset($_POST["name"]) ? $_POST["name"] : "";
$parent = isset($_POST["parent"]) ? $_POST["parent"] : "";
$cat_id = isset($_POST["cat_id"]) ? $_POST["cat_id"] : "";
$category_id = isset($_POST["category_id"]) ? $_POST["category_id"] : "";
$link = isset($_POST["link"]) ? $_POST["link"] : "";
$is_order = isset($_POST["is_order"]) ? $_POST["is_order"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
if($id!=""){
$assign_list["menu"] = $clsMenu->getRow("menu_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "name='$name', parent='$parent', is_online='$is_online', is_order='$is_order', cat_id='$cat_id', category_id='$category_id', link='$link'";
$clsMenu->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "name, parent, cat_id, category_id, link, is_order, is_online, lang_code";
$value = "'$name', '$parent', '$cat_id', '$category_id', '$link', '$is_order', '$is_online', '$lang'";
$clsMenu->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
$assign_list["clsMenu"] = $clsMenu;
$assign_list["clsCatNews"] = $clsCatNews;
$assign_list["clsCategory"] = $clsCategory;
}
?>