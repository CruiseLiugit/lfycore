<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp"%>


<form action="${base}/createSysUser" method="post" class='required-validate pageForm' onsubmit="return validateCallback(this, dialogAjaxDone);">
<input type="hidden" name="navTabId" value="A_USERMANAGE" />

<div class="pageContent">
	<!-- 
	<form method="post" action="${base}/createSysUser" id="create-user-form" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);">
	 -->
		<div class="pageFormContent" layoutH="56">
			<div class="unit"  id="realNameDiv">
				<label>真实姓名：</label>
				<input  class="required" id="c_realName" type="text" name="user.userName" size="30"  alt="请输入真实姓名"/>
			</div>
			
			<div class="unit" id="loginNameDiv">
				<label>用户登录名：</label>
				<input class="required" id="c_loginName" type="text" name="user.loginName" size="30"  alt="请输入登录名" value=""/>
			</div>
			
			<div class="unit"  id="oldpwdDiv">
				<label>用户原始密码：</label>
				<input type="text" readonly="readonly" id="c_loginPwd" name="user.logPwd" value="123456"  size="30" class="textInput">	
			</div>
			<div class="unit"  id="mailDiv">
				<label>用户邮箱：</label>
				<input type="text"  id="c_usermail" name="user.email"  value="" class="required" size="30"  alt="请输入正确的邮箱">
			</div>
			<div class="unit"   id="userphoneDiv">
				<label>用户手机：</label>
				<input id="c_userphone"  name="user.userPhone" type="text" size="30" alt="请输入手机号码" class="textInput"/>
			</div>
			<div class="unit" >
				<label>账户类型：</label>
				<select class="required combox" name="user.userType" id="c_usertype">
					<option value="">请选择</option>
					<option value="1" selected>系统用户</option>
					<option value="2">商家用户</option>
					<option value="3">其他用户</option>
				</select>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="adduserBtn">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	
</div>

</form>

<script type="text/javascript">
	/*
	$(document).ready(function(){
						//选择好弹出框的样式
						//从上面弹出 样式为 flat  future  block air ice
						$._messengerDefaults = {
							extraClasses : 'messenger-fixed messenger-on-bottom messenger-on-right',
							theme:'air'
						};
						
						//---------------------------------------------
						//需要被验证的输入框。主要是新增用户、修改用户
						var c_realName = $("#c_realName"),c_loginName = $("#c_loginName"),c_loginPwd = $("#c_loginPwd"),c_usermail = $("#c_usermail"),c_userphone = $("#c_userphone"),c_usertype = $("#c_usertype");
						var realNameDiv = $("#realNameDiv"),loginNameDiv=$("#loginNameDiv"),mailDiv=$("#mailDiv"),userphoneDiv=$("#userphoneDiv");
						var allCFields = $( [] ).add( realNameDiv ).add( loginNameDiv ).add(mailDiv).add(userphoneDiv);
						
						//---------------------------------------------
						//新增用户 div 使用 dialog 隐藏
						$("#adduserBtn").click(function() {
							 		//输入验证
							 		 var bValid = true;
							 		allCFields.removeClass( "error" );
							 		
									bValid = bValid && checkLength( c_realName,realNameDiv, "真实姓名", 1, 16 );
									bValid = bValid && checkLength( c_loginName,loginNameDiv, "登录名", 3, 16 );
									bValid = bValid && checkLength( c_usermail,mailDiv, "认证邮箱", 6, 80 );
									//bValid = bValid && checkLength( c_userphone, "手机号码", 10, 12 );
									
//bValid = bValid && checkRegexp( c_realName, /^[\\S]+$/i, "真实姓名不能为空." );
bValid = bValid && checkRegexp( c_loginName,loginNameDiv, /^[a-z]([0-9a-z_])+$/i, "登录名应该包含 a-z, 0-9, 下划线, 并且以字母开头." );
// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
bValid = bValid && checkRegexp( c_usermail,mailDiv, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "例如. hello@liufuya.com" );
bValid = bValid && checkRegexp( c_userphone,userphoneDiv, /^\d{11}$/, "请输入 11 位手机号码" );

									if ( bValid ) {
										$("#create-user-form").submit();
										return true;
									}
									return false;
						});
						
						
	});	
	*/
</script>



