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
function xacnhanDelete(){
	var total = 0;
	var fmobj = document.theForm;
	for (var i=0;i<fmobj.elements.length;i++) {
	 var e = fmobj.elements[i];
	 if ((e.name != 'allbox') && (e.type=='checkbox') && (!e.disabled)) {
		 if (e.checked) total++;
	 }
	}
	if (total==0){ 
		alert('Chưa có đối tượng nào được chọn!');
		return false;
	}
   if (confirm("Bạn có thực sự muốn xóa [OK]:Yes [Cancel]:No?")) {
	   document.theForm.btnSave.value= "delete"
		document.theForm.submit();
		return true;
	}
   }
</script>
<div class="thanhtonghop">
<div class="quantrong"><img src="{$URL_IMAGES}/13.png" /></div>
       <div class="t1">Quản lý Menu : </div>
      <div class="thanhxuly">
        <div class="t1"> 
        <a href="{$ADMIN_URL}/?mod=menu" {if $cat_id==''} style="color:#F00" {/if}>Hiển thị tất cả</a>
        </div>
        <div class="t1"> 
        <a href="{$ADMIN_URL}/?mod=menu&cat_id=0" {if $cat_id!=''} style="color:#F00" {/if}>Hiển thị theo nhóm</a>
        </div>
        <div class="t3">
        <form name="form1" id="form1" style="width:100px; float:left;">
        <select name="cat_id" onchange="return url('lang');">
            <option value="vn">Tiếng Việt</option>
            {if $lang=='en'}
            <option value="en" selected="selected">
            {else}
            <option value="en">
            {/if}
            English</option>
            </select>
        </form>
        </div>
       <div class="delete" onclick="return xacnhanDelete();">Delete<img src="{$URL_IMAGES}/delete2.png"></div>
       <div class="add delete" onclick="return Go_url('?mod={$mod}&act=add&lang={$lang}');">New<img src="{$URL_IMAGES}/add2.png"></div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>
       
       </div>

<form name="theForm" action="" method="post">
<input type="hidden" name="btnSave" id="btnSave" value="">
           <table class="bang" cellpadding="0" cellspacing="0">
          <tr class="tr_chinh">
            <td width="3%"><input type="checkbox" name="allbox" onClick="return check_all();" /></td>
            <td width="14%">Tên</td>
            <td width="20%">Menu cha</td>
            <td width="10%">Nhóm tin</td>
			<td width="10%">Nhóm sản phẩm</td>
            <td width="8%">Thứ tự</td>
            <td width="8%">Hiện?</td>
            {if $cat_id!=''}<td width="10%"></td>{/if}
          </tr>
          
          {section name=co loop=$recond}
          <tr>
            <td><input type="checkbox" name="{$recond[co].menu_id}" /></td>
            <td><a href="{$ADMIN_URL}/?mod={$mod}&act=add&id={$recond[co].menu_id}&lang={$recond[co].lang_code}">{$recond[co].name}</a></td>
            <td><select name="{$recond[co].menu_id}_parent" class="select_thuong">
            <option value="0">---</option>
            {$clsMenu->option(0,1,3,$recond[co].parent)}
            
            </select>
            </td>
            <td><select name="{$recond[co].menu_id}_cat_id" class="select_thuong">
            <option value="0">- - -</option>
           {$clsCatNews->option(0,1,3,$recond[co].cat_id, $lang)}
            
            </select>
            </td>
			
         <td><select name="{$recond[co].menu_id}_category_id" class="select_thuong">
            <option value="0">- - -</option>
           {$clsCategory->option(0,1,3,$recond[co].category_id, $lang)}
            
            </select>
            </td>
            
            <td><input type="text" size="2" name="{$recond[co].menu_id}_is_order" value="{$recond[co].is_order}"></td></td>
            <td>
            <select name="{$recond[co].menu_id}_is_online">
              {$clsCore->yes_no(1,$recond[co].is_online)}
            </select>
            </td>
            {if $cat_id!=''}<td><a href="{$ADMIN_URL}/?mod={$mod}&cat_id={$recond[co].menu_id}">Xem con</a></td>{/if}
          </tr>
           {/section}
          
         
          </table>
</form>
{if $cat_id==''}
{$phantrang}
{/if}
