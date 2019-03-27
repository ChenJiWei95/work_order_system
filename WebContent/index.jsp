<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Author" content="cjw">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>登录</title>
  <link type="text/css" rel="stylesheet" href="css/basi.css" />
  <link type="text/css" rel="stylesheet" href="css/MyCss.css">
  <style>
	body {background:url(img/timg2.jpg); background-size: cover; background-repeat: no-repeat; height: 757px;}
	.login {width: 340px; background: #fff; position: relative; margin: auto; margin-top: 208px; }
	.login_ {padding: 50px;}
	.login_ form > div {margin-top: 15px; text-align: center; margin-bottom: 15px;}
	.input-text-cs2 {outline: none; border: none; background: #f2f2f2; width: 180px; height: 20px; 
	padding: 10px 30px;}
	.input-bt-cs2 {outline: none; border: none; background: #555; width: 240px; height: 40px; cursor: pointer; color: #fff;}
 	/* 摇晃动画 */
	.shake_effect {
		-webkit-animation-name: shake;
		animation-name: shake;
		-webkit-animation-duration: 1s;
		animation-duration: 1s;
	}
	@-webkit-keyframes shake {
		from, to {
			-webkit-transform: translate3d(0, 0, 0);
			transform: translate3d(0, 0, 0);
		}
		10%, 30%, 50%, 70%, 90% {
			-webkit-transform: translate3d(-10px, 0, 0);
			transform: translate3d(-10px, 0, 0);
		}
		20%, 40%, 60%, 80% {
			-webkit-transform: translate3d(10px, 0, 0);
			transform: translate3d(10px, 0, 0);
		}
	}
	@keyframes shake {
		from, to {
			-webkit-transform: translate3d(0, 0, 0);
			transform: translate3d(0, 0, 0);
		}
		10%, 30%, 50%, 70%, 90% {
			-webkit-transform: translate3d(-10px, 0, 0);
			transform: translate3d(-10px, 0, 0);
		}
		20%, 40%, 60%, 80% {
			-webkit-transform: translate3d(10px, 0, 0);
			transform: translate3d(10px, 0, 0);
		}
	}
  </style>
 </head>
 <body>
	<div class="cnt clear-float top">
		<div class="cnt_in ">
			<ul class="nolist nav-pills">
				<li>
					<h1>工单管理系统</h1>
				</li>
			</ul>
		</div>
	</div>
	<div class="cnt clear-float">
		<div class="cnt_in con clear-float">
			<div class="login shodow_cs3">
				<div class="login_">
					<form action="login.do" method="post" id="login_form">
						<div>
							<input type="text" name="user" id="user" class="input-text-cs2" placeholder="请输入员工账号"/>
						</div>
						<div>
							<input type="password" name="pass" id="pass" class="input-text-cs2" placeholder="请输入密码"/>
						</div>
						<div>
							<input type="submit" id="submit" class="input-bt-cs2" value="登录"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/MyjsV0-8.2.js"></script>
	<script> 
		$("#login_form").onsubmit = function (){
			if($("#user").value == "" ||
				$("#pass").value == ""){
				$(".login").eq(0).removeClass("shake_effect");
				setTimeout(function(){
					$(".login").eq(0).addClass("shake_effect");
				}, 10);
				return false;
			}
		}
	</script>
 </body>
</html>