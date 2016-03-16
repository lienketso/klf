<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Contact();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY contact_id ASC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("contact_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$traloi = $_POST[$v["contact_id"]."_traloi"];
	$clsMod->updateOne($v["contact_id"],"traloi=$traloi");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['contact_id']] =='on'){
		$clsMod->deleteOne($val['contact_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;

$clsMod = new Contact();

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;

$traloi = isset($_POST["traloi"]) ? $_POST["traloi"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("contact_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "traloi='$traloi'";
$clsMod->updateOne($id,$set);
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