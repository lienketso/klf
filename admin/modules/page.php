<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Page();
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond="ORDER BY date DESC LIMIT $start,$limit";

$recond = $clsMod->getCond($cond);
$total = count($clsMod->getMin("page_id",$cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
$assign_list["cat_id"] = $cat_id;
$assign_list["clsCatNews"] = $clsCatNews;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$is_online = $_POST[$v["page_id"]."_is_online"];
	$clsMod->updateOne($v["page_id"],"is_online='$is_online'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['page_id']] =='on'){
		$clsMod->deleteOne($val['page_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod");
 }
}

function add(){
global $assign_list,$lang,$mod;

$clsMod = new Page();

$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;

$title = isset($_POST["title"]) ? $_POST["title"] : "";
$cat_name = isset($_POST["cat_name"]) ? $_POST["cat_name"] : "";
if($cat_name==""){
	 $cat_name = slug($title);
	}
//$image = isset($_POST["image"]) ? $_POST["image"] : "";
$intro = isset($_POST["intro"]) ? $_POST["intro"] : "";
$content = isset($_POST["content"]) ? $_POST["content"] : "";
$content = htmlentities($content);
$intro = htmlentities($intro);
$image = isset($_POST["image"]) ? $_POST["image"] : "";
$date = isset($_POST["date"]) ? $_POST["date"] : "";
if($date !=""){$date = date_to_int($date);}else{$date = strtotime("now");}
$meta_des = isset($_POST["meta_des"]) ? $_POST["meta_des"] : "";
$meta_key = isset($_POST["meta_key"]) ? $_POST["meta_key"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
if($id!=""){
$assign_list["page"] = $clsMod->getRow("page_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "title='$title', cat_name='$cat_name', intro='$intro', content='$content', image='$image', is_online='$is_online', date='$date', meta_des='$meta_des', meta_key='$meta_key'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "title, cat_name, intro, content, image, is_online, date, meta_des, meta_key";
$value = "'$title', '$cat_name', '$intro', '$content', '$image', '$is_online', '$date', '$meta_des', '$meta_key'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod");
}

//assign
$assign_list["clsCatNews"] = $clsCatNews;
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