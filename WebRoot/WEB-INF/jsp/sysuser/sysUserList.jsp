<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <jsp:include page="../header.jsp"></jsp:include>
  
<body>
	<!-- topbar starts -->
	<jsp:include page="../top.jsp"></jsp:include>
	<!-- topbar ends -->

	<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<jsp:include page="../leftmenu.jsp"></jsp:include>
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">警告!</h4>
					<p>你需要设置浏览器属性，启用 <a href="http://zhidao.baidu.com/link?url=QKMUIZG0TZgGAVBieVGq27S1nfsySMHeZn55coS1Wd22IuDzOBWNfzug6_nDfzb4Y6a4KvFeZXY43Ulz39bUfa" target="_blank">JavaScript</a> .</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			
			
			
			

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">权限管理</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">用户管理</a>
					</li>
				</ul>
			</div>
			
			
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> 用户管理</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					
					
					
					
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable">
						  <thead>
							  <tr>
								  <th>姓名</th>
								  <th>邮箱</th>
								  <th>电话</th>
								  <th>类型</th>
								  <th>创建时间</th>
								  <th>操作</th>
							  </tr>
						  </thead>   
						  <tbody>
							<tr>
								<td>刘柳</td>
								<td>126762@126.com</td>
								<td class="center">15051676451</td>
								<td class="center">
									<span class="label label-success">系统</span>
								</td>
								<td class="center">2012/01/01</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in icon-white"></i>  
										查看                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit icon-white"></i>  
										编辑                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash icon-white"></i> 
										删除
									</a>
								</td>
							</tr>
							<tr>
								<td>柳娟</td>
								<td>sdfd762@126.com</td>
								<td class="center">1806152653</td>
								<td class="center">
									<span class="label label-warning">商家</span>
								</td>
								<td class="center">2012/01/01</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="icon-zoom-in icon-white"></i>  
										查看                                            
									</a>
									<a class="btn btn-info" href="#">
										<i class="icon-edit icon-white"></i>  
										编辑                                            
									</a>
									<a class="btn btn-danger" href="#">
										<i class="icon-trash icon-white"></i> 
										删除
									</a>
								</td>
							</tr>
							
							
						  </tbody>
					  </table>            
					
						<div class="pagination pagination-centered">
						  <ul>
							<li><a href="#">上一页</a></li>
							<li class="active">
							  <a href="#">1</a>
							</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">下一页</a></li>
						  </ul>
						</div>  
						
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
			
			
			

					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>
 
		<jsp:include page="../footer.jsp"></jsp:include>
	</div><!--/.fluid-container-->

<!-- Message js lib -->	
<script type="text/javascript" src="${base}/build/js/messenger.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
						//选择好弹出框的样式
						//从上面弹出 样式为 flat  future  block air ice
						$._messengerDefaults = {
							extraClasses : 'messenger-fixed messenger-on-bottom messenger-on-right',
							theme:'air'
						};
						
						
		});
		
</script>
		


</body>
</html>