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
     <div class="quantrong"><img src="{$URL_IMAGES}/nhomtin.png" /></div>
       <div class="t1">Quản lý tour </div> 
       <div class="thanhxuly">
        <div class="t3"> 
        <a href="javascript:void(0)" {if $cat_id==''} style="color:#F00" {/if}>Hiển thị tour của danh mục : </a>
        </div>
        <div class="t3"> 
        <form name="form1" id="form1">
        <select name="cat_id" onchange="return url('cat_id');">
            <option value="0">-Tất cả các danh mục -</option>
           {$clsCategory->option(0,1,4,$cat_id)}
            </select>
        </form>
        </div>
        <div class="t3">
        <form name="form2" id="form2" style="width:100px; float:left;">
        <select name="cat_id" onchange="return url2('lang');">
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
            <td width="20%">Tên tour</td>
            <td width="4%">Hình ảnh</td>
            <td width="20%">Danh mục tour</td>
            <td width="10%">Giá</td>
            <td width="10%">Giá khuyến mại</td>
            <td width="10%">Ngày đăng</td>
            <td width="8%">Hiện?</td>
            <td width="8%">Hot?</td>
           
          </tr>
          
          {section name=co loop=$recond}
          <tr>
            <td><input type="checkbox" name="{$recond[co].product_id}" /></td>
            <td><a href="{$ADMIN_URL}/?mod={$mod}&act=add&id={$recond[co].product_id}&lang={$recond[co].lang_code}">{$recond[co].name}</a></td>
            <td><img src="{$URL_UPLOADS}/{$recond[co].image}" width="50" height="50" /></td>
            <td><select name="{$recond[co].product_id}_category_id" class="select_thuong">
            <option value="0">- - -</option>
           {$clsCategory->option(0,1,4,$recond[co].category_id)}
            </select></td>
            <td>{$clsCore->format($recond[co].price)}</td>
            <td>{$clsCore->format($recond[co].dis_price)}</td>
            <td><font color="#FF0000">{$clsCore->int_to_date($recond[co].date)}</font></td>
            <td>
            <select name="{$recond[co].product_id}_is_online">
              {$clsCore->yes_no($recond[co].is_online)}
            </select>
            </td>
            <td>
            <select name="{$recond[co].product_id}_is_hot">
              {$clsCore->yes_no($recond[co].is_hot)}
            </select>
            </td>
          </tr>
           {/section}
          
         
          </table>
</form>
{if $total>$limit}
{$phantrang}
{/if}
