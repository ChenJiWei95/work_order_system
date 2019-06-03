<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
 <head>
  <meta >
  <meta name="Author" content="cjw">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>创建工单</title>
  <link type="text/css" rel="stylesheet" href="css/basi.css" />
  <link type="text/css" rel="stylesheet" href="css/MyCss.css">
  <style>
	a {color: #555;}
	.create {
		height: 700px; 
		background: #fff;
	}
	.cre_header, .cre_bomer{padding: 0 60px;}
	.create h1 {padding-top: 15px; padding-left: 15px;}
	
	.cre_coner {padding: 14px 122px;}

	.btn-success {float:right; margin-top: 9px; height: 33px; width: 110px; margin-right: 10px;}
	

	table{margin-left: 48px; color: #888; border-collapse: collapse;}
	table th {background: #f5f7fa; width: 130px;}
	table td, table th{border-top: 1px solid #dee2e6; border-bottom: 1px solid #f0f0f0!important; padding: 8px 6px;}
	.textarea-style1 {width: 96%; height: 88px;}
	
	.input-text {width: 278px;}
	
  </style>
 </head>
 <body>
	<div class="cnt clear-float top">
		<div class="cnt_in">
			<ul class="nolist nav-pills">
				<li>
					<h1 onclick="clickToMain()">
						工单管理系统
					</h1>
				</li>
				<li>
					<span>${sessionScope.employee_name}</span>
				</li>
				<li></li>
			</ul>
		</div>
	</div>
	<div class="cnt">
		<div class="cnt_in con">
			<div class="create shadow_cs1">
				<div class="cre_header">
					<div class="box-border-bom">
						<h1>
							创建工单
						</h1>
					</div>
				</div>
				<form id="myForm" action="createOrder.do" method="post">
					<div class="cre_coner">
					<div class="cre_coner_body">
						<table class="">
							<tbody>
								<tr>
									<th>标题</th>
									<td>
										<input type="text" name="title" class="input-text" placeholder="请输入标题">
									</td>
									<th>工单类型</th>
									<td>
										<select class="input-text" style="width: 290px; height: 32px;">
											<option>默认</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>工单模板</th>
									<td>
										<select class="input-text" style="width: 290px; height: 32px;">
											<option>默认</option>
										</select>
									</td>
									<th>优先级</th>
									<td>
										<select name="priority" class="input-text" style="width: 290px; height: 32px;">
											<option value=1>低</option>
											<option value=2>一般</option>
											<option value=3>紧急</option>
											<option value=4>非常紧急</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>用户名</th>
									<td>
										<input name="user_name" type="text" class="input-text" placeholder="请输入用户名">
									</td>
									<th>用户电话</th>
									<td>
										<input name="user_phone" type="number" class="input-text" placeholder="请输入手机号">
									</td>
								</tr>
								<tr>
									<th>用户邮箱</th>
									<td colspan=3>
										<input name="user_email" type="text" class="input-text" placeholder="请输入用户名">
									</td>
								</tr>
								<tr>
									<th>描述</th>
									<td colspan=3><textarea name="desc" class="textarea-style1" placeholder="输入描述内容"></textarea></td>
								</tr>
								<tr>
									<th>建议</th>
									<td colspan=3>
									<textarea name="advise" class="textarea-style1" placeholder="输入处理意见"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="cre_bomer ">
					<div class="box-border-top" style="padding-right: 64px;">
						<input type="button" value="重置" class="btn ripple btn-success reset">
						<input type="submit" value="确认" class="btn ripple btn-success submit">
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script src="js/MyjsV0-8.2.js"></script>
	<script>
	$(".reset").eq(0).onclick = function(){
		$("table").eq(0).$("input").forEach(item => {
			item.value = "";
		});
		$("table").eq(0).$("select").forEach(item => {
			item.value = item.$("option").eq(0).value;
		});
		$("table").eq(0).$("textarea").forEach(item => {
			item.value = "";
		});
	}
	$(".submit").eq(0).onclick = function(e){
		if($("user_name").eq(0).value == "" 
				|| $("user_phone").eq(0).value == "" 
				|| $("user_email").eq(0).value == "" 
				|| $("desc").eq(0).value == ""
				|| $("advise").eq(0).value == ""
				|| $("title").eq(0).value == "")
			return false;
	}
	
	function clickToMain(){
		link.local("toMain.do");
	}
	</script>
 </body>
</html>