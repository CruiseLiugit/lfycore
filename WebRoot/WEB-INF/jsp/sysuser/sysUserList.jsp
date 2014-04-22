<%@ page language="java" import="java.util.*,com.liufuya.common.util.DateUtil" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
					
					<div class="row-fluid" style="margin-top:6px;">
						<div class="span6"></div>
						<div class="span4">
							<div class="controls">
							<div class="input-append">
								<input id="searchSysUser" size="16" type="text" placeholder="按照姓名模糊查询" /><button class="btn" type="button">搜索</button>
							</div>
							</div>
						</div>
						<div class="span2"><button id="create-user" class="btn btn-primary">新增用户</button></div>
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
						  	<c:forEach var="sysuser" items="${sysuserlist}">
 								<tr>
									<td>${sysuser.userName }</td>
									<td>${sysuser.email }</td>
									<td class="center">${sysuser.userPhone }</td>
									<td class="center">
										<c:choose>
											<c:when test="${sysuser.userType eq null}">
												<span class="label label-success">系统</span>		
											</c:when>
											<c:when test="${sysuser.userType == 1}">
												<span class="label label-success">系统</span>		
											</c:when>
											<c:when test="${sysuser.userType == 2}">
												<span class="label label-warning">商家</span>	
											</c:when>
											<c:otherwise>
												<span class="label label-important">未知</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="center"><fmt:formatDate value="${sysuser.createDate }" pattern="yyyy-MM-dd" /></td>
									<td class="center">
										<a class="btn btn-success" href="javascript:void(0)"  onclick="javascript:see(${sysuser.id })">
										<i class="icon-zoom-in icon-white"></i>查看</a>
										<a class="btn btn-info" href="javascript:void(0)" onclick="javascript:edit(${sysuser.id })">
										<i class="icon-edit icon-white"></i>编辑</a>
										<a class="btn btn-danger" href="javascript:void(0)" onclick="dele(${sysuser.id })">
										<i class="icon-trash icon-white"></i>删除</a>
								</td>
							</tr>
 							</c:forEach>
 			
						  </tbody>
					  </table>            
					
						<div class="pagination pagination-centered">
						  <ul>
							<li><a href="javascript:window.history.back()">上一页</a></li>
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
			
			
			<!-- row 增加、修改用户所用的表单 div -->
			<div class="row-fluid sortable" id="create-dialog-form" title="新增系统用户">
				
					<div class="box-content">
						<p class="validateTips" id="create_validateTips">所有的输入框都是必填项.</p>
			
					    <!-- 修改账户信息表单 -->
						<form class="form-horizontal" action="#" method="post">
							<fieldset>
							  <div class="control-group" id="realNamediv">
								<label class="control-label" for="c_realName">真实姓名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="c_realName" type="text" name="user_name" placeholder="请输入真实姓名" value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="c_loginName">用户登录名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="c_loginName" type="text" name="login_name" placeholder="请输入登录名" value="">
								</div>
							  </div>
							  
							  <div class="control-group" id="oldpwddiv">
								<label class="control-label" for="c_loginPwd">用户原始密码</label>
								<div class="controls">
								  <!-- 这里增加 ajax 异步验证 -->
								  <input class="input-xlarge disabled" id="c_loginPwd" type="text" value="123456"  disabled="">
								</div>
							  </div>
							  
							  <div class="control-group" id="maildiv">
								<label class="control-label" for="c_usermail">用户邮箱</label>
								<div class="controls">
									<span class="add-on"><i class="icon-envelope"></i></span><input  class="input-xlarge focused" type="text" id="c_usermail" name="email"  value="">
								</div>
							  </div>
							  
							  <div class="control-group" id="userphonediv">
								<label class="control-label" for="c_userphone">用户手机</label>
								<div class="controls">
									<span class="add-on"><i class="icon-user"></i></span><input  class="input-xlarge focused" type="text" id="c_userphone"  name="phone" value="">
								  <p class="help-block">该邮箱用于接收短信验证码</p>
								</div>
							  </div>
			
							 <div class="control-group">
								<label class="control-label" for="selectError3">账户类型</label>
								<div class="controls">
								  <select id="selectError3" id="c_usertype">
									<option value="1">系统用户</option>
									<option value="2">商家用户</option>
									<option value="3">其他用户</option>
								  </select>
								</div>
							  </div>
							</fieldset>
						  </form>
					</div><!--/span-->
			
			</div><!--/row-->
			
			
			
			
			<!-- row 查看用户所用的表单 div -->
			<div class="row-fluid sortable" id="see-dialog-form" title="查看系统用户信息">
				
					<div class="box-content">
					    <!-- 修改账户信息表单 -->
						<form class="form-horizontal" action="${base}/usertopEditPwd" method="post">
							<fieldset>
							  <div class="control-group" id="realNamediv">
								<label class="control-label" for="realName">真实姓名</label>
								<div class="controls">
								<div class="input-prepend">
								  <span class="add-on"><i class="icon-user"></i></span><span class="input-xlarge uneditable-input">刘立立</span>
								</div>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="loginName">用户登录名</label>
								<div class="controls">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-ok-sign"></i></span><span class="input-xlarge uneditable-input">admin</span>
								</div>
								</div>
							  </div>
							  
							  <div class="control-group" id="maildiv">
								<label class="control-label" for="usermail">用户邮箱</label>
								<div class="controls">
								  <div class="input-prepend">
									<span class="add-on"><i class="icon-envelope"></i></span><span class="input-xlarge uneditable-input">836131325@qq.com</span>
								  </div>
								</div>
							  </div>
							  
							  <div class="control-group" id="userphonediv">
								<label class="control-label" for="userphone">用户手机</label>
								<div class="controls">
								  <div class="input-prepend">
									<span class="add-on"><i class="icon-eye-open"></i></span><span class="input-xlarge uneditable-input">13877283726</span>
								  </div>
								</div>
							  </div>
			
							 <div class="control-group">
								<label class="control-label" for="selectError3">账户类型</label>
								<div class="controls">
								  <select id="selectError3">
									<option value="1">系统用户</option>
								  </select>
								</div>
							  </div>
							</fieldset>
						  </form>
					</div><!--/span-->
			
			</div><!--/row-->
			
			
			
			
			
			<!-- row  修改用户所用的表单 div -->
			<div class="row-fluid sortable" id="edit-dialog-form" title="修改系统用户">
				
					<div class="box-content">
						<p class="validateTips">所有的输入框都是必填项.</p>
					    <!-- 修改账户信息表单 -->
						<form class="form-horizontal" action="${base}/usertopEditPwd" method="post">
							<fieldset>
							  <div class="control-group" id="realNamediv">
								<label class="control-label" for="realName">真实姓名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="realName" type="text" name="user_name" placeholder="请输入真实姓名" value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="loginName">用户登录名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="loginName" type="text" name="login_name" placeholder="请输入登录名" value="">
								</div>
							  </div>
							  
							  <div class="control-group" id="oldpwddiv">
								<label class="control-label" for="oldpwd">用户原始密码</label>
								<div class="controls">
								  <!-- 这里增加 ajax 异步验证 -->
								  <input class="input-xlarge disabled" id="loginPwd" type="text" value="123456"  disabled="">
								</div>
							  </div>
							  
							  <div class="control-group" id="maildiv">
								<label class="control-label" for="usermail">用户邮箱</label>
								<div class="controls">
								  <div class="input-prepend">
									<span class="add-on"><i class="icon-envelope"></i></span><input  size="28" type="text" id="usermail" name="email" value="${sessionScope.CURRENT_LOGIN_USER.email }">
								  </div>
								</div>
							  </div>
							  
							  <div class="control-group" id="userphonediv">
								<label class="control-label" for="userphone">用户手机</label>
								<div class="controls">
								  <div class="input-prepend">
									<span class="add-on"><i class="icon-user"></i></span><input  size="28" type="text" id="userphone"  name="phone" value="${sessionScope.CURRENT_LOGIN_USER.userPhone }">
								  </div>
								  <p class="help-block">该邮箱用于接收短信验证码</p>
								</div>
							  </div>
			
							 <div class="control-group">
								<label class="control-label" for="selectError3">账户类型</label>
								<div class="controls">
								  <select id="selectError3">
									<option value="1">系统用户</option>
									<option value="2">商家用户</option>
									<option value="3">其他用户</option>
								  </select>
								</div>
							  </div>
							</fieldset>
						  </form>
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
	//------------------------------------------------
	//表格中的   查看按钮
	function see(id){
		//alert("id ="+id);
		//var seeid = id;
		$(function(){
			$( "#see-dialog-form" ).dialog( "open" );	
		});
	}

	//------------------------------------------------
	//表格中的   修改按钮
	function edit(id){
		//alert("id ="+id);
		//var seeid = id;
		$(function(){
			$( "#edit-dialog-form" ).dialog( "open" );	
		});
	}
	
	//------------------------------------------------
	//表格中的   删除按钮
	function dele(id){
		//alert("id ="+id);
		//var seeid = id;
		
	}
	
	

	
	$(document).ready(function(){
						//选择好弹出框的样式
						//从上面弹出 样式为 flat  future  block air ice
						$._messengerDefaults = {
							extraClasses : 'messenger-fixed messenger-on-bottom messenger-on-right',
							theme:'air'
						};
						
						//---------------------------------------------
						//需要被验证的输入框。主要是新增用户、修改用户
						 var c_realName = $( "#c_realName" ),c_loginName = $( "#c_loginName" ),c_loginPwd = $( "#c_loginPwd" ),c_usermail = $( "#c_usermail" ),c_userphone = $( "#c_userphone" ),c_usertype = $( "#c_usertype" ),allCFields = $( [] ).add( c_realName ).add( c_loginName ).add(c_usermail).add(c_userphone),tips = $("#create_validateTips" );
						
						//------------------------------------------------
							//输入校验函数
							//更新提示内容
							 function updateTips( t ) {
								tips.text( t ).addClass( "ui-state-highlight" );
								setTimeout(function() {
									tips.removeClass( "ui-state-highlight", 1500 );
								}, 500 );
							}
							
							function checkLength( o, n, min, max ) {
								if ( o.val().length > max || o.val().length < min ) {
									o.addClass( "ui-state-error" );
									updateTips( n + " 长度应该在 " +min + " - " + max + " 之间." );
									return false;
								} else {
									return true;
								}
							}
							
							function checkRegexp( o, regexp, n ) {
								if ( !( regexp.test( o.val() ) ) ) {
									o.addClass( "ui-state-error" );
									updateTips( n );
									return false;
								} else {
									return true;
								}
							}
						
						//---------------------------------------------
						//新增用户 div 使用 dialog 隐藏
						$("#create-dialog-form").dialog({
							 autoOpen: false,
							 height: 450,
							 width: 600,
							 modal: true,
							 buttons: {
							 	"新增": function() {
								 	//输入验证
							 		 var bValid = true;
							 		allCFields.removeClass( "ui-state-error" );
									bValid = bValid && checkLength( c_realName, "真实姓名", 1, 16 );
									bValid = bValid && checkLength( c_loginName, "登录名", 3, 16 );
									bValid = bValid && checkLength( c_usermail, "认证邮箱", 6, 80 );
									//bValid = bValid && checkLength( c_userphone, "手机号码", 10, 12 );
									
//bValid = bValid && checkRegexp( c_realName, /^[\\S]+$/i, "真实姓名不能为空." );
bValid = bValid && checkRegexp( c_loginName, /^[a-z]([0-9a-z_])+$/i, "登录名应该包含 a-z, 0-9, 下划线, 并且以字母开头." );
// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
bValid = bValid && checkRegexp( c_usermail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "例如. hello@liufuya.com" );
bValid = bValid && checkRegexp( c_userphone, /^\d{11}$/, "请输入 11 位手机号码" );

									if ( bValid ) {
											//Ajax 异步请求，增加用户到数据库
											////////
											$.ajax({
												//防止提交乱码
												type:"post",
												url:"${base}/createSysUser",
												//手动提交数据
												data:{"user.userName":c_realName.val(),"user.loginName":c_loginName.val(),"user.logPwd":c_loginPwd.val(),"user.email":c_usermail.val(),"user.userPhone":c_userphone.val(),"user.userType":c_usertype.val(),},
												//自动序列化表单中的数据
												//data:$("#login_form").serialize(),
												dataType:"json",
												success:function(res){
													//返回状态码 200 正确，201密码错误
													var statucode = res.status;
													
													if (res != "" && statucode == 200) {
														$.globalMessenger().post({
															message : "旧密码正确!",
															hideAfter : 2,
															type : 'success',
														});
														opwddiv.addClass("success");
													} 
													
													if (res != "" && statucode == 201) {
														$.globalMessenger().post({
															message : "旧密码错误，请重新输入!",
															hideAfter : 2,
															type : 'error',
													});
													
												}
												return false;
											},
											fail : function(res) {
												$.globalMessenger().post({
													message : "系统错误?!",
													hideAfter : 2,
													type : 'error',
												});
												return false;
											}
										});
								
										////////
											$( this ).dialog( "close" );
									}
							 	},
							 	"取消": function() {
									$( this ).dialog( "close" );
							    }
							 },close: function() {
							 	allFields.val( "" ).removeClass( "ui-state-error" );
							 }
						});
						
						//点击 新增用户 按钮
						 $( "#create-user" ).button().click(function() {
						 	$( "#create-dialog-form" ).dialog( "open" );
						 });
						
						//---------------------------------------------
						//查看用户 div 使用 dialog 隐藏
						$("#see-dialog-form").dialog({
								 autoOpen: false,
								 height: 450,
								 width: 600,
								 modal: true,
								 buttons: {
								 	"取消": function() {
										alert("点击了取消按钮");
								 		$( this ).dialog( "close" );
								    }
								 },close: function() {
									 alert("点击了关闭按钮");
								 	allFields.val( "" ).removeClass( "ui-state-error" );
								 }
							});
						
							
							
							
							
							//---------------------------------------------
							//修改用户 div 使用 dialog 隐藏
							$("#edit-dialog-form").dialog({
								 autoOpen: false,
								 height: 450,
								 width: 600,
								 modal: true,
								 buttons: {
								 	"修改": function() {
									 	alert("点击了新增按钮");
								 		$( this ).dialog( "close" );
								 	},
								 	"取消": function() {
										alert("点击了取消按钮");
								 		$( this ).dialog( "close" );
								    }
								 },close: function() {
									 alert("点击了关闭按钮");
								 	allFields.val( "" ).removeClass( "ui-state-error" );
								 }
							});
	});	
</script>
		
</body>
</html>