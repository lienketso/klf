<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsCatNews = new CatNews();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond=" WHERE lang_code='$lang' ORDER BY cat_id DESC LIMIT $start,$limit";
$cat_id= isset($_GET["cat_id"]) ? $_GET["cat_id"] : "";
if($cat_id!=""){
$cond=" WHERE parent=$cat_id AND lang_code='$lang'";
}

$recond = $clsCatNews->getCond($cond);
$total = count($clsCatNews->getAll("lang_code='$lang'"));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&lang=$lang&");
//assign
$assign_list["recond"] = $recond;
$assign_list["cat_id"] = $cat_id;
$assign_list["clsCatNews"] = $clsCatNews;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$parent = $_POST[$v["cat_id"]."_parent"];
	$is_order = $_POST[$v["cat_id"]."_is_order"];
	$is_online = $_POST[$v["cat_id"]."_is_online"];
	$at_home = $_POST[$v["cat_id"]."_at_home"];
	$clsCatNews->updateOne($v["cat_id"],"parent='$parent', is_order='$is_order', is_online='$is_online', at_home='$at_home'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['cat_id']] =='on'){
		$clsCatNews->deleteOne($val['cat_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
 }
}

function add(){
global $assign_list,$lang,$mod;
$clsCatNews = new CatNews();
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
$intro = isset($_POST["intro"])? $_POST["intro"] : "";
$is_order = isset($_POST["is_order"])? $_POST["is_order"] : "";
$is_hot = isset($_POST["is_hot"])? $_POST["is_hot"] : "";
$image = isset($_POST["image"])? $_POST["image"] : "";
$at_home = isset($_POST["at_home"])? $_POST["at_home"] : "";
$is_online = isset($_POST["is_online"])? $_POST["is_online"] : "";
$meta_des = isset($_POST["meta_des"])? $_POST["meta_des"] : "";
$meta_key = isset($_POST["meta_key"])? $_POST["meta_key"] : "";
if($id!=""){
$assign_list["catnews"] = $clsCatNews->getRow("cat_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "name='$name', cat_name='$cat_name', parent='$parent', intro='$intro', is_hot='$is_hot', at_home='$at_home', is_online='$is_online', is_order='$is_order', image='$image', meta_des='$meta_des', meta_key='$meta_key', lang_code='$lang'";
$clsCatNews->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "name, cat_name, parent, intro, is_order, is_hot, at_home, is_online, image, meta_des, meta_key, lang_code";
$value = "'$name', '$cat_name', '$parent', '$intro', '$is_order', '$is_hot', '$at_home', '$is_online', '$image', '$meta_des', '$meta_key', '$lang'";
$clsCatNews->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}

//assign
$assign_list["clsCatNews"] = $clsCatNews;
}

?>