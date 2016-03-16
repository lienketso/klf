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
     <div class="quantrong"><img src="{$URL_IMAGES}/3.png" /></div>
       <div class="t1">Quản lý Đơn hàng </div> 
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
            <td width="3%">Mã</td>
            <td width="10%">Khách hàng</td>
            <td width="10%">Số điện thoại</td>
            <td width="20%">Địa chỉ</td>
            <td width="14%">Đặt lúc</td>
            <td width="8%">Đã giao hàng?</td>
          </tr>
          
          {section name=co loop=$recond}
          <tr {if $recond[co].is_online==0} style="background:#FC3" {/if}>
            
            <td><input type="checkbox" name="{$recond[co].cart_id}" /></td>
            <td width="3%">{$recond[co].cart_id}</td>
            <td><a href="{$ADMIN_URL}/?mod={$mod}&act=add&id={$recond[co].cart_id}">{$recond[co].name}</a></td>
            <td>{$recond[co].phone}</td>
            <td>{$recond[co].address}</td>
            <td width="8%">{$clsCore->int_to_date_full({$recond[co].date})}</td>
            <td>
            <select name="{$recond[co].cart_id}_is_online">
              {$clsCore->yes_no($recond[co].is_online)}
            </select>
            </td>
            
          </tr>
           {/section}
          
         
          </table>
</form>
{if $total>$limit}
{$phantrang}
{/if}
