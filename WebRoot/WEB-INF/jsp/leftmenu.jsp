<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<!-- 这里根据后台权限设置自动增加所有功能 -->
				<div class="well nav-collapse sidebar-nav"  id="nav">
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->


<!-- 异步根据用户权限，加载菜单 -->
<script type="text/javascript">
//初始化左侧
function InitLeftMenu(contextPath) {

	var menulist ='';
	menulist +='<ul class="nav nav-tabs nav-stacked main-menu">';
    
    $.each(_menus.menus, function(i, n) {
    		//一级菜单
		menulist += '<li class="nav-header hidden-tablet">' + n.menuname+'</li>';
		
    		$.each(n.menus, function(j, o) {
        		//二级菜单
        		menulist += '<li><a class="ajax-link" ref="'+o.menuid+'" href="'+contextPath+o.url+'" href="' + contextPath+o.url + '" ><i class="icon-eye-open"></i><span class="hidden-tablet">' + o.menuname + '</span></a></li>'
			
			if(o.child && o.child.length>0)
			{
				//三级菜单
				$.each(o.child,function(k,p){
					menulist += '<li><a class="ajax-link" ref="'+p.menuid+'" href="'+contextPath+p.url+'" rel="' + contextPath+p.url + '" ><i class="icon-align-justify"></i><span class="hidden-tablet">' + p.menuname + '</span></a></li>'
				});
			}
        })
		
    });
    
    menulist += '</ul>';
    	
	$("#nav").html(menulist);
}


var _menus;
$(function(){
	$.post('${base}/userloadMenus',function(data){
		_menus=data;
		InitLeftMenu('${base }');
	}, "json");
});
//var _menus ={"menus":[{"menuid": "A_SYSTEM","icon": "icon-sys","menuname": "系统功能","menus":[{"menuid": "A_PRIVILEGE","icon": "icon-sys","menuname": "权限管理","child":[{"menuid": "A_USERMANAGE","menuname": "用户管理","url": "${contextPath }/jsp/user/sysUserList.jsp"},{"menuid": "A_ROLE_MANAGE","menuname": "角色管理","url": "${contextPath }/jsp/role/role.jsp"},{"menuid": "A_MENU_MANAGE","menuname": "菜单管理","url": "${contextPath }/jsp/user/sysUserList.jsp"}]}]}]};



</script>			
			
			