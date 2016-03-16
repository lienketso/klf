<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Category();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond=" WHERE lang_code='$lang' ORDER BY category_id DESC LIMIT $start,$limit";
$cat_id= isset($_GET["category_id"]) ? $_GET["category_id"] : "";
if($cat_id!=""){
$cond=" WHERE parent=$category_id AND lang_code='$lang'";
}

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getAll("lang_code='$lang'"));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&lang=$lang&");
//assign
$assign_list["recond"] = $recond;
$assign_list["category_id"] = $cat_id;
$assign_list["clsMod"] = $clsMod;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$parent = $_POST[$v["category_id"]."_parent"];
	$is_order = $_POST[$v["category_id"]."_is_order"];
	$is_online = $_POST[$v["category_id"]."_is_online"];
	$clsMod->updateOne($v["category_id"],"parent='$parent', is_order='$is_order', is_online='$is_online' , at_home='$at_home'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['category_id']] =='on'){
		$clsMod->deleteOne($val['category_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
 }
}

function add(){
global $assign_list,$lang,$mod;
$clsMod = new Category();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$name = isset($_POST["name"])? $_POST["name"] : "";
$cat_name = isset($_POST["cat_name"])? $_POST["cat_name"] : "";
if($cat_name==""){
	 $cat_name = slug($name);
	}
$parent = isset($_POST["parent"])? $_POST["parent"] : "";
$factory = isset($_POST["factory"])? $_POST["factory"] : "";
$is_order = isset($_POST["is_order"])? $_POST["is_order"] : "";
$is_hot = isset($_POST["is_hot"])? $_POST["is_hot"] : "";
$at_home = isset($_POST["at_home"])? $_POST["at_home"] : "";
$at_home1 = isset($_POST["at_home1"])? $_POST["at_home1"] : "";
$at_home2 = isset($_POST["at_home2"])? $_POST["at_home2"] : "";
$at_home3 = isset($_POST["at_home3"])? $_POST["at_home3"] : "";
$image = isset($_POST["image"])? $_POST["image"] : "";
$is_online = isset($_POST["is_online"])? $_POST["is_online"] : "";
$meta_des = isset($_POST["meta_des"])? $_POST["meta_des"] : "";
$meta_key = isset($_POST["meta_key"])? $_POST["meta_key"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("category_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "name='$name', cat_name='$cat_name', factory='$factory', parent='$parent', is_online='$is_online', is_order='$is_order', image='$image', meta_des='$meta_des', meta_key='$meta_key', is_hot='$is_hot', at_home='$at_home', at_home1='$at_home1', at_home2='$at_home2', at_home3='$at_home3', lang_code='$lang'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "name, cat_name, factory, parent, is_order, is_online, image, meta_des, meta_key, is_hot, at_home, at_home1, at_home2, at_home3, lang_code";
$value = "'$name', '$cat_name', '$factory', '$parent', '$is_order', '$is_online', '$image', '$meta_des', '$meta_key', '$is_hot', '$at_home', '$at_home1', '$at_home2', '$at_home3', '$lang'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}

//assign
$assign_list["clsMod"] = $clsMod;
}

?>