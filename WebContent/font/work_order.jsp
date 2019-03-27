<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
 <head>
  <meta >
  <meta name="Author" content="cjw">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>工单</title>
  <link type="text/css" rel="stylesheet" href="css/basi.css" />
  <link type="text/css" rel="stylesheet" href="css/MyCss.css">
  <style>
	a {color: #555;}
	.cnt_in {position:relative; width: 1180px; height: 50px; margin: auto;  }

	.top {margin-bottom: 10px; background: none;}
		.top > .cnt_in {border-bottom: 1px solid #c5b7b7;}
		.btn-success {margin-top: 9px; height: 33px; width: 110px; margin-left: 10px;}

	.con {height: 600px;}
	.con > div{background: #fff; position: relative; margin-top: 10px;}
	/* con_nav */
	.con_nav {height: 30px; }

	.con_nav .nav-pills li {padding: 7px 52px; cursor: pointer;}
	
	/* work_order_content */
	.work_order_content {height: 700px;}

	.work_order_content > ul, .work_order_content > ul > li {height: 100%;}
	.work_order_content > ul > li > div {width: 100%; height: 100%;}
	/* page1 */
	.page1 table{margin-left: 48px; margin-top: 40px; color: #888; border-collapse: collapse;}
	.page1 table td{font-size: 14px; padding: 10px 30px; border-bottom: 1px solid #f0f0f0!important;}
	.page1 table tr:nth-child(1) td,
	.page1 table tr:nth-child(8) td  {background: #fff; border-bottom: 1px solid #dee2e6;}
	.page1 table td:nth-child(1), .page1 table td:nth-child(3){background: #f5f7fa;}
	.page1 table .show_content {width: 219px;}
	.page1 table h1 {color: #555; margin-top: 10px;}
	.page1 table td, .page1 table th{border-top: 1px solid #dee2e6;}
	.text-break-style1 {letter-spacing: 0; text-indent: 30px; color: #888; font-size: 14px; width: 100%; height: 239px;}
	/* page2 */
	.page2 img {margin: 40px 20px;}

	/* page3 */
	.page3 table {width: 1138px; padding: 20px; color: #888;}
	.page3 table th:nth-child(1) {width: 48px;}
	.page3 table th:nth-child(2) {width: 38px;}
	.page3 table th:nth-child(3) {width: 166px;}
	.page3 table th:nth-child(6) {width: 425px;}
	.page3 table td, .page3 table th{padding: 17px 18px; text-align: center; }
	.page_hide {display: none;}
	.page_out {display: block;}

	/* 模态框 */
	.modal {display: none; position: fixed; z-index: 1; padding-top: 139px; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(128, 128, 128, 0.35); }
	/* 建议窗 */
	.advise_win {width: 700px; height: 409px; background: #fff; margin: auto; padding: 60px; border-radius: 5px;}
	.advise_win > div {margin-top: 15px;}
	.advise_title {text-align: center; padding-bottom: 20px;}
	.evaluate > div {float: left; position: relative; margin-left: 14px;}
	.evaluate > div span {margin-left: 18px; font-size: 14px;}
	.evaluate > div input {position: absolute; top: 4px;}
	.advise_to select {width: 49%; height: 25px; border: 1px solid #dfdfdf; border-radius: 3px; padding-left: 10px;}
	.advise_to select:nth-child(2) {margin-left: 5px;}
	.advise_input .textarea-style1 {width: 96%; height: 121px;}

	.dialog-out-scale {
		animation-name: zoom-dialog-out-scale; animation-duration: 0.8s;
	}

	.dialog-in-scale {
		animation-name: zoom-dialog-in-scale; animation-duration: 0.8s;
	}
	/* 窗口缩放动画 */
	@keyframes zoom-dialog-out-scale {
		from {transform: scale(0.1); opacity: 0;} 
		to {transform: scale(1); opacity: 1;}
	}
	@keyframes zoom-dialog-in-scale {
		from {transform: scale(1); opacity: 1;} 
		to {transform: scale(0.1); opacity: 0; display: none;}
	}
	.translat-int {
		transition: -webkit-transform .3s ease-out;
		transition: transform .3s ease-out;
		transition: transform .3s ease-out,-webkit-transform .3s ease-out;
		-webkit-transform: translate(0,-50px);
		transform: translate(0,-50px);
	}
	.translat-out {
		-webkit-transform: none;
		transform: none;
	}
	/* 移动画参考 http://www.jq22.com/demo/jqueryzsgc201901240036/*/
	
	/* 关闭控件 */
	.close {position: absolute; top: 15px; right: 35px; color: #f1f1f1; font-size: 40px; font-weight: bold; transition: 0.3s;}
	.close:hover,
	.close:focus {color: #bbb; text-decoration: none; cursor: pointer;}
  </style>
 </head>
 <body>
	<div class="cnt clear-float top">
		<div class="cnt_in operate_button">
			<!-- <input type="button" class="btn ripple btn-success" onclick="order_click(1)" data-type="1" value="提交" />
			<input type="button" class="btn ripple btn-success" data-type="2" onclick="order_click(1)" value="退回" />
			<input type="button" class="btn ripple btn-success" data-type="3" onclick="order_click(1)" value="签收" /> -->
		</div>
	</div>
	<div class="cnt">
		<div class="cnt_in con">
			<div class="con_nav shadow_style1">
				<ul class="nolist nav-pills">
					<li>工单描述</li>
					<li>分派流程</li>
					<li>工单过程</li>
				</ul>
			</div>
			<div class="work_order_content shadow_style1">
				<ul class="nolist work_order_content_ul">
					<li class="page_out">
						<div class="page1 clear-float">
							<table>
								<tbody>
									<tr>
										<td colspan=5><h1>工单编号: <span class="order_id">000001</span></h1></td>
									</tr>
									<tr>
										<td>标题:</td>
										<td class="show_content title">测试数据</td>
										<td>发起人:</td>
										<td class="show_content name">管控组/李明</td>
										<td class="show_content"></td>
									</tr>
									<tr>
										<td>工单类型:</td>
										<td class="show_content type">默认</td>
										<td>工单模板:</td>
										<td class="show_content model">默认</td>
										<td class="show_content"></td>
									</tr>
									<tr>
										<td>发起时间:</td>
										<td class="show_content time">2019-12-20 20:20:20</td>
										<td>优先级:</td>
										<td class="show_content priority">一般</td>
										<td class="show_content"></td>
									</tr>
									<tr>
										<td>用户名:</td>
										<td class="show_content user_name">李明</td>
										<td>用户电话:</td>
										<td class="show_content user_phone">13430394603</td>
										<td class="show_content"></td>
									</tr>
									<tr>
										<td>用户邮箱:</td>
										<td class="show_content user_email">liming@163.com</td>
										<td>状态:</td>
										<td class="show_content state">在途</td>
										<td class="show_content"></td>
									</tr>
									<tr> 
										<td colspan=5> 
											工单详情:
										</td>
									</tr>
									<tr> 
										<td colspan=5> 
											<p class="text-break-style1 text-font-style1 desc">如果想要在双数行中显示有什么不同的话可以使用在tr标签中使用class属性为tr-odd</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li class="page_hide">
						<div class="page2">
							<img src="img/trans1.PNG" />
						</div>
					</li>
					<li class="page_hide">
						<div class="page3">
							<table class="table-style1 clear-float">
								<tbody>
									<tr>
										<th>环节</th>
										<th>操作</th>
										<th>处理人</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>处理意见</th>
									</tr>
									<!-- <tr>
										<td>发起人</td>
										<td>创建</td>
										<td>管控组/李明</td>
										<td>2019-12-20 20:20:20</td>
										<td>2019-12-20 20:20:20</td>
										<td>请协助处理</td>
									</tr>
									<tr>
										<td>二线处理</td>
										<td>创建</td>
										<td>管控组/李明</td>
										<td>2019-12-20 20:20:20</td>
										<td>2019-12-20 20:20:20</td>
										<td>请协助处理</td>
									</tr>
									<tr>
										<td>发起人</td>
										<td>创建</td>
										<td>管控组/李明</td>
										<td>2019-12-20 20:20:20</td>
										<td>2019-12-20 20:20:20</td>
										<td>如果想要在双数行中显示有什么不同的话可以使用在tr标签中使用class属性为tr-odd</td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<span class="close">×</span>
		<div class="advise_win translat-int">
			<form id="adviseForm" action="dealWorkOrderOfComm.do" method="post">
				<input type="hidden" class="ts_id" name="order_id"/>
				<input type="hidden" class="operate" name="operate"/>
				<div class="advise_title" ><h1>提交工单</h1></div>
				<div class="evaluate clear-float">
					<div>
						<input type="checkbox" value="非常满意" onclick="checkClick(this)"/>
						<span>非常满意</span>
					</div>
					<div>
						<input type="checkbox" value="满意" onclick="checkClick(this)"/>
						<span>满意</span>
					</div>
					<div>
						<input type="checkbox" value="一般" onclick="checkClick(this)"/>
						<span>一般</span>
					</div>
					<div>
						<input type="checkbox" value="未解决" onclick="checkClick(this)"/>
						<span>未解决</span>
					</div>
				</div>
				<div class="advise_to">
					<select class="part">
					</select>
					<select name="group" class="group">
					</select>
				</div>
				<div class="advise_input clear-float">
					<textarea name="advise" class="textarea-style1"></textarea>
				</div>
	
				<div class="advise_button">
					<input type="submit" value="确认" class="btn ripple btn-success">
					<input type="button" value="重置" class="btn ripple btn-success">
				</div>
			</form>
		</div>
		
	</div>
	<script src="js/MyjsV0-8.2.js"></script>
	<script>
	var jsonData = $$.json.toJSON(${data});
	//初始化按钮
	var jsonOparateModel = $$.json.toJSON(jsonData.get("part_name"));
	var createButtonData = undefined;
	var createButtonAttachedData; //{弹出框标识, 组标识， 操作号}
	console.log(jsonOparateModel.get("accept_group_id") + " " + jsonOparateModel.get("emp_group_id"));
	if(jsonOparateModel.get("emp_id") == 0){
		//state = 0 在途
		//state = 1 归档 收藏
		//未领取工单
		if(jsonOparateModel.get("state") == 1 
			&& jsonOparateModel.get("accept_group_id") == jsonOparateModel.get("emp_group_id")){
			createButtonData = ["签收"];
			createButtonAttachedData = [[0, 0, 8]];
		}
	} else {
		if(jsonOparateModel.get("accept_group_id") == jsonOparateModel.get("emp_group_id")){
			//其他工单
			createButtonData = ["提交", "退回", "转他人处理"]; //默认复核
			createButtonAttachedData = [[1, 4, 1], [1, 4, 5], [1, 4, 2]];
			switch(jsonOparateModel.get("part_name")){
				case "一线处理" :
					createButtonData = ["提交", "退回", "转他人处理"];
					createButtonAttachedData = [[1, 1, 3], [1, 1, 5], [1, 1, 2]];
					break;
				case "受理" :
					createButtonData = ["归档", "重派"];//"挂起", , "废弃"
					createButtonAttachedData = [[1, 2, 7], [1, 2, 6]];
					break;
				case "二线处理" : 
					createButtonData = ["提交", "转他人处理"];
					createButtonAttachedData = [[1, 3, 4], [1, 4, 2]];
					break;
			}
		}
	}
	console.log(createButtonData);
	if(createButtonData != undefined)
		createOperateButton(createButtonData, createButtonAttachedData);
	function createOperateButton(arr, addArr){
		for(var i = 0, len = arr.length; i < len; i++){
			$$.cre("input").attr("value", arr[i])
				.attr("type", "button")
				.attr("data-dialog-sign", addArr[i][0])
				.attr("data-group", addArr[i][1])
				.attr("data-operate", addArr[i][2])
				.attr("class", "btn ripple btn-success")
				.attr("onclick", "clickOperrateButton(this)")
				.appendTo($(".operate_button").eq(0));
		}
	}
	/* 提交、退回、分派、签收按钮的点击  */
	/*
	function order_click(type){
		$("#myModal").cssKV("display", "block");
		//$(".advise_win").eq(0).removeClass("dialog-in-scale").addClass("dialog-out-scale");
		$(".advise_win").eq(0).addClass("translat-out");
	}
	*/
	function clickOperrateButton(e){
		//按钮点击
		//需要区分出点击的是 什么操作生成 输入界面
		//data-dialog-sign data-group data-operate
		if(e.attr("data-dialog-sign") != 0){
			//打开弹窗
			$("#myModal").cssKV("display", "block");
			//$(".advise_win").eq(0).removeClass("dialog-in-scale").addClass("dialog-out-scale");
			$(".advise_win").eq(0).addClass("translat-out");
			$(".advise_title h1").eq(0).text(e.value+"工单");
			$(".operate").eq(0).value = e.attr("data-operate");
		} else {
			//签收和收藏
			console.log("收藏");
			link.local("takeWorkOrder.do?"+
					"orderId="+$(".ts_id").eq(0).value);
		}
	}
	
	//初始化数据
	if(jsonData != undefined)
	{
		var jsonOrderDetail = $$.json.toJSON(jsonData.get("order_detail"));
		$(".ts_id").eq(0).value = jsonOrderDetail.get("id");
		$(".order_id").eq(0).text($$.util.fillString(jsonOrderDetail.get("id"), 6));
		$(".name").eq(0).text(jsonOrderDetail.get("name"));
		$(".priority").eq(0).text(jsonOrderDetail.get("priority"));
		$(".time").eq(0).text(jsonOrderDetail.get("time"));
		$(".title").eq(0).text(jsonOrderDetail.get("title"));
		$(".user_email").eq(0).text(jsonOrderDetail.get("user_email"));
		$(".user_name").eq(0).text(jsonOrderDetail.get("user_name"));
		$(".user_phone").eq(0).text(jsonOrderDetail.get("user_phone"));
		$(".desc").eq(0).text(jsonOrderDetail.get("desc"));
		$(".type").eq(0).text(jsonOrderDetail.get("type"));
		$(".model").eq(0).text(jsonOrderDetail.get("model"));
		var jsonOrderProcess = jsonData.get("order_process");
		if(jsonOrderProcess != undefined){
			jsonOrderProcess.forEach(function(item){
				var tr = $$.cre("tr");
				$$.cre("td").text(item.get("part")).appendTo(tr);
				$$.cre("td").text(item.get("oparate")).appendTo(tr);
				$$.cre("td").text(item.get("responce")).appendTo(tr);
				$$.cre("td").text(item.get("start_time")).appendTo(tr);
				$$.cre("td").text(item.get("end_time")).appendTo(tr);
				$$.cre("td").text(item.get("advise")).appendTo(tr);
				tr.appendTo($(".page3 tbody").eq(0));
			});
		}
	}
	
	liEvent_2.extends(LiEventSuper);
	function liEvent_2(data){
		LiEventSuper.call(this, data);

		this.overEventCss = function (i){
			data.liElements[i].css("background:#555; color:#fff;", false); 
		}
		//当前移出样式设置
		this.outEventCss = function (i){
			data.liElements[i].css("background:#fff; color:#555;", false); 
		}
		//e {i:preIndex}
		this.preClickFun = function (i){
			data.liElements[i].css("background:#fff; color:#555;", false);
		}
		//设置当前的元素 
		//e {i:i}
		this.nowClickFun = function (i){
			data.liElements[i].css("background:#555; color:#fff;", false);
			console.log("nowlcick:"+i);
			var ee = $(".work_order_content_ul li").eq(i).siblings();
			ee.removeClass("page_out"); ee.addClass("page_hide");
			$(".work_order_content_ul li").eq(i).removeClass("page_hide").addClass("page_out");
		}
	}
	
	//左栏选择内容
	new liEvent_2({
		liElements:$(".nav-pills")[0].$("li"),
		cntElements:[],
		codes:["0000", "0001", "0002", "0003", "0004", "0005"],
	}).doReady();

	/* 模态框 */
	$(".close").eq(0).onclick = function(){
		//$("#myModal").cssKV("display", "none");
		//$(".advise_win").eq(0).removeClass("dialog-out-scale").addClass("dialog-in-scale");
		$(".advise_win").eq(0).removeClass("translat-out");
		setTimeout(function(){
			$("#myModal").cssKV("display", "none");
		}, 300);
	}
	
	$("#myModal").onclick = function(e){
		if(e.target.attr("class") == "modal"){
			
			//$(".advise_win").eq(0).removeClass("dialog-out-scale").addClass("dialog-in-scale");
			$(".advise_win").eq(0).removeClass("translat-out");
			setTimeout(function(){
				$("#myModal").cssKV("display", "none");
			}, 300);
		}
	}

	/* 评价 */
	$(".evaluate input").eq(0).checked = true;
	function checkClick(e){
		//console.log(e.parent("div").tName());
		e.parent("div").siblings().forEach(function(item, i){
			//console.log("index"+i+item.tName());
			item.$("input").eq(0).checked = false;
		});
	}
	//选择联动组件
	var GROUP_ARR = [];
	//初始化
	crePartOption(jsonData.get("group_data"));
	creatGroupOption(GROUP_ARR[$(".part").eq(0).value]);
	//该表事件
	$(".part").eq(0).onchange = function(e){
		//if($(".group option").length > 0) $(".group option").remove();
		var groupOptions = $(".group").eq(0).$("option");
		if(groupOptions != undefined) groupOptions.remove();
		creatGroupOption(GROUP_ARR[e.target.value]);
	}
	//创建环节option
	function crePartOption(jsonArr){
		for(var i = 0, len = jsonArr.length(); i < len; i++){
			var object = jsonArr.getJSONObject(i);
			createOption(object.get("part_name"), object.get("id"))
				.appendTo($(".part").eq(0));
			GROUP_ARR[object.get("id")] = object.get("group_");
		}
	}
	//创建组option
	function creatGroupOption(jsonArr){
		for(var i = 0, len = jsonArr.length(); i < len; i++){
			var object = jsonArr.getJSONObject(i);
			createOption(object.get("g_name"), object.get("id"))
				.appendTo($(".group").eq(0));
		}
	}
	//创建option
	function createOption(text, value){
		return $$.cre("option").attr("value", value).attr("label", text);
	}
	
	//提交建议
	$("#adviseForm").onsubmit = function (){
		if($(".advise_input textarea").eq(0).value == "" 
			|| $(".advise_input textarea").eq(0).value == undefined){
			console.log("eee" + $(".advise_input textarea").eq(0).text());
			return false;
		}
		
	}
	
	</script>
 </body>
</html>