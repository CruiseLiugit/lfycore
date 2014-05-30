<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="pageContent">
	<!-- onsubmit="return validateCallback(this, navTabAjaxDone);" -->
	<form action="${base}/usertopEditPwd" method="post" id="editsysUserform"  class="pageForm required-validate">
		
		<div class="pageFormContent" layoutH="58">
			
			<div class="unit" id="realNamediv">
				<label>真实姓名：</label>
				<input  size="30" minlength="1" maxlength="20" class="required"  
					id="realName" type="text" name="real_name" value="${sessionScope.CURRENT_LOGIN_USER.userName }" />
			</div>
			<div class="unit">
				<label>登录名：</label>
				<input  size="30" minlength="1" maxlength="20" disabled="disabled" 
					id="loginName"  type="text" name="login_name" value="${sessionScope.CURRENT_LOGIN_USER.loginName }"  />
			</div>
			<div class="unit" id="oldpwddiv">
				<label>旧密码：</label>
				<!-- 这里增加 ajax 异步验证 -->
				<input  size="30" minlength="3" maxlength="20" class="required alphanumeric" 
					id="oldpwd" type="password"  name="oldPassword" value="" />
			</div>
			<div class="unit" id="newpwddiv">
				<label>新密码：</label>
				<input  size="30" minlength="3" maxlength="20" class="required alphanumeric" 
					id="newpwd" type="password"  name="login_newpwd" />
			</div>
			<div class="unit" id="maildiv">
				<label>用户邮箱：</label>
				<input  size="30" minlength="2" maxlength="20" class="required" type="text" id="usermail" name="email"  value="${sessionScope.CURRENT_LOGIN_USER.email }">
			</div>
			<div class="unit" id="userphonediv">
				<label>用户手机：</label>
				<input  size="30" minlength="11" maxlength="11" class="required" type="text" id="userphone"  name="phone" value="${sessionScope.CURRENT_LOGIN_USER.userPhone }">
			</div>
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" id="sbbutton">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
	
</div>



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
						
						//
						var opwd = $("#oldpwd");
						var rName = $("#realName");
						var nPwd = $("#newpwd");
						var uMail = $("#usermail");
						var uPhone = $("#userphone");
						
						//提交按钮点击时，验证所有输入框
						var allCFields = $([]).add(opwddiv).add(
								realNamediv).add(newpwddiv)
								.add(maildiv).add(userphonediv);
						
						//---------------------------------
						$("#oldpwd").blur(function(){
							//alert("---------------5---------------");
							if(opwd.val() == ""){
								$.globalMessenger().post({
									message : "旧密码不能为空!",
									hideAfter : 3,
									type : 'error',
								});
								opwddiv.addClass("error");
								return false;
							}else{
								var logName = $("#loginName").val(); 
								//var opwd = $("#oldpwd").val();
								////////
								//异步请求，到服务器验证旧密码
								$.ajax({
									//防止提交乱码
									type:"post",
									url:"${base}/userCheckOldPwd",
									//手动提交数据
									data:{"oldpwd":opwd.val(),"oldname":logName},
									//自动序列化表单中的数据
									//data:$("#login_form").serialize(),
									dataType:"json",
									success:function(res){
											//返回状态码 200 正确，201密码错误
											if (res != "" && res == 200) {
												$.globalMessenger().post({
													message : "旧密码正确!",
													hideAfter : 2,
													type : 'success',
												});
												opwddiv.addClass("success");
											} 
											if (res != "" && res == 300) {
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
						
						
						
						//提交按钮脚本验证
						$("#sbbutton").click(function(){
							//输入验证
							var bValid = true;
							allCFields.removeClass("error");
							
							bValid = bValid && checkLength( rName,rName, "真实姓名", 1, 10 );
							bValid = bValid && checkLength( opwd,opwddiv, "旧密码", 6, 12 );
							bValid = bValid && checkLength( nPwd,newpwddiv, "新密码", 6, 12 );
							bValid = bValid && checkLength( uPhone,userphonediv, "手机号码", 11, 11 );

							bValid = bValid && checkRegexp( uPhone,userphonediv, /^\d*$/, "请输入手机号码" );									
							//bValid = bValid && checkRegexp( c_eng_name, /^[a-z]([0-9a-z_])+$/i, "英文名称应该包含 a-z, 0-9, 下划线, 并且以字母开头." );
							bValid = bValid && this.checkRegexp(uMail,maildiv,/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,"例如. ui@qq.com");
							//验证新旧密码一致
							bValid = bValid && (opwd.val() == nPwd.val());
							
							if (!bValid) {
								return false;
							} else {
								$("#editsysUserform").submit();
								return true;
							}
							
						});
						
						
		});
		
</script>
		

		

	