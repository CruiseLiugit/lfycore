<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <jsp:include page="./header.jsp"></jsp:include>
  

<body scroll="no">
	<div id="layout">
	
		<!-- topbar starts -->
		<jsp:include page="./top.jsp"></jsp:include>
		<!-- topbar ends -->
	
	
	<div class="container-fluid" style="margin-top: 20px;">
		<div class="row-fluid">
			<!-- left menu starts -->
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<!-- left menu ends -->	
		
		<!-- container begin  -->
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<!-- 右侧隐藏提示文字 -->
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<div class="alertInfo">
								<h2><a href="#" target="_blank">留夫鸭CRM核心管理系统使用手册(PDF)</a></h2>
								<a href="#" target="_blank">留夫鸭CRM核心管理系统演示视频</a>
							</div>
							<!-- 
							<div class="right">
								<p><a href="doc/dwz-user-guide.zip" target="_blank" style="line-height:19px">DWZ框架使用手册(CHM)</a></p>
								<p><a href="doc/dwz-ajax-develop.swf" target="_blank" style="line-height:19px">DWZ框架Ajax开发视频教材</a></p>
							</div> -->
							<p>留夫鸭CRM核心管理系统</p>
							<p>留夫鸭在线订餐系统:<a href="#" target="_blank">www.liufuya.com</a></p>
						</div>
						
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">
							<!-- 
							<p style="color:red">DWZ官方微博 <a href="#" target="_blank">http://weibo.com/dwzui</a></p>
							<p style="color:red">DWZ官方微群 <a href="#" target="_blank">http://q.weibo.com/587328/invitation=11TGXSt-148c2</a></p>
							 -->
							 
							 
							<!-- 分割线 -->
							<!-- 
							<div class="divider"></div>
							<h2>dwz v1.2视频教程:</h2>
							<p><a href="http://www.u-training.com/thread-57-1-1.html" target="_blank">http://www.u-training.com/thread-57-1-1.html</a></p>
							 -->
						</div>
						
						<!--  右侧弹出广告，暂时隐藏 
						<div style="width:230px;position: absolute;top:60px;right:0" layoutH="80">
							<iframe width="100%" height="430" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?width=0&height=430&fansRow=2&ptype=1&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=1739071261&verifier=c683dfe7"></iframe>
						</div>
						-->
					</div>
					
				</div>
			</div>
		</div>
		<!-- container end -->
		
		</div>
	</div>
		
	</div>
	<!-- layout end -->

	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
		
	
	
	
</body>
</html>