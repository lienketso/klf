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
     <div class="quantrong"><img src="{$URL_IMAGES}/3.png" /></div>
       <div class="t1">Chi tiết đơn hàng </div> 
       <div class="thanhxuly">
       
</div>      
       </div>

<table class="giohang" width="100%" cellpadding="0" cellspacing="0">
<tr style="background:#999; font-weight: bold; color: #fff;">
<td width="30%">Tên sản phẩm</td>
<td width="10%">Hình ảnh</td>
<td>Giá</td>
<td>Số lượng</td>
<td>Thành tiền</td>
</tr>
{foreach $cart as $k=>$v}
{if $k!=''}
<tr>
<td>{$clsProduct->fiel($k,name)}</td>
<td width="10%"><img src="{$URL_UPLOADS}/{$clsProduct->fiel($k,image)}" width="50" height="50" /></td>
<td>{$clsCore->format($clsProduct->fiel($k,price))}</td>
<td>{$v}</td>
<td>{$clsCore->format($clsCore->nhan($v,$clsProduct->fiel($k,price)))}</td>
</tr>
{/if}
{/foreach}
<tr style=" font-weight: bold">
<td colspan="4">Tổng </td>
<td colspan="2"> {$clsCore->format($tonggia)} VNĐ</td>
</tr>

</table>
<form name="theForm" action="" method="post">
<input type="hidden" name="btnSave" id="btnSave" value="">
            <table class="bang" cellpadding="0" cellspacing="0" style="font-weight: bold">
              <tr>
            <td width="20%">Mã đơn hàng</td>
            <td><font color="#FF0000" size="+1">{$recond.cart_id}</font></td>
            </tr>
             <tr>
            <td width="20%">Tên khách hàng</td>
            <td><font color="#FF0000" size="+1">{$recond.name}</font></td>
            </tr>
           <tr>
            <td>Số điện thoại</td>
            <td>
           {$recond.phone}
            </td>
            </tr>
            <tr>
            <td>Địa chỉ</td>
            <td>
           {$recond.address}
            </td>
            </tr>
            <tr>
            <td>Yêu cầu thêm</td>
            <td>
           {$recond.content}
            </td>
            </tr>
   
             <tr>
            <td>Đã thanh toán?</td>
            <td>
            <select name="is_online">
              {$clsCore->yes_no($recond.is_online)}
            </select>
            </td>
            </tr>
            </table>
</form>
<div class="act_end">
<div class="cancer delete" onclick="return Go_url('?mod={$mod}');">Cancer</div>
       <div class="save delete" onclick="return save();">Save<img src="{$URL_IMAGES}/save.png"></div>
</div>