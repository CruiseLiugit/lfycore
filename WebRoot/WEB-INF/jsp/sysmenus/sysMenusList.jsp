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
						<a href="#">菜单管理</a>
					</li>
				</ul>
			</div>
			
			
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> 菜单管理</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					
					<div class="row-fluid" style="margin-top:6px;">
						<div class="span6"></div>
						<div class="span4"></div>
						<div class="span2"><button id="create-user" class="btn btn-primary">新增菜单项</button></div>
					</div>
			
	
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable">
						  <thead>
							  <tr>
								  <th>菜单名称</th>
								  <th>菜单等级</th>
								  <th>英文名称</th>
								  <th>操作</th>
							  </tr>
						  </thead>   
						  <tbody>
						  	<c:forEach var="sysmenus" items="${sysmenuslist}">
 								<tr>
									<td>${sysmenus.menuName }</td>
									<td>${sysmenus.levelId }</td>
									<td class="center">${sysmenus.engName }</td>
									<td class="center">
										<a class="btn btn-success" href="javascript:void(0)"  onclick="javascript:see(${sysmenus.id })">
										<i class="icon-zoom-in icon-white"></i>查看</a>
										<a class="btn btn-info" href="javascript:void(0)" onclick="javascript:edit(${sysmenus.id })">
										<i class="icon-edit icon-white"></i>编辑</a>
										<a class="btn btn-danger" href="javascript:void(0)" onclick="dele(${sysmenus.id })">
										<i class="icon-trash icon-white"></i>删除</a>
								</td>
							</tr>
 							</c:forEach>
 			
						  </tbody>
					  </table>            
					
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
			
			
			<!-- row 增加、修改菜单项所用的表单 div -->
			<div class="row-fluid sortable" id="create-dialog-form" title="新增菜单项">
				
					<div class="box-content">
						<p class="validateTips" id="create_validateTips">菜单名称，等级，上级菜单是必填项.</p>
			
					    <!-- 菜单表单 -->
						<form class="form-horizontal" action="#" method="post">
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="c_menu_name">菜单名称</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="c_menu_name" type="text" name="menu_name" placeholder="请输入中文名称" value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="c_levelid">菜单等级</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="c_levelid" type="text" name="levelid" placeholder="请输入数字等级" value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="c_fmenu_code">上级菜单</label>
								  <div class="controls">
								  <select id="c_fmenu_code" name="fmenu_code">
									<c:forEach var="sysmenus" items="${sysmenuslist}">
										<option value="${sysmenus.menuCode }">${sysmenus.menuName }</option>
 									</c:forEach>
								  </select>
								</div>
							  </div>
							  
							  
							  <div class="control-group">
								<label class="control-label" for="c_eng_name">菜单英文名称</label>
								<div class="controls">
									<input  class="input-xlarge focused" type="text" id="c_eng_name" name="eng_name"  value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="c_menu_url">菜单URL地址</label>
								<div class="controls">
									<input  class="input-xlarge focused" type="text" id="c_menu_url"  name="menu_url" value="">
								</div>
							  </div>
			
							 <div class="control-group">
								<label class="control-label" for="c_check_button">菜单按钮</label>
								<div class="controls" id="c_check_button">
									<c:if test="${buttonlist eq null }">
								  		<label class="checkbox inline">
											<input type="checkbox" name="c_menubuttons" value="0"> 没有按钮
								  		</label>
								  	</c:if>
								  	<c:forEach var="buttons" items="${buttonlist}">
										<label class="checkbox">
											<input type="checkbox" name="c_menubuttons" value="${buttons.modelCode }"> ${buttons.modelName }
								  		</label>
 									</c:forEach>
								</div>
							  </div>
							</fieldset>
						  </form>
					</div><!--/span-->
			
			</div><!--/row-->
			
			
			
			
			<!-- row 查看菜单的表单 div -->
			<div class="row-fluid sortable" id="see-dialog-form" title="查看菜单项">
				
					<div class="box-content">
					    <!-- 查看菜单信息表单 -->
						<form class="form-horizontal" action="#" method="post">
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="s_menu_name">菜单名称</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="s_menu_name" type="text" name="menu_name" placeholder="请输入中文名称" value="" disabled="disabled">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="s_levelid">菜单等级</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="s_levelid" type="text" name="levelid" placeholder="请输入数字等级" value="" disabled="disabled">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="s_eng_name">菜单英文名称</label>
								<div class="controls">
									<input  class="input-xlarge focused" type="text" id="s_eng_name" name="eng_name"  value="" disabled="disabled">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="s_menu_url">菜单URL地址</label>
								<div class="controls">
									<input  class="input-xlarge focused" type="text" id="s_menu_url"  name="menu_url" value="" disabled="disabled">
								</div>
							  </div>
			
							 <div class="control-group">
								<label class="control-label" for="s_usertype">菜单按钮</label>
								<div class="controls" id="s_usertype">
								  
								</div>
								
							  </div>
							</fieldset>
						  </form>
					</div><!--/span-->
			
			</div><!--/row-->
			
			
			
			
			
			<!-- row  修改用户所用的表单 div -->
			<div class="row-fluid sortable" id="edit-dialog-form" title="修改系统用户">
				
					<div class="box-content">
						<p class="validateTips" id="edit_validateTips">菜单名称，等级，上级菜单是必填项.</p>
					    <!-- 修改账户信息表单 -->
						<form class="form-horizontal" action="#" method="post">
							<!-- 隐藏表单，传递 菜单编码 menuCode -->
							<input id="e_menu_code" type="hidden" value="">
							
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="e_menu_name">菜单名称</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="e_menu_name" type="text" name="menu_name" placeholder="请输入中文名称" value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="e_levelid">菜单等级</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="e_levelid" type="text" name="levelid" placeholder="请输入数字等级" value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="e_fmenu_code">上级菜单</label>
								<div class="controls">
								  <select id="e_fmenu_code" name="fmenu_code">
									<c:forEach var="sysmenus" items="${sysmenuslist}">
										<option value="${sysmenus.menuCode }">${sysmenus.menuName }</option>
 									</c:forEach>
								  </select>
								</div>
							  </div>
							  
							  
							  <div class="control-group">
								<label class="control-label" for="e_eng_name">菜单英文名称</label>
								<div class="controls">
									<input  class="input-xlarge focused" type="text" id="e_eng_name" name="eng_name"  value="">
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="e_menu_url">菜单URL地址</label>
								<div class="controls">
									<input  class="input-xlarge focused" type="text" id="e_menu_url"  name="menu_url" value="">
								</div>
							  </div>
			
							 <div class="control-group">
								<label class="control-label" for="e_usertype">菜单按钮</label>
								<div class="controls" id="e_usertype">
									<!--  菜单项目 -->
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
		//Ajax 异步获取选择的菜单明细
		////////
		$.ajax({
			//防止提交乱码
			type:"post",
			url:"${base}/seeMenuById",
			//手动提交数据
			data:{"menuid":id},
			dataType:"json",
			success:function(res){
				//alert("返回结果 json = "+res);
				//返回状态码 200 正确，201密码错误
				var statucode = res.status;
				if (res != "" && statucode == 200) {
					$.each(res.data, function(i, obj) {
						var menu = obj.menu;
    						//菜单输入框的值
						$("#s_menu_name").val(menu.menuName);
						$("#s_levelid").val(menu.levelId);
						$("#s_eng_name").val(menu.engName);
						$("#s_menu_url").val(menu.menuUrl);
						//所有的按钮值
						var bt0 = "";
						$.each(obj.buttons, function(j, btobj) {
							if (btobj.checked == "true") {
								bt0 += "<label class=\"checkbox\"><input type=\"checkbox\" value=\""+btobj.btcode+"\" checked=\"checked\" disabled=\"disabled\">"+btobj.btname+"</label>";	
							}else{
								bt0 += "<label class=\"checkbox\"><input type=\"checkbox\" value=\""+btobj.btcode+"\"  disabled=\"disabled\">"+btobj.btname+"</label>";
							}
							
        					});
        					$("#s_usertype").html(bt0);
						
					});
					
				} 
				return false;
			},fail : function(res) {
				$.globalMessenger().post({
						message : "系统错误?!",
						hideAfter : 2,
						type : 'error',
				});
				return false;
			}
		});						
		////////
		$(function(){
			$( "#see-dialog-form" ).dialog( "open" );	
		});
	}

	//------------------------------------------------
	//表格中的   修改按钮
	function edit(id){
		//alert("id ="+id);
		//Ajax 异步获取选择的菜单明细
		////////
		$.ajax({
			//防止提交乱码
			type:"post",
			url:"${base}/seeMenuById",
			//手动提交数据
			data:{"menuid":id},
			dataType:"json",
			success:function(res){
				//alert("返回结果 json = "+res);
				//返回状态码 200 正确，201密码错误
				var statucode = res.status;
				if (res != "" && statucode == 200) {
					$.each(res.data, function(i, obj) {
						var menu = obj.menu;
    						//菜单输入框的值
    						$("#e_menu_code").val(menu.menuCode);
						$("#e_menu_name").val(menu.menuName);
						$("#e_levelid").val(menu.levelId);
						$("#e_eng_name").val(menu.engName);
						$("#e_menu_url").val(menu.menuUrl);
						//所有的按钮值
						var bt0 = "";
						$.each(obj.buttons, function(j, btobj) {
							if (btobj.checked == "true") {
								bt0 += "<label class=\"checkbox\"><input type=\"checkbox\" value=\""+btobj.btcode+"\"  name=\"e_menubuttons\" checked=\"checked\">"+btobj.btname+"</label>";	
							}else{
								bt0 += "<label class=\"checkbox\"><input type=\"checkbox\" value=\""+btobj.btcode+"\"  name=\"e_menubuttons\" >"+btobj.btname+"</label>";
							}
							
        					});
        					$("#e_usertype").html(bt0);
					});
					
				} 
													
				if (res != "" && statucode == 201) {
						$.globalMessenger().post({
							message : "查询错误，请重新查询!",
							hideAfter : 2,
							type : 'error',
				         });
				}
				return false;
			},fail : function(res) {
				$.globalMessenger().post({
						message : "系统错误?!",
						hideAfter : 2,
						type : 'error',
				});
				return false;
			}
		});	
		///////////
		$(function(){
			$( "#edit-dialog-form" ).dialog( "open" );	
		});
	}
	
	//------------------------------------------------
	//表格中的   删除按钮
	function dele(id){
		//alert("id ="+id);
		$(function(){
				//Ajax 异步请求，删除数据库中的菜单
				////////
				$.ajax({type:"post",url:"${base}/deleteMenus",data:{"menuid":id},dataType:"json",success:function(res){
													//更新 菜单列表
													location.reload();
													//返回状态码 200 正确，201密码错误
													var statucode = res.status;
													//alert("res statucode ="+statucode);
													if (res != "" && statucode == 200) {
														$.globalMessenger().post({
															message : "菜单项删除成功!",
															hideAfter : 4,
															type : 'success',
														});
														
													} 
													
													if (res != "" && statucode == 201) {
														$.globalMessenger().post({
															message : "菜单项删除失败!",
															hideAfter : 4,
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
		});
		
	}
	
	

	
	$(document).ready(function(){
						//选择好弹出框的样式
						//从上面弹出 样式为 flat  future  block air ice
						$._messengerDefaults = {
							extraClasses : 'messenger-fixed messenger-on-bottom messenger-on-right',
							theme:'air'
						};
						
						//---------------------------------------------
						//需要被验证的输入框。主要是新增菜单项
						var c_menu_name = $( "#c_menu_name" ),c_levelid = $( "#c_levelid" ),c_fmenu_code = $( "#c_fmenu_code" ),c_eng_name = $( "#c_eng_name" ),c_menu_url = $( "#c_menu_url" ),c_check_button = $( "#c_check_button" ),allCFields = $( [] ).add( c_menu_name ).add( c_levelid ).add(c_eng_name),tips = $("#create_validateTips" );
						var e_menu_code = $("#e_menu_code"),e_menu_name = $( "#e_menu_name" ),e_levelid = $( "#e_levelid" ),e_fmenu_code = $( "#e_fmenu_code" ),e_eng_name = $( "#e_eng_name" ),e_menu_url = $( "#e_menu_url" ),e_check_button = $( "#e_usertype" ),allEFields = $( [] ).add( e_menu_name ).add( e_levelid ).add(e_eng_name),tips = $("#edit_validateTips" );
						
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
							 height: 540,
							 width: 600,
							 modal: true,
							 buttons: {
							 	"新增": function() {
								 	//输入验证
							 		 var bValid = true;
							 		allCFields.removeClass( "ui-state-error" );
									bValid = bValid && checkLength( c_menu_name, "菜单名称", 1, 16 );
									bValid = bValid && checkLength( c_levelid, "菜单等级", 1, 4 );
									bValid = bValid && checkLength( c_eng_name, "英文名称", 6, 20 );

bValid = bValid && checkRegexp( c_levelid, /^\d*$/, "请输入数字" );									
bValid = bValid && checkRegexp( c_eng_name, /^[a-z]([0-9a-z_])+$/i, "英文名称应该包含 a-z, 0-9, 下划线, 并且以字母开头." );

									if ( bValid ) {
											//得到  菜单 按钮的 复选框的值
											var buttonCodes = "";
											$("input[name='c_menubuttons']").each(function(){
												if(this.checked){buttonCodes += this.value + ",";}
											});
   											
											//Ajax 异步请求，增加用户到数据库
											////////
											$.ajax({
												//防止提交乱码
												type:"post",
												url:"${base}/saveMenus",
												//手动提交数据
												// var c_menu_name = $( "#c_menu_name" ),c_levelid = $( "#c_levelid" ),c_fmenu_code = $( "#c_fmenu_code" ),c_eng_name = $( "#c_eng_name" ),c_menu_url = $( "#c_menu_url" ),c_check_button = $( "#c_check_button" ),
												data:{"menu.menuName":c_menu_name.val(),"menu.levelId":c_levelid.val(),"menu.fmenuCode":c_fmenu_code.val(),"menu.engName":c_eng_name.val(),"menu.menuUrl":c_menu_url.val(),"buttonchks":buttonCodes},
												dataType:"json",
												success:function(res){
													//更新 菜单列表
													location.reload();
													
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
										$( this ).dialog( "close" );
								    }
								 },close: function() {
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
								 		//输入验证
							 		 var eValid = true;
							 		allEFields.removeClass( "ui-state-error" );
									eValid = eValid && checkLength( e_menu_name, "菜单名称", 1, 16 );
									eValid = eValid && checkLength( e_levelid, "菜单等级", 1, 4 );
									eValid = eValid && checkLength( e_eng_name, "英文名称", 6, 20 );

eValid = eValid && checkRegexp( e_levelid, /^\d*$/, "请输入数字" );									
eValid = eValid && checkRegexp( e_eng_name, /^[a-z]([0-9a-z_])+$/i, "英文名称应该包含 a-z, 0-9, 下划线, 并且以字母开头." );

									if ( eValid ) {
											//得到  菜单 按钮的 复选框的值
											var buttonCodes = "";
											$("input[name='e_menubuttons']").each(function(){
												if(this.checked){buttonCodes += this.value + ",";}
											});
											
											//Ajax 异步请求，增加用户到数据库
											////////
											$.ajax({type:"post",url:"${base}/saveMenus",
												data:{"menu.menuCode":e_menu_code.val(),"menu.menuName":e_menu_name.val(),"menu.levelId":e_levelid.val(),"menu.fmenuCode":e_fmenu_code.val(),"menu.engName":e_eng_name.val(),"menu.menuUrl":e_menu_url.val(),"buttonchks":buttonCodes},
												dataType:"json",
												success:function(res){
													//更新 菜单列表
													location.reload();
													
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
	});	
</script>
		
</body>
</html>