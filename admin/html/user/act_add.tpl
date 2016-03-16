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
     <div class="quantrong"><img src="{$URL_IMAGES}/9.png" /></div>
       <div class="t1">Tài khoản </div> 
       <div class="thanhxuly">

        <div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancel</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
       
       
</div>      
       </div>
<form name="theForm" action="" method="post">
<input type="hidden" name="btnSave" id="btnSave" value="">
            <table class="bang" cellpadding="0" cellspacing="0">
            <tr class="tr_add">
            <td>Mời bạn điền vào các thông tin dưới đây - </td>
            <td>{$note}</td>
            </tr>
           
             <tr>
            <td>Tài khoản(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="username" style="width:200px" value="{$recond.username}" maxlength="255" /></td>
            </tr>
            
             <tr>
            <td>Mật khẩu(<font color="#FF0000">*</font>)</td>
            <td><input type="password" name="password" style="width:200px" value="" maxlength="255" /></td>
            </tr>
             <tr>
            <td>Nhập lại mật khẩu(<font color="#FF0000">*</font>)</td>
            <td><input type="password" name="repassword" style="width:200px" value="" maxlength="255" /></td>
            </tr>
          	<tr>
            <td>Email(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="email" style="width:200px" value="{$recond.email}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Điện thoại</td>
            <td><input type="text" name="phone" style="width:200px" value="{$recond.phone}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Địa chỉ</td>
            <td><textarea name="address" style="width:400px; height:100px;">{$recond.address}</textarea></td>
            </tr>
            <tr>
            
             <td>Phân quyền(<font color="#FF0000">*</font>)</td>
            <td><select name="person" class="select_thuong">
            <option value="0">- - -</option>
           {$clsCatNews->option(0,1,4,$recond.person)}
            </select>
            </td>
            </tr>
            <tr>
            <td>Kích hoạt ?</td>
            <td>
            <select name="is_online">
              {$clsCore->yes_no(1,$recond.is_online)}
            </select>
            </td>
            </tr>
            </table>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancel</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>
<div class="clear"></div>
