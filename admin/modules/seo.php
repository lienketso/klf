<?php
function home(){
	global $assign_list,$mod;
	$clsSetting = new Setting();
	$recond = $clsSetting->getRow("setting_id=1");
	$assign_list["recond"] = $recond;
	if($_POST["btnSave"]=="save"){

	$title = isset($_POST["title"]) ? $_POST["title"] : "";
	$phone = isset($_POST["phone"]) ? $_POST["phone"] : "";
	$email = isset($_POST["email"]) ? $_POST["email"] : "";
	
	$keyword = isset($_POST["keyword"]) ? $_POST["keyword"] : "";
	$des = isset($_POST["des"]) ? $_POST["des"] : "";
	
	$google = isset($_POST["google"]) ? $_POST["google"] : "";
	$footer = isset($_POST["footer"]) ? $_POST["footer"] : "";
    $clsSetting->updateOne(1,"title='$title', phone='$phone', email='$email', keyword='$keyword', des='$des', google='$google', footer='$footer'");
	header("location: ".ADMIN_URL."/?mod=$mod");
	}
	

}
?>