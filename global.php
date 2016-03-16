<?php
// DEFINE DUONG DAN
define("ROOT_DIR", $_SERVER['DOCUMENT_ROOT'].trim(dirname(" ".$_SERVER['SCRIPT_NAME'])));
define("ROOT_URL", "http://".$_SERVER['HTTP_HOST'].trim(dirname(" ".$_SERVER['SCRIPT_NAME'])));
define("LIB_DIR", ROOT_DIR."/lib");
define("CONFIG_DIR", ROOT_DIR."/config");
define("MODULE_DIR", ROOT_DIR."/modules");
define("LIB_URL", ROOT_URL."/lib");
define("THEMES_URL",ROOT_URL."/themes/lienketso");
define("THEMES_DIR",ROOT_DIR."/themes/lienketso");

define("URL_CSS",THEMES_URL."/css");
define("URL_JS",THEMES_URL."/js");
define("URL_IMAGES",THEMES_URL."/images");

define("URL_UPLOADS", ROOT_URL."/uploads");
define("UPLOAD_DIR", ROOT_DIR."/uploads");
define("DIALOG", ROOT_URL."/dialog");
//KHỞI ĐỘNG SMARTY
require_once(LIB_DIR.'/smarty/Smarty.class.php');
$smarty = new Smarty;
$smarty->template_dir = THEMES_DIR.'/';  // template folder
$smarty->compile_dir = ROOT_DIR.'/cache/www/'; // template cache
//KET NOI DATABASE
require_once(CONFIG_DIR."/config.php");

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