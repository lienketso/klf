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
     <div class="quantrong"><img src="{$URL_IMAGES}/11.png" /></div>
       <div class="t1">Quản lý Slide : </div> 
       <div class="thanhxuly">
        <div class="t1"> 
        <a href="#" {if $cat_id==''} style="color:#F00" {/if}>Thêm ảnh slide</a>
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
            <td>Tiêu đề(<font color="#FF0000">*</font>)</td>
            <td><input type="text" name="title" style="width:400px" value="{$recond.title}" maxlength="255" /></td>
            </tr>
           <tr>
            <td>Ảnh</td>
            <td>
           <input type="text" style="width:200px" id="image" name="image" maxlength="255" value="{$recond.image}" />
           <a href="javascript:void(0)" onclick="return ShowDialog('image');"><img class="dialog" src="{$URL_IMAGES}/directory.png" /></a>
            </td>
            </tr>
            <tr>
            <td>Link</td>
            <td>
           <input type="text" style="width:200px" name="link" maxlength="255" value="{$recond.link}" /></a>
            </td>
            </tr>
            <tr>
            <td>Thứ tự</td>
            <td>
           <input type="text" size="4" name="is_order" value="{$recond.is_order}" />
            </td>
            </tr>
   
             <tr>
            <td>Hiện?</td>
            <td>
            <select name="is_online">
              {$clsCore->yes_no(1,$recond.is_online)}
            </select>
            </td>
            </tr>
            </table>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>