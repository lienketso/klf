<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Slide();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond = " WHERE lang_code='$lang'";
$order=" ORDER BY is_order DESC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond.$order);
$total = count($clsMod->getMin("slide_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&lang=$lang&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_online = $_POST[$v["slide_id"]."_is_online"];
    $is_order = $_POST[$v["slide_id"]."_is_order"];
	$clsMod->updateOne($v["slide_id"],"is_online=$is_online, is_order='$is_order'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['slide_id']] =='on'){
		$clsMod->deleteOne($val['slide_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
 }
}

function add(){
global $assign_list,$lang,$mod;

$clsMod = new Slide();

$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;

$title = isset($_POST["title"]) ? $_POST["title"] : "";
$image = isset($_POST["image"]) ? $_POST["image"] : "";
$is_order = isset($_POST["is_order"]) ? $_POST["is_order"] : "";
$link = isset($_POST["link"]) ? $_POST["link"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("slide_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "title='$title', image='$image', is_order='$is_order', link='$link', is_online='$is_online', lang_code='$lang'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "title, image, is_order, link, is_online, lang_code";
$value = "'$title', '$image', '$is_order', '$link', '$is_online', '$lang'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
}
                                   
?>