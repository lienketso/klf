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
     <div class="quantrong"><img src="{$URL_IMAGES}/16.png" /></div>
       <div class="t1">Quản lý Quảng cáo </div> 
       <div class="thanhxuly">

 
       <div class="delete" onclick="return xacnhanDelete();">Delete<img src="{$URL_IMAGES}/delete2.png"></div>
       <div class="add delete" onclick="return Go_url('?mod={$mod}&act=add');">New<img src="{$URL_IMAGES}/add2.png"></div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
       
</div>      
       </div>

<form name="theForm" action="" method="post">
<input type="hidden" name="btnSave" id="btnSave" value="">
           <table class="bang" cellpadding="0" cellspacing="0">
          <tr class="tr_chinh">
            <td width="3%"><input type="checkbox" name="allbox" onClick="return check_all();" /></td>
            <td width="20%">Tiêu đề</td>
            <td width="20%">Ảnh</td>
            <td width="20%">Vị trí</td>
            <td width="10%">Thứ tự</td>
            <td width="8%">Hiện?</td>
           
          </tr>
          
          {section name=co loop=$recond}
          <tr>
            <td><input type="checkbox" name="{$recond[co].adver_id}" /></td>
            <td><a href="{$ADMIN_URL}/?mod={$mod}&act=add&id={$recond[co].adver_id}">{$recond[co].title}</a></td>
            <td><img src="{$URL_UPLOADS}/{$recond[co].image}" style=" max-height: 100px; max-width: 200px;" /></td>
            <td><input type="text" name="{$recond[co].adver_id}_is_order" size="4" value="{$recond[co].is_order}" /></td>
            <td>
            <select name="{$recond[co].adver_id}_is_online">
              {$clsCore->yes_no(1,$recond[co].is_online)}
            </select>
            </td>
            
          </tr>
           {/section}
          
         
          </table>
</form>
{if $total>$limit}
{$phantrang}
{/if}
