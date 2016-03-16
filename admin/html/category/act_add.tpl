<script language='javascript'>
function save(){
	document.theForm.btnSave.value= "save"
	document.theForm.submit();
}
$(document).ready(function(){
	$(".cc").hide();
  $("#show").click(function(){
    $(".cc").show();
  });
  $("#hide").click(function(){
    $(".cc").hide();
  });
});
</script>
<div class="thanhtonghop">
     <div class="quantrong"><img src="{$URL_IMAGES}/14.png" /></div>
       <div class="t1">Quản lý Nhóm tin : </div> 
       <div class="thanhxuly">
        <div class="t1"> 
        <a href="#" {if $cat_id==''} style="color:#F00" {/if}>Thêm nhóm tour</a>
        </div>
        <div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancel</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
       
       
</div>      
       </div>
<form name="theForm" action="" method="post">
<input type="hidden" name="btnSave" id="btnSave" value="">
            <table class="bang" cellpadding="0" cellspacing="0">
            <tr class="tr_add">
            <td colspan="2">Mời bạn điền vào các thông tin dưới đây</td>
            </tr>
             <tr>
            <td width="18%">Tên nhóm tour(<font color="#FF0000">*</font>)</td>
            <td width="82%"><input type="text" name="name" style="width:200px" value="{$recond.name}" maxlength="255" /></td>
            </tr>
             <tr>
            <td width="18%">Cat-name</td>
            <td width="82%"><input type="text" name="cat_name" style="width:200px" value="{$recond.cat_name}" maxlength="255" /></td>
            </tr>
            <!--
            <tr>
            <td width="18%">Hãng sản xuất</td>
            <td width="82%"><input type="text" name="factory" style="width:200px" value="{$recond.factory}" maxlength="255" /></td>
            </tr>
            -->
             <tr>
            <td width="18%">Nhóm cha</td>
            <td width="82%">
            <select name="parent" class="select_thuong">
            <option value="0">- - -</option>
           {$clsMod->option(0, 1, 4, $recond.parent)}
            </select>
            </td>
            </tr>
            <tr>
            <td width="18%">Thứ tự</td>
            <td width="82%">
            <input type="text" name="is_order" size="10" value="{$recond.is_order}" />
            </td>
            </tr>
            <tr>
            <td width="18%">Ảnh đại diện</td>
            <td width="82%">
            <input type="text" name="image" id="image" style="width:200px" value="{$recond.image}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
             <tr>
            <td width="18%">Hot?</td>
            <td width="82%">
            <select name="is_hot">
              {$clsCore->yes_no($recond.is_hot)}
            </select>
            </td>
            </tr>
             <tr>
            <td width="18%">Trang chủ ?</td>
            <td width="82%">
            <select name="at_home">
              {$clsCore->yes_no(1,$recond.at_home)}
            </select>
            </td>
            </tr>
            <tr>
            <td width="18%">Trang chủ 1?</td>
            <td width="82%">
            <select name="at_home1">
              {$clsCore->yes_no(1,$recond.at_home1)}
            </select>
            </td>
            </tr>
             <tr>
            <td width="18%">Trang chủ 2?</td>
            <td width="82%">
            <select name="at_home2">
              {$clsCore->yes_no(1,$recond.at_home2)}
            </select>
            </td>
            </tr>
             <tr>
            <td width="18%">Trang chủ 3?</td>
            <td width="82%">
            <select name="at_home3">
              {$clsCore->yes_no(1,$recond.at_home3)}
            </select>
            </td>
            </tr>
            
             <tr>
            <td width="18%">Hiện?</td>
            <td width="82%">
            <select name="is_online">
              {$clsCore->yes_no(1,$recond.is_online)}
            </select>
            </td>
            </tr>
            <tr>
            <td colspan="2"><font color="#FF0000"><b>Phần quản trị nâng cao dành cho Seoer</b></font> <a href="javascript:void(0)" id="hide">Ẩn</a>/
<a href="javascript:void(0)" id="show">Hiện</a></td>
            </tr>
            </table>
            <div class="cc">
            <table class="bang" cellpadding="0" cellspacing="0">
             <tr>
            <td>Meta description</td>
            <td><textarea id="em1" name="meta_des" rows="2" cols="80" style="width: 50%">{$recond.meta_des}</textarea></td>
            </tr>
             <tr>
            <td>Meta keywords</td>
            <td><textarea id="em2" name="meta_key" rows="2" cols="80" style="width: 50%">{$recond.meta_key}</textarea></td>
            </tr>
             <!--<tr>
            <td width="18%">Mô tả</td>
            <td width="82%"><textarea id="editor1" name="intro">{$catnews.intro}</textarea></td>
            </tr>-->
            </table>
            </div>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancel</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>