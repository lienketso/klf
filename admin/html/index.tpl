<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="{$URL_CSS}/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="{$URL_JS}/jquery.min.js"></script>
<script language="javascript" src="{$URL_JS}/global.js"></script>
<script language="javascript" src="{$URL_JS}/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="{$URL_CSS}/tcal.css" />
	<script type="text/javascript" src="{$URL_JS}/tcal.js"></script> 
<title>CMS</title>
</head>
<body>
<script language="javascript">
function ShowDialog(id) 
{ 
window.open('{$DIALOG}/upload.php?id='+id,';D','scrollbars=1, width=500, height=440,resizable=yes,sc  rollbars=yes,top=40,left=150'); 
} 
function changeQueryVariable(keyString, replaceString) {
		var query = window.location.search.substring(1);
		var vars = query.split("&");
		for (var i = 0; i < vars.length; i++) {
			//alert(vars[i]);
			var pair = vars[i].split("=");
			if (pair[0] == keyString) {
				vars[i] = pair[0] + "=" + replaceString;
			}
		}
		return vars.join("&");
	}
   function url(k){
		var url = window.location.search;
		var new_url;
		
		if (url.indexOf(k) != -1){
			var n=url.split("&");
			
			new_url = changeQueryVariable(k, document.form1.cat_id.value);
		}else{
			new_url = url+'&'+k+'='+document.form1.cat_id.value;
		}
		p=new_url.substr(0,1);
		if(p!='?'){
		new_url = '?'+new_url;
		}
		window.location.href = new_url;
		return false;
}
 function url2(k){
		var url = window.location.search;
		var new_url;
		
		if (url.indexOf(k) != -1){
			var n=url.split("&");
			
			new_url = changeQueryVariable(k, document.form2.cat_id.value);
		}else{
			new_url = url+'&'+k+'='+document.form2.cat_id.value;
		}
		p=new_url.substr(0,1);
		if(p!='?'){
		new_url = '?'+new_url;
		}
		window.location.href = new_url;
		return false;
}
</script>
<div class="wrapper">
     <div class="footer">
      <div class="ov">
    <a href="{$ADMIN_URL}"><img src="{$URL_IMAGES}/2.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}">Panel</a>
     </div>
     <div class="ov">
    <a href="{$ADMIN_URL}/?mod=category"><img src="{$URL_IMAGES}/16.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=category">Danh mục dịch vụ</a>
     </div>
     <div class="ov">
    <a href="{$ADMIN_URL}/?mod=product"><img src="{$URL_IMAGES}/11.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=product">Quản lý dịch vụ</a>
     </div>
      <div class="ov">
    <a href="{$ADMIN_URL}/?mod=menu"><img src="{$URL_IMAGES}/13.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=menu">Menu</a>
     </div>
     <div class="ov">
     <a href="{$ADMIN_URL}/?mod=catnews"><img src="{$URL_IMAGES}/14.png" /></a>
     <div class="clear"></div>
          <a href="{$ADMIN_URL}/?mod=catnews">Nhóm tin tức</a>
     </div>
     
     <div class="ov">
     <a href="{$ADMIN_URL}/?mod=news"><img src="{$URL_IMAGES}/nhomtin.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=news">Tin tức</a>
     </div>
     <div class="ov">
     <a href="{$ADMIN_URL}/?mod=page"><img src="{$URL_IMAGES}/15.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=page">Trang riêng</a>
     </div>
     <div class="ov">
     <a href="{$ADMIN_URL}/?mod=support"><img src="{$URL_IMAGES}/3.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=support">Hỗ trợ trực tuyến</a>
     </div>
    
     </div>
    <div class="content">
       <!--<div class="content-left">
          <div class="o1"><a href="{$ADMIN_URL}/?mod=menu">Quản trị Menu</a></div>
          <div class="o1"><a href="{$ADMIN_URL}/?mod=news">Quản trị Tin tức</a></div>
               <div class="o2"><a href="{$ADMIN_URL}/?mod=catnews">Nhóm bài viết</a></div>
               <div class="o2"><a href="{$ADMIN_URL}/?mod=page">Trang riêng</a></div>
          <div class="o1"><a href="{$ADMIN_URL}/?mod=product">Quản trị Sản phẩm</a></div>
               <div class="o2"><a href="#">Nhóm sản phẩm</a></div>
               <div class="o2"><a href="#">Sản phẩm</a></div>
               <div class="o2"><a href="#">Trang riêng</a></div>
         
       </div>
       -->
       <div class="content-right">
       {include file="$mod/index.tpl"}
       </div>
    </div>
     <div class="footer">
     <div class="ov">
    <a href="{$ADMIN_URL}/?mod=seo"><img src="{$URL_IMAGES}/8.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=seo">Cấu hình</a>
     </div>
     <div class="ov">
    <a href="{$ADMIN_URL}/?mod=tags"><img src="{$URL_IMAGES}/seo.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=tags">Tags</a>
     </div>
     <div class="ov">
    <a href="{$ADMIN_URL}/?mod=contact"><img src="{$URL_IMAGES}/4.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=contact">Liên hệ</a>
     </div>
      <div class="ov">
     <a href="{$ADMIN_URL}/?mod=slide"><img src="{$URL_IMAGES}/11.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=slide">Slide</a>
     </div>
    <div class="ov">
     <a href="{$ADMIN_URL}/?mod=adver"><img src="{$URL_IMAGES}/16.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=adver">Quảng cáo</a>
     </div>
      <div class="ov">
     <a href="{$ADMIN_URL}/?mod=user"><img src="{$URL_IMAGES}/9.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=user">Admin</a>
     </div>
     <div class="ov">
     <a href="{$ADMIN_URL}/?mod=cart"><img src="{$URL_IMAGES}/9.png" /></a>
     <div class="clear"></div>
     <a href="{$ADMIN_URL}/?mod=cart">Đơn hàng</a>
     </div>
     </div>
    <div class="clear"></div>
    </div>
      <script type="text/javascript">
			//<![CDATA[
 var nvcms_url = "{$ADMIN_URL}/html"
				// This call can be placed at any point after the
				// <textarea>, or inside a <head><script> in a
				// window.onload event handler.

				// Replace the <textarea id="editor"> with an CKEditor
				// instance, using default configurations.
				//CKEDITOR.config.height = 400;
				CKEDITOR.replace( 'editor1',
                {
					height: 100,
                    filebrowserBrowseUrl :nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
                    filebrowserImageBrowseUrl : nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Type=Image&Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
                    filebrowserFlashBrowseUrl :nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Type=Flash&Connector=Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
					filebrowserUploadUrl  :'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=File',
					filebrowserImageUploadUrl : 'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=Image',
					filebrowserFlashUploadUrl : 'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=Flash'
				});
				CKEDITOR.replace( 'editor2',
                {
					height: 400,
                    filebrowserBrowseUrl :nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
                    filebrowserImageBrowseUrl : nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Type=Image&Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
                    filebrowserFlashBrowseUrl :nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Type=Flash&Connector=Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
					filebrowserUploadUrl  :'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=File',
					filebrowserImageUploadUrl : 'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=Image',
					filebrowserFlashUploadUrl : 'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=Flash'
				});
				
				CKEDITOR.replace( 'editor3',
                {
					height: 300,
                    filebrowserBrowseUrl :nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
                    filebrowserImageBrowseUrl : nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Type=Image&Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
                    filebrowserFlashBrowseUrl :nvcms_url+'/js/ckeditor/filemanager/browser/default/browser.html?Type=Flash&Connector=Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/connector.php',
					filebrowserUploadUrl  :'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=File',
					filebrowserImageUploadUrl : 'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=Image',
					filebrowserFlashUploadUrl : 'Connector='+nvcms_url+'/js/ckeditor/filemanager/connectors/php/upload.php?Type=Flash'
				});
				
</script>
</body>
</html>
