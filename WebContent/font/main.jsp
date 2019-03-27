<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Author" content="cjw">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>主页</title>
  <link type="text/css" rel="stylesheet" href="css/basi.css" />
  <link type="text/css" rel="stylesheet" href="css/MyCss.css">
  <style>
  	body {background:url(img/timg2.jpg); background-size: cover; background-repeat: no-repeat; height: 757px;}
  	a {color: #555;}
  	
	/* .first_part */
	/* .order_show */
	.first_part > div {float: left; padding: 5px;}
	.first_part >.order_show { width: 500px;}
	.first_part >.order_show > ul > li {float: left; width: 100%; height: 38px; text-align: center; line-height: 39px; margin-top: 6px; cursor: pointer; font-size: 16px; font-weight: 900; color: rgba(85, 85, 85, 0.7); background: #fff;}
	.first_part >.order_show > ul > li:nth-child(1),
	.first_part >.order_show > ul > li:nth-child(2),
	.first_part >.order_show > ul > li:nth-child(3),
	.first_part >.order_show > ul > li:nth-child(4){}
	.first_part >.order_show > ul > li:hover {box-shadow: 0px 0px 6px 1px #ddd; }
	.first_part >.order_show > ul > li:nth-child(2) {height: 128px; line-height: 129px;}

	.first_part >.order_show > ul > li:nth-child(3),
	.first_part >.order_show > ul > li:nth-child(4) {width: 49%; height: 128px; line-height: 129px;}

	.first_part >.order_show > ul > li:nth-child(4){margin-left: 10px;}
	
	/* show_infor */
	.first_part >.show_infor {padding: 10px 5px; }
	.first_part >.show_infor >.show_infor_in {width: 656px; height: 351px; background:url(img/mmm2.jpg); background-repeat: round;}

	/* other_bt */
	.first_part >.other_bt li {float: left; width: 225px; height: 108px; text-align: center; background: #fff; margin-left: 10px; line-height: 108px; cursor: pointer;} 
	.first_part >.other_bt li:nth-child(1) {margin-left: 0px;}
	.first_part >.other_bt li:hover {box-shadow: 0px 0px 6px 1px #ddd;}

  </style>
 </head>
 <body>
	<div class="cnt clear-float top">
		<div class="cnt_in">
			<ul class="nolist nav-pills">
				<li>
					<h1>工单管理系统</h1>
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
			<div class="first_part">
				<div class="order_show">
					<ul class="nolist text-font-style1">
						<li class="shadow_cs1">
							<a href="receiveWorkOrder.do?group_id=${employee_groupId}&type=1">
								工单管理
							</a>
						</li>
						<li class="shadow_cs1">
							<a href="receiveWorkOrder.do?group_id=${employee_groupId}&type=1">
								组内工单${groupOrderCount}
							</a>
						</li>
						<li class="shadow_cs1">
							<a href="receiveWorkOrder.do?group_id=${employee_groupId}&type=2">
								已领取${myTakeOrderCount}
							</a>
						</li>
						<li class="shadow_cs1">
							<a href="commiteWorkOrder.do?group_id=${employee_groupId}&type=5">
								已处理${myDealedOrderCount}
							</a>
						</li>
						<li class="shadow_cs1">
							<a href="#">
								我创建的工单${myCreateOrderCount}
							</a>
						</li>
					</ul>
				</div>
				<div class="show_infor">
					<div class="show_infor_in shadow_cs1">
					
					</div>
				</div>
				<div class="other_bt">
					<ul class="nolist">
						<li class="shadow_cs1"><a target="_blank" href="toCreateOrder.do">创建工单</a></li>
						<li class="shadow_cs1">通讯录</li>
						<li class="shadow_cs1">xxxx</li>
						<li class="shadow_cs1">xxxx</li>
						<li class="shadow_cs1">xxxx</li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	<script src="js/MyjsV0-8.2.js"></script>
	<script>
	
	/* 	点击跳转
		已知组id 
	*/
	function clickToManage(group_id, click_type){
		//link.local("");
	}
	
	</script>
 </body>
</html>