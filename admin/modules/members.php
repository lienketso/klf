<?php

function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Members();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY member_id ASC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("member_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_online = $_POST[$v["member_id"]."_is_online"];
	$clsMod->updateOne($v["member_id"],"is_online=$is_online");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['member_id']] =='on'){
		$clsMod->deleteOne($val['member_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;

$clsMod = new Members();

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;
$name = isset($_POST["name"]) ? $_POST["name"] : "";
$address = isset($_POST["address"]) ? $_POST["address"] : "";
$email = isset($_POST["email"]) ? $_POST["email"] : "";
$phone = isset($_POST["phone"]) ? $_POST["phone"] : "";
$info = isset($_POST["info"]) ? $_POST["info"] : "";
$image = isset($_POST["image"]) ? $_POST["image"] : "";
$username = isset($_POST["username"]) ? $_POST["username"] : "";
$password = isset($_POST["password"]) ? $_POST["password"] : "";
$repassword = isset($_POST["repassword"]) ? $_POST["repassword"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("member_id='$id'");
}

//UPDATE
if($btnSave=="save" && $id!=""){
if($password==$repassword && $password!="" && $username!=""){
$password = md5($password);
$set = "name='$name', address='$address', email='$email', phone='$phone', info='$info', image='$image', username='$username', password='$password', lang_code='$lang'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
else{
$assign_list["note"] = "<div class='note'>Thông tin điền lỗi</div>";
}
}
//SAVE
if($btnSave=="save" && $id==""){
	if(!$_POST["name"] || !$_POST["address"]){
	$assign_list["loi"] = "<div class='loi'>Bạn chưa nhập thông tin</div>";
	}
	else{
$list = "name, address, email, phone, info, image, username, password, is_online, lang_code";
$value = "'$name', '$address', '$email', '$phone', '$info', '$image', '$username', '$password', '$is_online', '$lang'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod");
	}
}
}
function logout(){
setcookie("members","on",time()-3600);
header("location: ".ADMIN_URL);
}

?>