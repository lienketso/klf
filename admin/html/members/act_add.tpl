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
       <div class="t1">Quản lý thành viên </div> 
       <div class="thanhxuly">

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
            <td>Tài khoản(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="username" style="width:200px" value="{$recond.username}" maxlength="255" />{$tt}</td>
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
            <td>Họ và tên(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="name" style="width:200px" value="{$recond.name}" maxlength="255" /> {$loi}</td>
            </tr>
            <tr>
            <td>Địa chỉ(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="address" style="width:200px" value="{$recond.address}" maxlength="255" /> {$loi}</td>
            </tr>
          	<tr>
            <td>Email (<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="email" style="width:200px" value="{$recond.email}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Điện thoại(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="phone" style="width:200px" value="{$recond.phone}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Thông tin cá nhân(<font color="#FF0000">*</font>)</td>
            <td><textarea id="editor1" name="content" rows="5" cols="80" style="width: 100%">{$clsCore->Decode($recond.info)}</textarea></td>
            </tr>
            <tr>
            <td>Ảnh đại diện(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="image" id="image" style="width:200px" value="{$recond.image}" maxlength="255" />
            <a href="javascript:void(0)" onclick="return ShowDialog('image')"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a></td>
            </tr>
            <!-- <tr>
            <td>Hiện?</td>
            <td>
            <select name="is_online">
              {$clsCore->yes_no(1,$recond.is_online)}
            </select>
            </td>
            </tr>-->
            </table>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancel</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>
<div class="clear"></div>
{$note}