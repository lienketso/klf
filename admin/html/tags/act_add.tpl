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
     <div class="quantrong"><img src="{$URL_IMAGES}/seo.png" /></div>
       <div class="t1">Tags : </div> 
       <div class="thanhxuly">
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
            <td>Tag(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="name" style="width:200px" value="{$recond.name}" maxlength="255" /></td>
            </tr>
            
             <tr>
            <td>Cat name(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="cat_name" style="width:200px" value="{$recond.cat_name}" maxlength="255" /></td>
            </tr>
             <tr>
            <td>Thứ tự</td>
            <td><input type="text" name="is_order" style="width:30px" value="{$recond.is_order}" maxlength="255" /></td>
            </tr>
          
            <tr>
            <td>Hiện?</td>
            <td>
            <select name="at_home">
              {$clsCore->yes_no(0,$recond.at_home)}
            </select>
            </td>
            </tr>
            </table>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>
<div class="clear"></div>
{$note}