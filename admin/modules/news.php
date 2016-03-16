<?php
//HOANVV 26/9/2013
function home(){
global $assign_list,$lang,$mod, $clsCore, $dbconn;
$clsMod = new News();
$clsCatNews = new CatNews();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$limit = 12;
$start = $limit*($page-1);
$cond = " WHERE lang_code='$lang'";
$order=" ORDER BY date DESC LIMIT $start,$limit";
$cat_id= isset($_GET["cat_id"]) ? $_GET["cat_id"] : 0;

if($cat_id!=0){
$cond.=" AND cat_id=$cat_id";
}
$recond = $clsMod->getCond($cond.$order);
$total = count($clsMod->getCond($cond));
$assign_list["phantrang"] = $clsCore->phantrang($total, $limit, 5, "?mod=$mod&cat_id=$cat_id&lang=$lang&");
//assign
$assign_list["total"] = $total;
$assign_list["limit"] = $limit;
$assign_list["recond"] = $recond;
$assign_list["cat_id"] = $cat_id;
$assign_list["clsCatNews"] = $clsCatNews;
//Xử lý update
if($_POST["btnSave"]=="save"){
	foreach($recond as $k=>$v){
	$cat_id = $_POST[$v["news_id"]."_cat_id"];
	$is_online = $_POST[$v["news_id"]."_is_online"];
	$is_hot = $_POST[$v["news_id"]."_is_hot"];
	$clsMod->updateOne($v["news_id"],"cat_id='$cat_id', is_online='$is_online', is_hot='$is_hot'");
	}
	header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//Xử lý delete
if($_POST["btnSave"]=="delete"){
    foreach($recond as $key=>$val){
	  if($_POST[$val['news_id']] =='on'){
		$clsMod->deleteOne($val['news_id']);
	  }
	}
    header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
 }
}

function add(){
global $assign_list,$lang,$mod;
$clsCatNews = new CatNews();
$clsMod = new News();
$lang = isset($_GET["lang"]) ? $_GET["lang"] : "vn";
$assign_list["lang"] = $lang;
$btnSave = isset($_POST["btnSave"])? $_POST["btnSave"] : "";
$id = isset($_GET["id"]) ? $_GET["id"] : "";
$assign_list["id"] = $id;
$cat_id = isset($_POST["cat_id"]) ? $_POST["cat_id"] : "";
$title = isset($_POST["title"]) ? $_POST["title"] : "";
$news_name = isset($_POST["news_name"]) ? $_POST["news_name"] : "";
if($news_name==""){
	 $news_name = slug($title);
	}
$image = isset($_POST["image"]) ? $_POST["image"] : "";
$intro = isset($_POST["intro"]) ? $_POST["intro"] : "";
$content = isset($_POST["content"]) ? $_POST["content"] : "";
$content = htmlentities($content);
$intro = htmlentities($intro);
$date = isset($_POST["date"]) ? $_POST["date"] : "";
if($date !=""){$date = date_to_int($date);}else{$date = strtotime("now");}
$is_hot = isset($_POST["is_hot"]) ? $_POST["is_hot"] : "";
$at_home = isset($_POST["at_home"]) ? $_POST["at_home"] : "";
$is_online = isset($_POST["is_online"]) ? $_POST["is_online"] : "";
$tags = isset($_POST["tags"]) ? $_POST["tags"] : "";
$cat_tags = slug2($tags);
$meta_des = isset($_POST["meta_des"]) ? $_POST["meta_des"] : "";
$meta_key = isset($_POST["meta_key"]) ? $_POST["meta_key"] : "";
if($id!=""){
$assign_list["news"] = $clsMod->getRow("news_id='$id'");
}
//UPDATE
if($btnSave=="save" && $id!=""){
$set = "cat_id='$cat_id', title='$title', news_name='$news_name', image='$image', intro='$intro', content='$content', is_hot='$is_hot', at_home='$at_home', is_online='$is_online', date='$date', tags='$tags', cat_tags='$cat_tags', meta_des='$meta_des', meta_key='$meta_key', lang_code='$lang'";
$clsMod->updateOne($id,$set);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}
//SAVE
if($btnSave=="save" && $id==""){
$list = "cat_id, title, news_name, image, intro, content, is_hot, at_home, is_online, date, tags, cat_tags, meta_des, meta_key, lang_code";
$value = "'$cat_id', '$title', '$news_name', '$image', '$intro', '$content', '$is_hot', '$at_home', '$is_online', '$date', '$tags', '$cat_tags', '$meta_des', '$meta_key', '$lang'";
$clsMod->insertOne($list,$value);
header("location: ".ADMIN_URL."/?mod=$mod&lang=$lang");
}

//assign
$assign_list["clsCatNews"] = $clsCatNews;
}
                                  
?>