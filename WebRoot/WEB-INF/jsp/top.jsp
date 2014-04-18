<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="${base}/index.html"> <img alt="留夫鸭Logo" src="${base}/img/logo20.png" /> <span>订餐管理系统</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> 切换主题 / 皮肤</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> 经典</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> 天蓝色</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> 太空黑</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> 桃红色</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> 优雅白</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> 浅灰色</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> 深灰色</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> 鲜橙色</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> 用户名</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">个人设置</a></li>
						<li class="divider"></li>
						<li><a href="${base}/login.html">登出系统</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="#">搜索</a></li>
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
