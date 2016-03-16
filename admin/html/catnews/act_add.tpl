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
        <a href="#" {if $cat_id==''} style="color:#F00" {/if}>Thêm nhóm tin</a>
        </div>
        <div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
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
            <td width="18%">Tên nhóm tin(<font color="#FF0000">*</font>)</td>
            <td width="82%"><input type="text" name="name" style="width:200px" value="{$catnews.name}" maxlength="255" /></td>
            </tr>
           
             <tr>
            <td width="18%">Cat-name</td>
            <td width="82%"><input type="text" name="cat_name" style="width:200px" value="{$catnews.cat_name}" maxlength="255" /></td>
            </tr>
             <tr>
            <td width="18%">Menu cha</td>
            <td width="82%">
            <select name="parent" class="select_thuong">
            <option value="0">- - -</option>
           {$clsCatNews->option(0, 1, 4, $catnews.parent)}
            </select>
            </td>
            </tr>
            <tr>
            <td width="18%">Thứ tự</td>
            <td width="82%">
            <input type="text" name="is_order" size="10" value="{$catnews.is_order}" />
            </td>
            </tr>
            <tr>
            <td width="18%">Ảnh đại diện</td>
            <td width="82%">
            <input type="text" name="image" id="image" style="width:200px" value="{$catnews.image}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
             <tr>
            <td width="18%">Hot?</td>
            <td width="82%">
            <select name="is_hot">
              {$clsCore->yes_no(1,$catnews.is_hot)}
            </select>
            </td>
            </tr>
             <tr>
            <td width="18%">Trang chủ?</td>
            <td width="82%">
            <select name="at_home">
              {$clsCore->yes_no(1,$catnews.at_home)}
            </select>
            </td>
            </tr>
             <tr>
            <td width="18%">Hiện?</td>
            <td width="82%">
            <select name="is_online">
              {$clsCore->yes_no(1,$catnews.is_online)}
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
            <td><textarea id="em1" name="meta_des" rows="2" cols="80" style="width: 50%">{$catnews.meta_des}</textarea></td>
            </tr>
             <tr>
            <td>Meta keywords</td>
            <td><textarea id="em2" name="meta_key" rows="2" cols="80" style="width: 50%">{$catnews.meta_key}</textarea></td>
            </tr>
             <tr>
            <td width="18%">Mô tả</td>
            <td width="82%"><textarea id="editor1" name="intro">{$catnews.intro}</textarea></td>
            </tr>
            </table>
            </div>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>