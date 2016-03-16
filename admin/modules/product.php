<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore;
$clsMod = new Product();
$clsCategory = new Category();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond = " WHERE lang_code='$lang'";
$order="ORDER BY product_id DESC LIMIT $start,$limit";
$category_id= isset($_GET["cat_id"]) ? $_GET["cat_id"] : 0;
if($category_id!=0){
$cond=" WHERE category_id=$category_id AND lang_code='$lang'";
}
$recond = $clsMod->getCond($cond.$order);
$total = count($clsMod->getCond($cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&categoty_id=$cat_id&lang=$lang&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
$assign_list["category_id"] = $category_id;
$assign_list["clsCategory"] = $clsCategory;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$category_id = $_POST[$v["product_id"]."_category_id"];
	$is_online = $_POST[$v["product_id"]."_is_online"];
	$is_hot = $_POST[$v["product_id"]."_is_hot"];
	$clsMod->updateOne($v["product_id"],"category_id='$category_id', is_online='$is_online', is_hot='$is_hot'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['product_id']] =='on'){
		$clsMod->deleteOne($val['product_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
 }
}

function add(){
global $assign_list,$lang,$mod;
$clsCategory = new Category();
$clsMod = new Product();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;
$category_id = isset($_POST["category_id"]) ? $_POST["category_id"] : "";
$name = isset($_POST["name"]) ? $_POST["name"] : "";
$tongquan = isset($_POST["tongquan"]) ? $_POST["tongquan"] : "";
$link = isset($_POST["link"]) ? $_POST["link"] : "";
$video = isset($_POST["video"]) ? $_POST["video"] : "";
$masp = isset($_POST["masp"]) ? $_POST["masp"] : "";
$cat_name = isset($_POST["cat_name"]) ? $_POST["cat_name"] : "";
if($cat_name==""){
	 $cat_name = slug($name);
	}
$image = isset($_POST["image"]) ? $_POST["image"] : "";
$image_1 = isset($_POST["image_1"]) ? $_POST["image_1"] : "";
$image_2 = isset($_POST["image_2"]) ? $_POST["image_2"] : "";
$image_3 = isset($_POST["image_3"]) ? $_POST["image_3"] : "";
$image_4 = isset($_POST["image_4"]) ? $_POST["image_4"] : "";
$image_5 = isset($_POST["image_5"]) ? $_POST["image_5"] : "";
$image_6 = isset($_POST["image_6"]) ? $_POST["image_6"] : "";
$image_7 = isset($_POST["image_7"]) ? $_POST["image_7"] : "";
$image_8 = isset($_POST["image_8"]) ? $_POST["image_8"] : "";
$content = isset($_POST["content"]) ? $_POST["content"] : "";
$noibat = isset($_POST["noibat"]) ? $_POST["noibat"] : "";
$content = htmlentities($content);
$noibat = htmlentities($noibat);
$date = isset($_POST["date"]) ? $_POST["date"] : "";
if($date !=""){$date = date_to_int($date);}else{$date = strtotime("now");}

$is_hot = isset($_POST["is_hot"]) ? $_POST["is_hot"] : "";
$at_home = isset($_POST["at_home"]) ? $_POST["at_home"] : "";
$at_home1 = isset($_POST["at_home1"]) ? $_POST["at_home1"] : "";
$best = isset($_POST["best"]) ? $_POST["best"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
$price = isset($_POST["price"]) ? $_POST["price"] : "";
$dis_price = isset($_POST["dis_price"]) ? $_POST["dis_price"] : "";
$tags = isset($_POST["tags"]) ? $_POST["tags"] : "";
$cat_tags = slug2($tags);
$meta_des = isset($_POST["meta_des"]) ? $_POST["meta_des"] : "";
$meta_key = isset($_POST["meta_key"]) ? $_POST["meta_key"] : "";
if($id!=""){
$assign_list["recond"] = $clsMod->getRow("product_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "category_id='$category_id', name='$name', tongquan='$tongquan', link='$link', video='$video', masp='$masp', cat_name='$cat_name', image='$image', content='$content', noibat='$noibat', is_hot='$is_hot', at_home='$at_home', at_home1='$at_home1', best='$best', is_online='$is_online', date='$date', tags='$tags', cat_tags='$cat_tags', meta_des='$meta_des', meta_key='$meta_key', price='$price', dis_price='$dis_price', image_1='$image_1', image_2='$image_2', image_3='$image_3', image_4='$image_4', image_5='$image_5', image_6='$image_6', image_7='$image_7', image_8='$image_8', lang_code='$lang'";
$clsMod->updateOne($id,$set);
//echo $set;
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "category_id, name, tongquan, link, video, masp, cat_name, image, content, noibat, is_hot, at_home, at_home1, best, is_online, date, tags, cat_tags, meta_des, meta_key, price, dis_price, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, lang_code";
$value = "'$category_id', '$name', '$tongquan', '$link', '$video', '$masp', '$cat_name', '$image', '$content', '$noibat', '$is_hot', '$at_home', '$at_home1', '$best', '$is_online', '$date', '$tags', '$cat_tags', '$meta_des', '$meta_key', '$price', '$dis_price', '$image_1', '$image_2', '$image_3', '$image_4', '$image_5', '$image_6', '$image_7', '$image_8', '$lang'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}

//assign
$assign_list["clsCategory"] = $clsCategory;
}

?>