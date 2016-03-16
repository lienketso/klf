<?php
// DEFINE DUONG DAN
define("ROOT_DIR", $_SERVER['DOCUMENT_ROOT'].trim(dirname(" ".dirname(" ".$_SERVER['SCRIPT_NAME']))));
define("ROOT_URL", "http://".$_SERVER['HTTP_HOST'].trim(dirname(" ".dirname(" ".$_SERVER['SCRIPT_NAME']))));
define("ADMIN_DIR", $_SERVER['DOCUMENT_ROOT'].trim(dirname(" ".$_SERVER['SCRIPT_NAME'])));
define("ADMIN_URL", "http://".$_SERVER['HTTP_HOST'].trim(dirname(" ".$_SERVER['SCRIPT_NAME'])));
define("LIB_DIR", ROOT_DIR."/lib");
define("CONFIG_DIR", ROOT_DIR."/config");
define("MODULE_DIR", ADMIN_DIR."/modules");
define("URL_CSS", ADMIN_URL."/html/css");
define("URL_JS", ADMIN_URL."/html/js");
define("URL_IMAGES", ADMIN_URL."/html/images");
define("URL_UPLOADS", ROOT_URL."/uploads");
define("UPLOAD_DIR", ROOT_DIR."/uploads");
define("DIALOG", ROOT_URL."/dialog");
//KHỞI ĐỘNG SMARTY
require_once(LIB_DIR.'/smarty/Smarty.class.php');
$smarty = new Smarty;
$smarty->template_dir = ADMIN_DIR.'/html/';  // template folder
$smarty->compile_dir = ROOT_DIR.'/cache/admin/'; // template cache
//KET NOI DATABASE
require_once(CONFIG_DIR."/config.php");
if(isset($_GET['lang'])){
 $lang= $_GET['lang'];
}else{
 $lang='vn';
}
//NẠP CÁC CLASS VÀ FUNCTION
function filesInDir($tdir)
{
        $dirs = scandir($tdir);
        foreach($dirs as $file)
        {
                if (($file == '.')||($file == '..'))
                {
                }
                elseif (is_dir($tdir.'/'.$file))
                {
                        filesInDir($tdir.'/'.$file);
                }
                else
                {
                        require_once($tdir.'/'.$file);
                }
        }
}
filesInDir(LIB_DIR."/basic");
filesInDir(LIB_DIR."/class");
$fp=fopen(ROOT_DIR."/key.txt",r)or exit("khong tim thay file can mo");
while(!feof($fp))
{
$key = fgets($fp);
}
fclose($fp);
?>