<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<link href="{$URL_CSS}/login.css" type="text/css" rel="stylesheet" />
</head>
<script language="javascript" type="text/javascript">
function khoitao(){
fname = document.getElementById("orderForm");
if(fname.user.value == ""){
		alert("Username không được bỏ trống ! ");
		fname.user.focus();
		return false;
	}
if(fname.pass.value == ""){
		alert("Password không được bỏ trống ! ");
		fname.pass.focus();
		return false;
	}
}
</script>

<body onload="">
<div id="login">
<div class="logo">
<img src="{$URL_IMAGES}/logo.png" /> Đăng nhập quản trị
</div>
<!--  start login-inner -->
<form action="" method="post" id="orderForm" name="orderForm">
	<div id="login-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>Username</td>
			<td><input type="text"  class="login-inp" name="user" /></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" class="login-inp" name="pass" /></td>
		</tr>
		<tr>
			<td>Code</td>
			<td><input type="password"  class="login-inp" name="code" /></td>
		</tr>
		<tr>
			<td><a class="quen" href="mailto:thanhan1507@gmail.com" title="Forgot password?">Quên password?</a></td>
			<td><input type="submit" class="submit-login" value="Đăng nhập" onclick="return khoitao();"  /></td>
		</tr>
		</table>
	</div>
</form>
 	<!--  end login-inner -->
</div>
</body>
</html>
