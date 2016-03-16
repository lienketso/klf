<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Cart();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY cart_id DESC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("cart_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_online = $_POST[$v["cart_id"]."_is_online"];
	$clsMod->updateOne($v["cart_id"],"is_online='$is_online'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['cart_id']] =='on'){
		$clsMod->deleteOne($val['cart_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;
$clsProduct = new Product();
$clsMod = new Cart();

$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;
$recond = $clsMod->getRow("cart_id='$id'");
if($id!=""){
$assign_list["recond"] = $recond;
}
$cart = unserialize($recond['sp']);
$tonggia=0;
if(is_array($cart)){
foreach($cart as $k=>$v){
$tonggia = $tonggia + $v*($clsProduct->fiel($k,'price'));
}
}
//UPDATE
$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
if($btnSave=="save" && $id!=""){
$set = "is_online='$is_online'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
$assign_list["tonggia"] = $tonggia;
$assign_list["cart"] = $cart; 
$assign_list["clsProduct"] = $clsProduct;
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