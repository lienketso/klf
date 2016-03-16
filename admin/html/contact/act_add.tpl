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
     <div class="quantrong"><img src="{$URL_IMAGES}/4.png" /></div>
       <div class="t1">Liên hệ </div> 
       <div class="thanhxuly">
        <div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
       
       
</div>      
       </div>
<form name="theForm" action="" method="post">
<input type="hidden" name="btnSave" id="btnSave" value="">
            <table class="bang" cellpadding="0" cellspacing="0">
            <tr class="tr_add">
            <td colspan="2">Chi tiết liên hệ</td>
            </tr>
           
             <tr>
            <td width="20%">Tên người gửi</td>
            <td width="80%">{$recond.name}</td>
            </tr>
           <tr>
            <td>Tuổi</td>
            <td>
           {$recond.age}
            </td>
            </tr>
            <tr>
            <td>Địa chỉ</td>
            <td>
           {$recond.address}
            </td>
            </tr>
            <tr>
            <td>Email</td>
            <td>
           {$recond.email}
            </td>
            </tr>
            <tr>
            <td>Số điện thoại</td>
            <td>
           {$recond.phone}
            </td>
            </tr>
             <tr>
            <td>Nội dung</td>
            <td>
           {$clsCore->Decode($recond.content)}
            </td>
            </tr>
             <tr>
            <td>Đã trả lời?</td>
            <td>
            <select name="traloi">
              {$clsCore->yes_no(1,$recond.traloi)}
            </select>
            </td>
            </tr>
            </table>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>