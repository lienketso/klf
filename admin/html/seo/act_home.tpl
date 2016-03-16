<script language="javascript">
function save(){
	document.theForm.btnSave.value= "save"
	document.theForm.submit();
}
</script>
<div class="thanhtonghop">
     <div class="quantrong"><img src="{$URL_IMAGES}/8.png" /></div>
       <div class="t1" style="height: 50px; line-height: 50px;">Cấu hình SEO </div> 
      <img style="float:left" src="{$URL_IMAGES}/Google.jpg" />
<div class="thanhxuly" style="width: 400px; margin-top: 20px;">
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
            <td width="18%">Tiêu đề website(<font color="#FF0000">*</font>)</td>
            <td width="82%"><input type="text" name="title" style="width:300px" value="{$recond.title}" maxlength="255" /></td>
            </tr>
             <tr>
            <td>Điện thoại</td>
            <td><input type="text" name="phone" style="width:300px" value="{$recond.phone}" maxlength="255" /></td>
            </tr>
            <tr>
            <td>Email</td>
            <td><input type="text" name="email" style="width:300px" value="{$recond.email}" maxlength="255" /></td>
            </tr>
             <tr>
            <td>Keywords</td>
            <td><textarea name="keyword" id="vn">{$recond.keyword}</textarea></td>
            </tr>
             <tr>
            <td>Description</td>
            <td><textarea name="des" id="vn">{$recond.des}</textarea></td>
            </tr>
            <tr>
            <td>GoogleAnalytics</td>
            <td><textarea name="google" id="vn">{$recond.google}</textarea></td>
            </tr>
            <tr>
            <td>Chân trang</td>
            <td><textarea id="editor1" name="footer">{$recond.footer}</textarea></td>
            </tr>
            </table>
</form>
<div class="act_end">
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>