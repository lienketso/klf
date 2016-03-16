<?php
$assign_list["URL_CSS"] = URL_CSS;
$assign_list["URL_JS"] = URL_JS;
$assign_list["DIALOG"] = DIALOG;
$assign_list["URL_IMAGES"] = URL_IMAGES;
$assign_list["URL_UPLOADS"] = URL_UPLOADS;
$assign_list["ROOT_URL"] = ROOT_URL;
$assign_list["LIB_URL"] = LIB_URL;
$assign_list["mod"] = $mod;
$assign_list["act"] = $act;

//Code lấy ngôn ngữ
if(!$_SESSION["lang"]){
$_SESSION["lang"] = "vn";
}
$lang = isset($_GET["lang"]) ? $_GET["lang"] : $_SESSION["lang"];
$_SESSION["lang"] = $lang;
$assign_list["lang"] = $_SESSION["lang"];
$clsCore = new Core();
$clsMenu = new Menu();
$clsNews = new News();
$clsPage = new Page();
$clsTags = new Tags();
$clsSetting = new Setting();
$clsCategory = new Category();
$clsProduct = new Product();
$clsCatNews = new CatNews();
$clsSupport = new Support();
$clsAdver = new Adver();

$trang = $clsPage->getAll("is_online = 1");
$assign_list["trang"] = $trang;

$quangcao = $clsAdver->getAll("is_online=1");
$assign_list["quangcao"] = $quangcao;

//support
$support = $clsSupport->getAll("is_online=1 AND lang_code='$lang'");
$assign_list["support"] = $support;

//slider
$clsSlide = new Slide();
$slide = $clsSlide->getAll("is_online=1 AND lang_code='$lang' ORDER BY is_order ASC");
$assign_list["slide"] = $slide;
$nhomtintt = $clsCatNews->getAtHome();
$assign_list["nhomtintt"] = $nhomtintt;
//category home
$catehome = $clsCategory->getAllCategory();
$assign_list["catehome"] = $catehome;

	$cateright = $clsCategory->getAll("at_home=1 AND lang_code='$lang' ORDER BY is_order DESC");
	foreach($cateright as $key => $val){
		$category_id = $val["category_id"];
		$cond ="category_id IN(".$category_id;
		$arrCategory = $clsCategory->getAll("parent=".$category_id);
		if(is_array($arrCategory)){
		foreach($arrCategory as $k=>$v){
		$cond.=",".$v["category_id"];
		}}
		$cond.=")";
	    $arr = $clsProduct->getAll($cond." AND is_online=1 ORDER BY date DESC LIMIT 0,6");
		$cateright[$key]['listp'] = (is_array($arr) && count($arr)>0)? $arr : 0;
	}
	//print_r($cateright);
	$assign_list["cateright"] = $cateright;
	
	$tamlinh = $clsCategory->getAll("is_hot=1 AND lang_code='$lang' ORDER BY is_order DESC");
	foreach($tamlinh as $key => $val){
		$category_id = $val["category_id"];
		$cond ="category_id IN(".$category_id;
		$arrCategory = $clsCategory->getAll("parent=".$category_id);
		if(is_array($arrCategory)){
		foreach($arrCategory as $k=>$v){
		$cond.=",".$v["category_id"];
		}}
		$cond.=")";
	    $arr = $clsProduct->getAll($cond." AND is_online=1 ORDER BY date DESC LIMIT 0,10");
		$tamlinh[$key]['listl'] = (is_array($arr) && count($arr)>0)? $arr : 0;
	}
	//print_r($cateright);
	$assign_list["tamlinh"] = $tamlinh;


//news home


$tags_chinh = $clsTags->getAll("at_home=1 ORDER BY is_order ASC");
$setting = $clsSetting->getRow("setting_id=1");
$menu = $clsMenu->getAllMenuLink();
//print_r($menu);
$page = $clsPage->getMin("title,cat_name,intro,content,image,is_order,date","is_online=1");
$assign_list["page"] = $page;
$assign_list["menu"] = $menu;
$assign_list["clsCore"] = $clsCore;
$assign_list["setting"] = $setting;
$assign_list["tags_chinh"] = $tags_chinh;
//print_r($nhomsanpham);
$clsProduct = new Product();
$assign_list["category"] = $category;
$sanphammoi = $clsProduct->getAll("at_home=1 ORDER BY is_order ASC LIMIT 0,4");
$assign_list["sanphammoi"] = $sanphammoi;

$noibat = $clsNews->getAll("at_home=1");
$assign_list["noibat"] = $noibat;

$nhomtintt = $clsCatNews->getAll("is_hot=1 AND lang_code='$lang'");
$assign_list["nhomtintt"] = $nhomtintt;

?>