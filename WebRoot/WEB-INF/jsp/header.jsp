<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<head>
    <meta charset="UTF-8">
	<title>留夫鸭核心管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="留夫鸭,订餐系统,CRM,会员管理,积分管理系统.">
	<meta name="author" content="刘立立,836131325@qq.com">

	<!-- The styles
	<link id="bs-css" href="${base}/css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="${base}/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="${base}/css/charisma-app.css" rel="stylesheet">
	<link href="${base}/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='${base}/css/fullcalendar.css' rel='stylesheet'>
	<link href='${base}/css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='${base}/css/chosen.css' rel='stylesheet'>
	<link href='${base}/css/uniform.default.css' rel='stylesheet'>
	<link href='${base}/css/colorbox.css' rel='stylesheet'>
	<link href='${base}/css/jquery.cleditor.css' rel='stylesheet'>
	<link href='${base}/css/jquery.noty.css' rel='stylesheet'>
	<link href='${base}/css/noty_theme_default.css' rel='stylesheet'>
	<link href='${base}/css/elfinder.min.css' rel='stylesheet'>
	<link href='${base}/css/elfinder.theme.css' rel='stylesheet'>
	<link href='${base}/css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='${base}/css/opa-icons.css' rel='stylesheet'>
	<link href='${base}/css/uploadify.css' rel='stylesheet'>
	 -->
	
	<!-- messenger css... -->
	<link href="${base}/build/css/messenger.css" rel="stylesheet" type="text/css" >
	<link href="${base}/build/css/messenger-spinner.css" rel="stylesheet" type="text/css">
	<link href="${base}/build/css/messenger-theme-air.css" rel="stylesheet" type="text/css">
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="${base}/img/favicon.ico">
	
	<style type="text/css">

.unit.error > label,
.unit.error .help-block,
.unit.error .help-inline {
  color: #b94a48;
}

.unit.error .checkbox,
.unit.error .radio,
.unit.error input,
.unit.error select,
.unit.error textarea {
  color: #b94a48;
  border-color: #b94a48;
}

.unit.error .checkbox:focus,
.unit.error .radio:focus,
.unit.error input:focus,
.unit.error select:focus,
.unit.error textarea:focus {
  border-color: #953b39;
  -webkit-box-shadow: 0 0 6px #d59392;
     -moz-box-shadow: 0 0 6px #d59392;
          box-shadow: 0 0 6px #d59392;
}

.unit.error .input-prepend .add-on,
.unit.error .input-append .add-on {
  color: #b94a48;
  background-color: #f2dede;
  border-color: #b94a48;
}

.unit.success > label,
.unit.success .help-block,
.unit.success .help-inline {
  color: #468847;
}

.unit.success .checkbox,
.unit.success .radio,
.unit.success input,
.unit.success select,
.unit.success textarea {
  color: #468847;
  border-color: #468847;
}

.unit.success .checkbox:focus,
.unit.success .radio:focus,
.unit.success input:focus,
.unit.success select:focus,
.unit.success textarea:focus {
  border-color: #356635;
  -webkit-box-shadow: 0 0 6px #7aba7b;
     -moz-box-shadow: 0 0 6px #7aba7b;
          box-shadow: 0 0 6px #7aba7b;
}

.unit.success .input-prepend .add-on,
.unit.success .input-append .add-on {
  color: #468847;
  background-color: #dff0d8;
  border-color: #468847;
}


	
	
	
.label,
.badge {
  font-size: 10.998px;
  font-weight: bold;
  line-height: 14px;
  color: #ffffff;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  white-space: nowrap;
  vertical-align: baseline;
  background-color: #999999;
}

.label {
  padding: 1px 4px 2px;
  -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
          border-radius: 3px;
}
	  
.label-important,
.badge-important {
  background-color: #b94a48;
}

.label-important[href],
.badge-important[href] {
  background-color: #953b39;
}

.label-warning,
.badge-warning {
  background-color: #f89406;
}

.label-warning[href],
.badge-warning[href] {
  background-color: #c67605;
}

.label-success,
.badge-success {
  background-color: #468847;
}

.label-success[href],
.badge-success[href] {
  background-color: #356635;
}

.label-info,
.badge-info {
  background-color: #3a87ad;
}

.label-info[href],
.badge-info[href] {
  background-color: #2d6987;
}

.label-inverse,
.badge-inverse {
  background-color: #333333;
}

.label-inverse[href],
.badge-inverse[href] {
  background-color: #1a1a1a;
}

	</style>
	
	
<!-- =======================jUI========================= -->

<link href="${base}/juithemes/default/style.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${base}/juithemes/css/core.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${base}/juithemes/css/print.css" rel="stylesheet"
	type="text/css" media="print" />
<link href="${base}/juiuploadify/css/uploadify.css" rel="stylesheet"
	type="text/css" media="screen" />
<!--[if IE]>
<link href="${base}/juithemes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="${base}/juijs/speedup.js" type="text/javascript"></script>
<![endif]-->
	
	
	<!-- =====================jUI  js======================== -->
	
<script src="${base}/juijs/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${base}/juijs/jquery.cookie.js" type="text/javascript"></script>
<script src="${base}/juijs/jquery.validate.js" type="text/javascript"></script>
<script src="${base}/juijs/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${base}/juixheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="${base}/juixheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="${base}/juiuploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="${base}/juichart/raphael.js"></script>
<script type="text/javascript" src="${base}/juichart/g.raphael.js"></script>
<script type="text/javascript" src="${base}/juichart/g.bar.js"></script>
<script type="text/javascript" src="${base}/juichart/g.line.js"></script>
<script type="text/javascript" src="${base}/juichart/g.pie.js"></script>
<script type="text/javascript" src="${base}/juichart/g.dot.js"></script>

<script src="${base}/juijs/dwz.core.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.util.date.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.validate.method.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.regional.zh.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.barDrag.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.drag.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.tree.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.accordion.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.ui.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.theme.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.switchEnv.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.alertMsg.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.contextmenu.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.navTab.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.tab.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.resize.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.dialog.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.sortDrag.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.cssTable.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.stable.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.taskBar.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.ajax.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.pagination.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.database.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.datepicker.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.effects.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.panel.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.checkbox.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.history.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.combox.js" type="text/javascript"></script>
<script src="${base}/juijs/dwz.print.js" type="text/javascript"></script>
<!-- -->
<script src="${base}/juibin/dwz.min.js" type="text/javascript"></script>

<script src="${base}/juijs/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("dwz.frag.xml", {
		loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"juithemes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});

</script>
	
	
<!-- Message js lib -->	
<script type="text/javascript" src="${base}/build/js/messenger.js"></script>
<script type="text/javascript">
//------------------页面非空校验------------------------------
//输入校验函数
function showErrorMessage(msg) {
	$.globalMessenger().post({
		message : msg,
		hideAfter : 4,
		type : 'error',
	});
}
//非空校验
function checkLength(o, odiv, n, min, max) {
	if (o.val().length > max
			|| o.val().length < min) {
		odiv.addClass("error");
		showErrorMessage(n + " 长度应该在 " + min
				+ " - " + max + " 之间.");
		return false;
	} else {
		return true;
	}
}
//正则表达式校验
function checkRegexp(o, odiv, regexp, msg) {
	if (!(regexp.test(o.val()))) {
		odiv.addClass("error");
		showErrorMessage(msg);
		return false;
	} else {
		return true;
	}
}

//新增 ，失去焦点，验证手机、电话、传真、邮箱、银行卡号
function checkBlur(inputName, inputDiv, regexp, msg) {
	var bValid = true;
	bValid = bValid
			&& checkRegexp(inputName, inputDiv,
					regexp, msg);

	if (bValid) {
		inputDiv.addClass("error");
		return false;
	} else {
		inputDiv.addClass("success");
		return true;
	}
}

//验证 json 读取
function showJSON() {   
		 var user =  {"username":"andy","age":20,"info": { "tel": "123456", "cellphone": "98765"},"address":[{"city":"beijing","postcode":"222333"},{"city":"newyork","postcode":"555666"}]};
		var res ={
				   "statusCode" :200,
				   "message" :"密码正确"
				};
		
		alert("statucode ="+res.statusCode);
		/*
	       alert(user.username);
	       alert(user.age);
           alert(user.info.cellphone);
           alert(user.address[0].city);
	      alert(user.address[0].postcode);
	      */
}   
</script>	
		
	<!-- ================================================== -->
	
</head>
