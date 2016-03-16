<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Adver();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY adver_id ASC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("adver_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_online = $_POST[$v["adver_id"]."_is_online"];
    $is_order = $_POST[$v["adver_id"]."_is_order"];
	$clsMod->updateOne($v["adver_id"],"is_online='$is_online', is_order='$is_order'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['adver_id']] =='on'){
		$clsMod->deleteOne($val['adver_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;

$clsMod = new Adver();

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;

$title = isset($_POST["title"]) ? $_POST["title"] : "";
$image = isset($_POST["image"]) ? $_POST["image"] : "";
$is_order = isset($_POST["is_order"]) ? $_POST["is_order"] : "";
$link = isset($_POST["link"]) ? $_POST["link"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
$at_home = isset($_POST["at_home"]) ? $_POST["at_home"] : "";
$vitri = isset($_POST["vitri"]) ? $_POST["vitri"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("adver_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "title='$title', image='$image', is_order='$is_order', link='$link', is_online='$is_online', at_home='$at_home', vitri='$vitri'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "title, image, is_order, link, is_online, at_home, vitri";
$value = "'$title', '$image', '$is_order', '$link', '$is_online', '$at_home', '$vitri'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod");
}
}
  
?>