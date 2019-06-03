<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Author" content="cjw">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>工单管理</title>
  <link type="text/css" rel="stylesheet" href="css/basi.css" />
  <link type="text/css" rel="stylesheet" href="css/MyCss.css">
  <style>
	a {color: #555;}
	/* con */
	.con > div {float: left; position: relative; }
	/* nav */
	.con >.nav {background: #fff; width: 13%; height: 739px;}
	.con >.nav li {color: #555; width: 100%; line-height: 25px; text-align: center; cursor: pointer;}
	.con >.nav li a {padding: 8px 0;}
	/* con_ */
	.con >.con_ {background: #fff; width: 86%; height: 739px; margin-left: 10px;}
	.con >.con_ >.search {position: relative; height: 80px; padding: 10px;}
	.con >.con_ >.order_list {position: relative; height: 587px; padding: 10px;}

	.con >.con_ >.page_control { position: absolute; right: 10px;}
	.con >.con_ >.page_control >.page_control_left_bt,
	.con >.con_ >.page_control >.page_control_right_bt{line-height: 20px;}
	
	.con >.con_ >.page_control > div {float: left; text-align: center; cursor: pointer;}
	.con >.con_ >.page_control >.page_control_bts {padding-left: 4px; padding-right: 4px;}
	.con >.con_ >.page_control >.page_control_bts span{display: block; padding: 0px 6px;  text-align: center; line-height: 20px; float: left; margin-left: 2px; margin-right: 2px;}
	.con >.con_ >.page_control >.page_control_bts span:hover,
	.con >.con_ >.page_control >.page_control_left_bt:hover,
	.con >.con_ >.page_control >.page_control_right_bt:hover {border: 1px solid #30a5da;}
	
	
	.page_ctl_click {padding: 2px; padding: 0px 6px; border: 1px solid #30a5da; background: #30a5da; border-radius: 6px; color: #fff;}
	.page_ctl_comm { padding: 2px; padding: 0px 6px; border: 1px solid #c5b7b7; color: #888; background: #fff; border-radius: 6px;}
	
	.table-style1 td, .table-style1 th {width: 115px; text-align: center; color: #888;}
	
	
	.table-style2 {}

	/* search 查找控件 */
	.search > div {float: left; color: #888;}
	.search > div:nth-child(1) {width: 669px;}
	.search > div:nth-child(2) {padding: 6px 20px;}
	.search_select_area {overflow: hidden; margin-top: 6px;}
	.search_select_area > div{ float: left; position: relative; margin-left: 14px;}
	.search_select_area > div span {margin-left: 18px; font-size: 14px;}
	.search_select_area > div input {position: absolute; top: 4px;}

	.input-text {border: 1px solid rgba(51, 153, 255, 0.63); border-radius: 3px; padding: 0 15px;}
	.input-text:focus {border: 1px solid #3399ff;}
	.ser_sure, .ser_reset {margin-top: 6px; height: 33px; width: 110px;}
	.ser_reset {margin-left: 9px;}
	/* order_list 工单列表 */
	.list {}
	.list .list_item:hover {box-shadow: 0px 0px 6px 1px #ddd; cursor: pointer;}
	
	.list_item, .list_head {overflow: hidden;}
	.list_head {border-bottom: 1px solid #c5b7b7; border: 1px solid #dfdfdf; background: #dfdfdf;}
	.list_item > li, .list_head > li { padding: 15px 13px; text-align: center; color: #888;}
	.list_item > li {border-bottom: 1px solid #f0f0f0!important;}
	.comm_li {width: 115px;}
	.min_li {width: 60px;}
	.max_li {width: 170px;}


  </style>
 </head>
 <body>
	<div class="cnt clear-float top">
		<div class="cnt_in">
			<ul class="nolist nav-pills">
				<li>
					<h1 onclick="clickToMain()">工单管理系统</h1>
				</li>
				<li>
					<span>${sessionScope.employee_name}</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="cnt">
		<div class="cnt_in con">
			<div class="nav shadow_cs1">
				<ul class="nolist nav-list c_nav">
					<li><a data-type="1">未领取工单</a></li>
					<li><a data-type="2">已领取工单</a></li>
					<li><a data-type="3">已提交在途工单</a></li>
					<li><a data-type="4">已提交归档工单</a></li>
					<li><a data-type="5">所有已提交工单</a></li>
				</ul>
			</div>
			<div class="con_ shadow_cs1">
				<div class="search">
					<!--
					状态查找
					优先级 低 一般 紧急 非常紧急
					标题 工单编号
					
					-->
					<div>
						<div class="search_select_area">
							<div>
								<input type="checkbox" data-type="type" value="title" onclick="checkClick(this)"/> 
								<span>标题查找</span>
							</div>
							<div>
								<input type="checkbox" data-type="type" value="id" onclick="checkClick(this)"/> 
								<span>工单编号查找</span>
							</div>
						</div>
						<div class="search_select_area">
							<div>
								<input data-type="priority" value="1" type="checkbox" onclick="checkClick(this)"/> 
								<span>低</span>
							</div>
							<div>
								<input data-type="priority" value="2" type="checkbox" onclick="checkClick(this)"/> 
								<span>一般</span>
							</div>
							<div>	
								<input data-type="priority" value="3" type="checkbox" onclick="checkClick(this)"/> 
								<span>紧急</span>
							</div>
							<div>
								<input data-type="priority" value="4" type="checkbox" onclick="checkClick(this)"/> 
								<span>非常紧急</span>
							</div>
						</div>
						<div class="search_select_area">
							<div>
								<input type="checkbox" data-type="state" value="1" onclick="checkClick(this)"/> 
								<span>在途</span>
							</div>
							<div>
								<input type="checkbox" data-type="state" value="2" onclick="checkClick(this)"/> 
								<span>归档</span>
							</div>
						</div>
					</div>
					<div>
						<form id="search_form" action="" method="post">
							<!-- value="title/id" -->
							<input type="hidden" class="type" name="type" />
							<input type="hidden" class="search_type" name="search_type" />
							<input type="hidden" class="search_priority" name="search_priority" />
							<input type="hidden" class="search_state" name="search_state" />
							<input class="input-text" type="text" name="search_content" placeholder="请输入查找信息"/>
							<input class="btn ripple btn-success ser_sure" type="submit" value="查找" />
							<input class="btn ripple btn-warning ser_reset" type="button" value="重置" />
						</form>
					</div>
				</div>
				<div class="order_list">
					<div class="order_list_cnt">
						<ul class="list nav">
							<li>
								<ul class="list_head nav-pills nolist">
									<li class="comm_li">工单编号</li>
									<li class="min_li">优先级</li>
									<li class="comm_li">标题</li>
									<li class="max_li">发起时间</li>
									<li class="comm_li">状态</li>
									<li class="comm_li">工单分类</li>
									<li class="comm_li">发起人</li>
								</ul>
							</li>
						</ul>
						<!-- 工单编号 优先级 标题 发起时间 模板类型 工单分类 发起人 -->
						<!-- <table class="table-style1">
							<tbody>
								<tr>
									<th>工单编号</th>
									<th>优先级</th>
									<th>标题</th>
									<th>发起时间</th>
									<th>模板类型</th>
									<th>工单分类</th>
									<th>发起人</th>
								</tr>
								<tr>
									<td>000001</td>
									<td>低</td>
									<td>测试数据</td>
									<td>2019-12-20 20:20:20</td>
									<td>默认</td>
									<td>默认</td>
									<td>管控组/李明</td>
								</tr>
							</tbody>
						</table> 
						<ul class="list nav">
							<li>
								<ul class="list_head nav-pills nolist">
									<li class="comm_li">工单编号</li>
									<li class="min_li">优先级</li>
									<li class="comm_li">标题</li>
									<li class="max_li">发起时间</li>
									<li class="comm_li">状态</li>
									<li class="comm_li">工单分类</li>
									<li class="comm_li">发起人</li>
								</ul>
							</li>
							<li>
								<ul class="list_item nav-pills nolist">
									<li class="comm_li">000001</li>
									<li class="min_li">测试数据</li>
									<li class="comm_li">标题</li>
									<li class="max_li">2019-12-20 20:20:20</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">管控组/李明</li>
								</ul>
							</li>
							<li>
								<ul class="list_item nav-pills nolist">
									<li class="comm_li">000001</li>
									<li class="min_li">测试数据</li>
									<li class="comm_li">标题</li>
									<li class="max_li">2019-12-20 20:20:20</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">管控组/李明</li>
								</ul>
							</li>
							<li>
								<ul class="list_item nav-pills nolist">
									<li class="comm_li">000001</li>
									<li class="min_li">测试数据</li>
									<li class="comm_li">标题</li>
									<li class="max_li">2019-12-20 20:20:20</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">管控组/李明</li>
								</ul>
							</li>
							<li>
								<ul class="list_item nav-pills nolist">
									<li class="comm_li">000001</li>
									<li class="min_li">测试数据</li>
									<li class="comm_li">标题</li>
									<li class="max_li">2019-12-20 20:20:20</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">默认</li>
									<li class="comm_li">管控组/李明</li>
								</ul>
							</li>
						</ul>
						-->
					</div>
				</div>
				<div class="page_control">
					<div class="page_control_left_bt page_ctl_comm" onclick="pageControlNextPreClick(this)" data-type="0">上一页</div>
					<div class="page_control_bts">
						
						<span class="page_ctl_comm" onclick="pageControlClick(this)" data-page-num="1">1</span>
						<span class="page_ctl_comm" onclick="pageControlClick(this)" data-page-num="2">2</span>
						
					</div>
					<div class="page_control_right_bt page_ctl_comm" onclick="pageControlNextPreClick(this)" data-type="1">下一页</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/MyjsV0-8.2.js"></script>
	<script>
	var jsonData = $$.json.toJSON(${data});

	//左栏选择内容 创建左栏和初始化左栏
	var liEvent = new liEvent_2({
		liElements:$(".c_nav a"),
		cntElements:[],
		initIndex:jsonData.get("index")-1,
		codes:["0000", "0001", "0002", "0003", "0004", "0005"],
	}).doReady();
	//基本参数
	var PAGE_SIZE = 9		//页的容纳量
	var DEFAULT_PAGE = 1; 	//默认当前页
	//初始化工单列表
	createOrderList(getOrderByPage(jsonData.get("data"), DEFAULT_PAGE, 
			PAGE_SIZE));
	//初始化页面控件 页码数 当前页面数
	pageControlinit(jsonData.get("data") == undefined 
				? 1 
				: Math.ceil(jsonData.get("data").length()/PAGE_SIZE), 
			DEFAULT_PAGE);
	//初始化检索
	if(jsonData.get("index") > 2)
		$("#search_form").attr("action", "commiteWorkOrder.do");
	else
		$("#search_form").attr("action", "receiveWorkOrder.do");
	$(".type").eq(0).value = $(".c_nav a").eq(jsonData.get("index")-1).attr("data-type");
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
			var type = data.liElements[i].attr("data-type");
			if(type > 2){
				link.local("commiteWorkOrder.do?type="+type);
				console.log($("#search_form"));
				$("#search_form").attr("action", "commiteWorkOrder.do?type="+type);
			} else {
				link.local("receiveWorkOrder.do?type="+type);
				$("#search_form").attr("action", "receiveWorkOrder.do?type="+type);
			}
			
		}
	}
	
	/*
	  按钮控件
	  pageControlClick		点击事件 处理样式
	  pageControlDeal		点击页码时 具体处理
	  pageControlinit		初始化
	  pageControlSelect		选页		
	  pageControlPageLen	页面的数量
	* */
	var pageControlCurrent;
	//按钮控件 点击事件
	function pageControlClick(e){
		if(e.attr("class") != "page_ctl_click"){
			var ee = $(".page_control_bts").eq(0).childs();
			ee.removeClass("page_ctl_click");
			ee.addClass("page_ctl_comm");
			e.removeClass("page_ctl_comm");
			e.addClass("page_ctl_click");
			pageControlDeal(e, e.attr("data-page-num"));
			pageControlCurrent = parseInt(e.attr("data-page-num"));
			createOrderList(getOrderByPage(jsonData.get("data"), 
					e.attr("data-page-num"), 
					PAGE_SIZE));
		}
	}
	//点击页码时 具体处理
	function pageControlDeal(e, i){
		//进行详细处理
		console.log(e + ";" + i);
	}
    //初始化 allPageNum 页面总合 currentPageNum 当前页码
	function pageControlinit(allPageNum, currentPageNum){
		pageControlCurrent = currentPageNum;
		var p = $(".page_control_bts").eq(0);
		var item = undefined;
		while((item = p.first()) != undefined){
			item.remove();
		}
		//创建
		for(var i = 0; i < allPageNum; i++){
			$$.cre("span").addClass("page_ctl_comm").attr("onclick", "pageControlClick(this)") .attr("data-page-num", i+1).text(i+1).appendTo(p);
		}
		//选中
		pageControlSelect(currentPageNum);
	}
	//选页
	function pageControlSelect(pageNum){
		if($(".page_control_bts").eq(0).childs().eq(pageNum-1) !=  undefined)
		$(".page_control_bts").eq(0).childs().eq(pageNum-1).removeClass("page_ctl_comm").addClass("page_ctl_click");
	}
	//页面的数量
	function pageControlPageLen(){
		return $(".page_control_bts").eq(0).childs().length;
	}

	function pageControlNextPreClick(e){
		//下标要注意
		if(e.attr("data-type") == 0){
			if(pageControlCurrent == 1){
				alert("已是第一页咯，不能再前了");
			} else {
				//当前恢复
				pageControlOrigCss($(".page_control_bts span").eq(pageControlCurrent - 1));
				//上一个选中
				pageControlClickCss($(".page_control_bts span").eq(pageControlCurrent - 2));
				pageControlCurrent -= 1;
				pageControlDeal($(".page_control_bts span").eq(pageControlCurrent - 1), pageControlCurrent);
			}
		} else {
			if(pageControlCurrent == pageControlPageLen()){
				alert("已是最后一页咯，不能再后了");
			} else {
				//当前恢复
				pageControlOrigCss($(".page_control_bts span").eq(pageControlCurrent - 1));
				//下一个选中
				pageControlClickCss($(".page_control_bts span").eq(pageControlCurrent));
				pageControlCurrent += 1;
				pageControlDeal($(".page_control_bts span").eq(pageControlCurrent-1), pageControlCurrent);
			}
		}
	}
	function pageControlOrigCss(e){
		e.removeClass("page_ctl_click").addClass("page_ctl_comm");
	}
	function pageControlClickCss(e){
		e.removeClass("page_ctl_comm").addClass("page_ctl_click");
		createOrderList(getOrderByPage(jsonData.get("data"), 
				e.attr("data-page-num"), 
				PAGE_SIZE));
	}

	/*
	检索功能
	数据库资料	https://blog.csdn.net/hekaikai666/article/details/82765012
	*/
	
	function checkClick(e){
		//console.log(e.parent("div").tName());
		$(".search_"+e.attr("data-type")).eq(0).value = e.value;
		e.parent("div").siblings().forEach(function(item, i){
			//console.log("index"+i+item.tName());
			item.$("input").eq(0).checked = false;
		});
	}

	/*
	创建工单列表
	容器 order_list_cnt
	删除 容器中的ul
	*/
	function createOrderList(jsonArrOfOrderData){
		//数据准备
		var headJOjbect = getJson(["工单编号", "优先级", "标题", "发起时间", "状态", "类型", "发起人"]);
		//标题行的创建
		if($(".order_list_cnt ul").eq(0)!=undefined) $(".order_list_cnt ul").eq(0).remove();
		var list_ul = $$.cre("ul").addClass("list nav").appendTo($(".order_list_cnt").eq(0));
		createHeadItemMudel(headJOjbect).appendTo(list_ul); //创建标题
		
		//工单列表的创建
		if(jsonArrOfOrderData != null)
			jsonArrOfOrderData.forEach((item) => createItemMudel(item).appendTo(list_ul));
	}
	
	//分页显示 获取特定的jsonArr数据
	function getOrderByPage(jsonArr, currentPage, pageSize){
		if(jsonArr != undefined) {
			return jsonArr.subJSONArray((currentPage-1)*pageSize, 
					(currentPage*pageSize > jsonArr.length() 
							? jsonArr.length()
							: currentPage*pageSize));
		}	
	}
	
	/*
	createLiMudel(headJOjbect).appendTo(list_ul);
	*/
	function createItemMudel(jsonObject){
		var li = $$.cre("li").attr("onclick", "clickToOrder(this)");
		var ul = $$.cre("ul").addClass("list_item nav-pills nolist").appendTo(li);
		createLisMudel(jsonObject, ul);
		return li;
	}
	function createHeadItemMudel(jsonObject){
		var li = $$.cre("li");
		var ul = $$.cre("ul").addClass("list_head nav-pills nolist").appendTo(li);
		createLiMudel("comm_li", jsonObject.get("id")).appendTo(ul);
		createLiMudel("min_li", jsonObject.get("priority")).appendTo(ul);
		createLiMudel("comm_li", jsonObject.get("title")).appendTo(ul);
		createLiMudel("max_li", jsonObject.get("time")).appendTo(ul);
		createLiMudel("comm_li", jsonObject.get("state")).appendTo(ul);
		createLiMudel("comm_li", "工单类型").appendTo(ul);
		createLiMudel("comm_li", jsonObject.get("accep")).appendTo(ul);
		return li;
	}
	function createLisMudel(jsonObject, ul){
		createLiMudel("comm_li", $$.util.fillString(jsonObject.get("id"), 6)).appendTo(ul);
		createLiMudel("min_li", jsonObject.get("priority")).appendTo(ul);
		createLiMudel("comm_li", jsonObject.get("title")).appendTo(ul);
		createLiMudel("max_li", jsonObject.get("time")).appendTo(ul);
		createLiMudel("comm_li", jsonObject.get("state")).appendTo(ul);
		createLiMudel("comm_li", "默认").appendTo(ul);
		createLiMudel("comm_li", jsonObject.get("accep")).appendTo(ul);
	}
	function createLiMudel(className, text){
		return $$.cre("li").addClass(className).text(text);
	}
	function getJson(arr){
		return $$.json.toObject('{"id":"'+arr[0]+'","priority":"'+arr[1]+'","title":"'+arr[2]+'","time":"'+arr[3]+'","state":"'+arr[4]+'","type":"'+arr[5]+'","accep":"'+arr[6]+'"}'); 
	}
	//点击进入工单页
	function clickToOrder (e){
		e.remove();
		link.open("workOrderDetail.do?order_id="+Number(e.$("li").eq(0).text()));
	}
	
	function clickToMain(){
		link.local("toMain.do");
	}
	
	</script>
 </body>
</html>