<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Lop();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY is_order ASC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("class_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_online = $_POST[$v["class_id"]."_is_online"];
    $is_order = $_POST[$v["class_id"]."_is_order"];
	$clsMod->updateOne($v["class_id"],"is_online=$is_online, is_order='$is_order'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['class_id']] =='on'){
		$clsMod->deleteOne($val['class_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;

$clsMod = new Lop();

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;

$name = isset($_POST["name"]) ? $_POST["name"] : "";
$lichhoc = isset($_POST["lichhoc"]) ? $_POST["lichhoc"] : "";
$start = isset($_POST["start"]) ? $_POST["start"] : "";
$content = isset($_POST["content"]) ? $_POST["content"] : "";
$content = htmlentities($content);
if($start !=""){$start = date_to_int($start);}else{$start = strtotime("now");}
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
$is_order = isset($_POST["is_order"]) ? $_POST["is_order"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("class_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "name='$name', start='$start', content='$content', is_order='$is_order', is_online='$is_online', lichhoc='$lichhoc'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "name, start, content, is_order, is_online, lichhoc";
$value = "'$name', '$start', '$content', '$is_order', '$is_online', '$lichhoc'";
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