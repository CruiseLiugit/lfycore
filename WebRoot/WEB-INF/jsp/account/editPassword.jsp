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
						<a href="#">账户设置</a>
					</li>
				</ul>
			</div>
			
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i>修改账户信息</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
					    <!-- 修改账户信息表单 -->
						<form class="form-horizontal" action="${base}/usertopEditPwd" method="post">
							<fieldset>
							  <div class="control-group" id="realNamediv">
								<label class="control-label" for="realName">真实姓名</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="realName" type="text" name="user_name" placeholder="请输入真实姓名" value="${sessionScope.CURRENT_LOGIN_USER.userName }">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="loginName">用户登录名</label>
								<div class="controls">
								  <input class="input-xlarge disabled" id="loginName" type="text" value="${sessionScope.CURRENT_LOGIN_USER.loginName }"  disabled="">
								</div>
							  </div>
							  
							  <div class="control-group" id="oldpwddiv">
								<label class="control-label" for="oldpwd">用户原始密码</label>
								<div class="controls">
								  <!-- 这里增加 ajax 异步验证 -->
								  <input class="input-xlarge focused" id="oldpwd" type="password"  value="" />
								</div>
							  </div>
							  
							  <div class="control-group" id="newpwddiv">
								<label class="control-label" for="newpwd">用户更新密码</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="newpwd" type="password"  name="login_newpwd" />	
								</div>
							  </div>
							  
							  <div class="control-group" id="maildiv">
								<label class="control-label" for="usermail">用户邮箱</label>
								<div class="controls">
								  <div class="input-prepend">
									<span class="add-on"><i class="icon-envelope"></i></span><input  size="28" type="text" id="usermail" name="email" value="${sessionScope.CURRENT_LOGIN_USER.email }">
								  </div>
								  <p class="help-block">该邮箱用于找回密码</p>
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
			
							  <div class="form-actions">
								<button class="btn">取消</button>
							  	<button type="submit" class="btn btn-primary">修改</button>
							  </div>
							</fieldset>
						  </form>
					
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
						
						//---------------------------------
						//需要验证的输入框 div
						var  opwddiv = $("#oldpwddiv");        //旧密码的 div
						var  realNamediv = $("#realNamediv");  //用户名名 div
						var newpwddiv = $("#newpwddiv");       //新密码 div
						var maildiv = $("#maildiv");           //邮箱 div
						var userphonediv = $("#userphonediv"); //电话 div
						
						//---------------------------------
						//提示输入旧密码
						$("#oldpwd").focus(function(){
						//alert("---------------3---------------");
						$("#oldpwd").val("");
							//$.globalMessenger().post({message : "旧密码不能为空!",hideAfter : 2,type : 'error',});
							opwddiv.addClass("error");
							return false;
						});
						
						$("#oldpwd").blur(function(){
							//alert("---------------5---------------");
							var opwd = $("#oldpwd").val();
							if(opwd == ""){
								$.globalMessenger().post({
									message : "旧密码不能为空!",
									hideAfter : 3,
									type : 'error',
								});
								opwddiv.addClass("error");
								return false;
							}else{
								var logName = $("#loginName").val(); 
								var opwd = $("#oldpwd").val();
								////////
								//异步请求，到服务器验证旧密码
								$.ajax({
									//防止提交乱码
									type:"post",
									url:"${base}/userCheckOldPwd",
									//手动提交数据
									data:{"oldpwd":opwd,"oldname":logName},
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
												$("#oldpwd").val("");
												$("#oldpwd").focus();
												opwddiv.addClass("error");
											}
										return false;
									},
									fail : function(res) {
										//清空
										$("#oldpwd").val("");
										$("#oldpwd").focus();
										opwddiv.addClass("error");
										$.globalMessenger().post({
													message : "系统错误?!",
													hideAfter : 2,
													type : 'error',
										});
										return false;
									}
								});
								
								////////
							}
						});
						
						
						//------------------------------------------
						//验证用户姓名
						$("#realName").blur(function(){
							//alert("---------------6---------------");
							var rName = $("#realName").val();
							if(rName == ""){
								$.globalMessenger().post({
									message : "真实姓名不能为空!",
									hideAfter : 3,
									type : 'error',
								});
								realNamediv.addClass("error");
								return false;
							}else{
								realNamediv.addClass("success");
							}
						});
						
						
						//------------------------------------------
						//验证新密码
						$("#newpwd").blur(function(){
							var nPwd = $("#newpwd").val();
							if(nPwd == ""){
								$.globalMessenger().post({
									message : "新密码不能为空!",
									hideAfter : 3,
									type : 'error',
								});
								newpwddiv.addClass("error");
								return false;
							}else{
								newpwddiv.addClass("success");
							}
						});
						
						//------------------------------------------
						//验证邮箱
						$("#usermail").blur(function(){
							var uMail = $("#usermail").val();
							if(uMail == ""){
								$.globalMessenger().post({
									message : "邮箱不能为空!",
									hideAfter : 3,
									type : 'error',
								});
								maildiv.addClass("error");
								return false;
							}else{
								/*
								//var reg = "/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/";
								var reg ="^[_a-z\d\-\./]+@[_a-z\d\-]+(\.[_a-z\d\-]+)*(\.(info|biz|com|edu|gov|net|am|bz|cn|cx|hk|jp|tw|vc|vn))$";
								alert("ddd");
								var flag = reg.test(uMail);
								alert("flag   ="+flag);
								if(!reg.test($.trim(uMail)))
  								{
   									$.globalMessenger().post({
										message : "邮箱格式不对！",
										hideAfter : 3,
										type : 'error',
									});
									maildiv.addClass("error");
   									return false;
  								}else{
									maildiv.addClass("success");
								}*/
								maildiv.addClass("success");
  							}	
  							
						});
						
						
						//------------------------------------------
						//验证电话
						$("#userphone").blur(function(){
							var uPhone = $("#userphone").val();
							if(uPhone == ""){
								$.globalMessenger().post({
									message : "手机号码不能为空!",
									hideAfter : 3,
									type : 'error',
								});
								userphonediv.addClass("error");
								return false;
							}else{
								/*
							    var reg = /^(?:13d|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|4|5|6|7|8|9])-?d{5}(d{3}|*{3})$/;
  								if(!reg.test($.trim(uPhone)))
  								{
   									$.globalMessenger().post({
										message : "手机号码格式不对！",
										hideAfter : 3,
										type : 'error',
									});
									userphonediv.addClass("error");
   									return false;
  								}
  								*/
  								userphonediv.addClass("success");
							}
						});
						
						
						
		});
		
</script>
		


</body>
</html>