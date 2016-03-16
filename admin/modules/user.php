<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new User();
$clsCatNews = new CatNews();
$assign_list["clsCatNews"] = $clsCatNews;
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY user_id ASC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("user_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_online = $_POST[$v["user_id"]."_is_online"];
	$person = $_POST[$v["user_id"]."_person"];
	$clsMod->updateOne($v["user_id"],"is_online=$is_online, person='$person'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['user_id']] =='on'){
		$clsMod->deleteOne($val['user_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;
$clsCatNews = new CatNews();
$assign_list["clsCatNews"] = $clsCatNews;
$clsMod = new User();

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;

$username = isset($_POST["username"]) ? $_POST["username"] : "";
$password = isset($_POST["password"]) ? $_POST["password"] : "";
$repassword = isset($_POST["repassword"]) ? $_POST["repassword"] : "";
$email = isset($_POST["email"]) ? $_POST["email"] : "";
$phone = isset($_POST["phone"]) ? $_POST["phone"] : "";
$address = isset($_POST["address"]) ? $_POST["address"] : "";
$person = isset($_POST["person"]) ? $_POST["person"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("user_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
if($password==$repassword && $password!="" && $username!=""){
$password = md5($password);
$set = "username='$username', password='$password', email='$email', phone='$phone', address='$address', person='$person', is_online='$is_online'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
else{
$assign_list["note"] = "<div class='note'>Mời bạn nhập đủ thông tin !</div>";
}
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "username, password, email, phone, address, person, is_online";
$value = "'$username', '$password', '$email', '$phone', '$address', '$person', '$is_online'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod");
}
}
function logout(){
setcookie("user","on",time()-3600);
header("location: ".ADMIN_URL);
}
                                   
?>