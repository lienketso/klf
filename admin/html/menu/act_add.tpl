<script language='javascript'>
function check_all() {
	 var fmobj = document.theForm;
	 for (var i=0;i<fmobj.elements.length;i++) {
		 var e = fmobj.elements[i];
		 if ((e.name != 'allbox') && (e.type=='checkbox') && (!e.disabled)) {
			 e.checked = fmobj.allbox.checked;
		 }
	 }
	 return true;
}
function save(){
	document.theForm.btnSave.value= "save"
	document.theForm.submit();
}
</script>
<div class="thanhtonghop">
     <div class="quantrong"><img src="{$URL_IMAGES}/13.png" /></div>
       <div class="t1">Quản lý Menu : </div> 
       <div class="thanhxuly">
        <div class="t1"> 
        <a href="#" {if $cat_id==''} style="color:#F00" {/if}>Thêm Menu</a>
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
            <td width="20%">Tên Menu(<font color="#FF0000">*</font>)</td>
            <td width="80%"><input type="text" name="name" style="width:300px" value="{$menu.name}" maxlength="255" /></td>
            </tr>
             <tr>
            <td width="20%">Menu cha</td>
            <td width="80%">
            <select name="parent" class="select_thuong">
            <option value="0">- - -</option>
           {$clsMenu->option(0, 1, 4, $menu.parent)}
            </select>
            </td>
            </tr>
             <tr>
            <td width="20%">Nhóm tin</td>
            <td width="80%">
            <select name="cat_id" class="select_thuong">
            <option value="0">- - -</option>
           {$clsCatNews->option(0, 1, 4, $menu.cat_id)}
            </select>
            </td>
            </tr>
            <tr>
            <td width="20%">Nhóm dịch vụ</td>
            <td width="80%">
            <select name="category_id" class="select_thuong">
            <option value="0">- - -</option>
           {$clsCategory->option(0, 1, 3, $menu.category_id)}
            </select>
            </td>
            </tr>
            <tr>
            <td width="20%">Link</td>
            <td width="80%"><input type="text" name="link" style="width:300px" value="{$menu.link}" maxlength="255" /></td>
            </tr>
             <tr>
            <tr>
            <td width="20%">Thứ tự</td>
            <td width="80%">
            <input type="text" name="is_order" size="10" value="{$menu.is_order}" />
            </td>
            </tr>
             
             <tr>
            <td width="20%">Hiện?</td>
            <td width="80%">
            <select name="is_online">
              {$clsCore->yes_no(1, $menu.is_online)}
            </select>
            </td>
            </tr>
            </table>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>