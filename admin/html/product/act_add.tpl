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
     <div class="quantrong"><img src="{$URL_IMAGES}/nhomtin.png" /></div>
       <div class="t1">Quản lý dịch vụ </div> 
       <div class="thanhxuly">
        <div class="t1"> 
        <a href="#" {if $cat_id==''} style="color:#F00" {/if}>Thêm dịch vụ</a>
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
            <td width="18%">Danh mục dịch vụ </td>
            <td width="82%">
            <select name="category_id" class="select_thuong">
           {$clsCategory->option(0, 1, 4, $recond.category_id)}
            </select>
            </td>
            </tr>
             <tr>
            <td>Tên dịch vụ(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="name" style="width:400px" value="{$recond.name}" maxlength="255" /></td>
            <tr>
            <td>Thời gian(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="masp" style="width:400px" value="{$recond.masp}" maxlength="255" /></td>
 
            <tr>
            <td>Giá</td>
            <td><input type="text" name="price" style="width:400px" value="{$recond.price}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Giá khuyến mại</td>
            <td><input type="text" name="dis_price" style="width:400px" value="{$recond.dis_price}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Mô tả dịch vụ</td>
            <td><textarea id="" name="tongquan" rows="5" cols="80" style="width: 100%">{$clsCore->Decode($recond.tongquan)}</textarea></td>
            </tr>
            
             <tr>
            <td>Lịch trình(<font color="#FF0000">*</font>)</td>
            <td><textarea id="editor1" name="noibat" rows="5" cols="80" style="width: 100%">{$clsCore->Decode($recond.noibat)}</textarea></td>
            </tr>
            
            <tr>
            <td>Lịch trình(<font color="#FF0000">*</font>)</td>
            <td><textarea id="editor2" name="content" rows="5" cols="80" style="width: 100%">{$clsCore->Decode($recond.content)}</textarea></td>
            </tr>
            
             <tr>
            <td>Bảng giá & Chính sách (<font color="#FF0000">*</font>)</td>
            <td><textarea id="editor3" name="video" rows="5" cols="80" style="width: 100%">{$clsCore->Decode($recond.video)}</textarea></td>
            </tr>
            
            <tr>
            <td>Ngày đăng</td>
            <td>
            <input type="text" name="date" class="tcal" value="{if $id!=""}{$clsCore->int_to_date($recond.date)}{else}{$clsCore->date_now()}{/if}" />
            </td>
            </tr>
            <tr>
            <td>Ảnh đại diện</td>
            <td>
            <input type="text" name="image" id="image" style="width:200px" value="{$recond.image}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            
            <tr>
            <td>Ảnh 1</td>
            <td>
            <input type="text" name="image_1" id="image_1" style="width:200px" value="{$recond.image_1}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image_1')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            <!--
            <tr>
            <td>Ảnh 2</td>
            <td>
            <input type="text" name="image_2" id="image_2" style="width:200px" value="{$recond.image_2}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image_2')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            
            <tr>
            <td>Ảnh 3</td>
            <td>
            <input type="text" name="image_3" id="image_3" style="width:200px" value="{$recond.image_3}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image_3')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            
            <tr>
            <td>Gallary 1</td>
            <td>
            <input type="text" name="image_4" id="image_4" style="width:200px" value="{$recond.image_4}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image_4')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            
            <tr>
            <td>Gallary 2</td>
            <td>
            <input type="text" name="image_5" id="image_5" style="width:200px" value="{$recond.image_5}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image_5')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            
            <tr>
            <td>Gallary 3</td>
            <td>
            <input type="text" name="image_6" id="image_6" style="width:200px" value="{$recond.image_6}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image_6')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            <tr>
            <td>Gallary 4</td>
            <td>
            <input type="text" name="image_7" id="image_7" style="width:200px" value="{$recond.image_7}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image_7')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            -->
             <tr>
            <td>Hot?</td>
            <td>
            <select name="is_hot">
              {$clsCore->yes_no($recond.is_hot)}
            </select>
            </td>
            </tr>
            
            <tr>
            <td>Nổi bật ?</td>
            <td>
            <select name="best">
              {$clsCore->yes_no($recond.best)}
            </select>
            </td>
            </tr>
            
             <tr>
            <td>Top 4 khám phá ?</td>
            <td>
            <select name="at_home">
              {$clsCore->yes_no($recond.at_home)}
            </select>
            </td>
            </tr>
              <tr>
            <td>Danh mục trang chủ ?</td>
            <td>
            <select name="at_home1">
              {$clsCore->yes_no($recond.at_home1)}
            </select>
            </td>
            </tr>
            
             <tr>
            <td>Hiện?</td>
            <td>
            <select name="is_online">
              {$clsCore->yes_no($recond.is_online)}
            </select>
            </td>
            </tr>
            <tr>
            <td colspan="2"><font color="#FF0000"><b>Phần quản trị nâng cao dành cho người làm SEO</b></font> <a href="javascript:void(0)" id="hide">Ẩn</a>/
<a href="javascript:void(0)" id="show">Hiện</a>
</td>
            </tr>
            </table>
            <div class="cc">
            <table class="bang" cellpadding="0" cellspacing="0">
              <tr>
            <td>Cat-name</td>
            <td><input type="text" name="cat_name" style="width:400px" value="{$recond.cat_name}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Tags(Cách nhau bởi dấu #)</td>
            <td><input type="text" name="tags" style="width: 100%" value="{$recond.tags}" /></td>
            </tr>
             <tr>
            <td>Meta description</td>
            <td><textarea id="em1" name="meta_des" rows="2" cols="80" style="width: 50%">{$recond.meta_des}</textarea></td>
            </tr>
             <tr>
            <td>Meta keywords</td>
            <td><textarea id="em2" name="meta_key" rows="2" cols="80" style="width: 50%">{$recond.meta_key}</textarea></td>
            </tr>
            
            </table>
            </div>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancel</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>