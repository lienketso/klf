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
     <div class="quantrong"><img src="{$URL_IMAGES}/4.png" /></div>
       <div class="t1">Hộp thư liên hệ </div> 
       <div class="thanhxuly">

 
       <div class="delete" onclick="return xacnhanDelete();">Delete<img src="{$URL_IMAGES}/delete2.png"></div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
       
</div>      
       </div>

<form name="theForm" action="" method="post">
<input type="hidden" name="btnSave" id="btnSave" value="">
           <table class="bang" cellpadding="0" cellspacing="0">
          <tr class="tr_chinh">
            <td width="3%"><input type="checkbox" name="allbox" onClick="return check_all();" /></td>
            <td width="10%">Tên người gửi</td>
            <td width="8%">SĐT</td>
            <td width="30%">Nội dung</td>
            <td width="5%">Ngày gửi</td>
            <td width="5%">Đã trả lời?</td>
            <td width="4%">Chi tiết</td>
          </tr>
          
          {section name=co loop=$recond}
          <tr>
            <td><input type="checkbox" name="{$recond[co].contact_id}" /></td>
            <td>{$recond[co].name}</td>
            <td>{$recond[co].phone}</td>
            <td>{$recond[co].content}</td>
            <td>{$clsCore->int_to_date($recond[co].date)}</td>
            <td>
            <select name="{$recond[co].contact_id}_traloi">
              {$clsCore->yes_no(1,$recond[co].traloi)}
            </select>
            </td>
            <td><a href="{$ADMIN_URL}/?mod={$mod}&act=add&id={$recond[co].contact_id}">Chi tiết</a></td>
          </tr>
           {/section}
          
         
          </table>
</form>
{if $total>$limit}
{$phantrang}
{/if}
