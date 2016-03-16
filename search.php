<?php
global $assign_list, $lang, $clsCore;
function search(){
$clsProduct = new Product();
$clsCategory = new Category();

$assign_list["mod"] = $mod;
$assign_list["act"] = $act;

$searchfield=array(
0 => '',
1 => 'hanoi',
79 => 'hcm',
48 => 'danang'
);


if($_POST["tinh_thanh"]){
	$danhsach = $clsProduct->getAll("is_online=1 AND LIKE '%$hanoi%'");
	
	}

        
}


?>