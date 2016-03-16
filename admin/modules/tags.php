<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Tags();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY is_order ASC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("tags_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_order = $_POST[$v["tags_id"]."_is_order"];
	$at_home = $_POST[$v["tags_id"]."_at_home"];
	$clsMod->updateOne($v["tags_id"],"is_order=$is_order, at_home='$at_home'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['tags_id']] =='on'){
		$clsMod->deleteOne($val['tags_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;

$clsMod = new Tags();

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;

$name = isset($_POST["name"]) ? $_POST["name"] : "";
$cat_name = isset($_POST["cat_name"]) ? $_POST["cat_name"] : "";
$is_order = isset($_POST["is_order"]) ? $_POST["is_order"] : "";
$at_home = isset($_POST["at_home"]) ? $_POST["at_home"] : "";
if($cat_name==""){
$cat_name = slug($name);
}
//$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("tags_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){

$set = "name='$name', cat_name='$cat_name', is_order='$is_order', at_home='$at_home'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "name, cat_name, is_order, at_home";
$value = "'$name', '$cat_name', '$is_order', '$at_home'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod");
}
}
                           ////
						           ////
							//////////////////
							//////////////////
						           ///
								   ////  
								   ////
								   ////
								   ////
								   ////
								   ////
?>