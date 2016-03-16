<?php
session_start(); 
require_once("global.php");
require_once(ROOT_DIR."/lib/rewrite.php");
date_default_timezone_set('Asia/Ho_Chi_Minh');
$mod = isset($_GET["mod"])? $_GET["mod"] : "home";
$act = isset($_GET["act"])? $_GET["act"] : "home";
require_once '_assign.php';
require_once(MODULE_DIR."/".$mod.".php");
$act();
$smarty->assign($assign_list);

$smarty->display("index.tpl");

$dbconn->Close();
unset($assign_list, $dbconn, $smarty);
?>