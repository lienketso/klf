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
       <div class="t1">Quản lý Tin tức : </div> 
       <div class="thanhxuly">
        <div class="t1"> 
        <a href="#" {if $cat_id==''} style="color:#F00" {/if}>Thêm tin tức</a>
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
            <td width="18%">Nhóm tin </td>
            <td width="82%">
            <select name="cat_id" class="select_thuong">
           {$clsCatNews->option(0, 1, 4, $news.cat_id)}
            </select>
            </td>
            </tr>
             <tr>
            <td>Tên(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="title" style="width:400px" value="{$news.title}" maxlength="255" /></td>
            </tr>
             
            <tr>
            <td>Mô tả(<font color="#FF0000">*</font>)</td>
            <td><textarea id="editor1" name="intro" rows="5" cols="80" style="width: 100%">{$clsCore->Decode($news.intro)}</textarea></td>
            </tr>
             <tr>
            <td>Nội dung(<font color="#FF0000">*</font>)</td>
            <td><textarea id="editor2" name="content" rows="5" cols="80" style="width: 100%">{$clsCore->Decode($news.content)}</textarea></td>
            </tr>
            <tr>
            <td>Ngày đăng</td>
            <td>
            <input type="text" name="date" class="tcal" value="{if $id!=""}{$clsCore->int_to_date($news.date)}{else}{$clsCore->date_now()}{/if}" />
            </td>
            </tr>
            <tr>
            <td>Ảnh đại diện</td>
            <td>
            <input type="text" name="image" id="image" style="width:200px" value="{$news.image}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
             <tr>
            <td>Hot?</td>
            <td>
            <select name="is_hot">
              {$clsCore->yes_no($news.is_hot)}
            </select>
            </td>
            </tr>
             <tr>
            <td>Trang chủ?</td>
            <td>
            <select name="at_home">
              {$clsCore->yes_no(1,$news.at_home)}
            </select>
            </td>
            </tr>
             <tr>
            <td>Hiện?</td>
            <td>
            <select name="is_online">
              {$clsCore->yes_no($news.is_online)}
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
            <td><input type="text" name="news_name" style="width:400px" value="{$news.news_name}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Tags(Cách nhau bởi dấu #)</td>
            <td><input type="text" name="tags" style="width: 100%" value="{$news.tags}" /></td>
            </tr>
             <tr>
            <td>Meta description</td>
            <td><textarea id="em1" name="meta_des" rows="2" cols="80" style="width: 50%">{$news.meta_des}</textarea></td>
            </tr>
             <tr>
            <td>Meta keywords</td>
            <td><textarea id="em2" name="meta_key" rows="2" cols="80" style="width: 50%">{$news.meta_key}</textarea></td>
            </tr>
            
            </table>
            </div>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>