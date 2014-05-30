<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

		<!-- leftside begin -->
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<!--  左侧菜单 begin -->
					
				<!--  </div> 左侧菜单 end -->
			</div>
		</div>
		<!-- leftside end -->


<!-- 异步根据用户权限，加载菜单 -->
<script type="text/javascript">

//初始化左侧
function InitLeftMenu(contextPath) {
	var menulist ='';
	menulist +='<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div><div class="accordion" fillSpace="sidebar">';
	$.each(_menus.menus, function(i, n) {
    		//一级菜单
		menulist += '<div class="accordionHeader"><h2><span>Folder</span>'+ n.menuname+'</h2></div><div class="accordionContent"><ul class="tree treeFolder">';
		
    		$.each(n.menus, function(j, o) {
        		//二级菜单
        		menulist += '<li><a href="'+contextPath+o.url+'" ref="'+o.menuid+'" target="navTab">'+o.menuname+'</a><ul>';
			
			if(o.child && o.child.length>0)
			{
				//三级菜单
				$.each(o.child,function(k,p){
					menulist += '<li><a ref="'+p.menuid+'" href="'+contextPath+p.url+'" target="navTab" rel="' + contextPath+p.url + '"><i class="icon-home"></i>' + p.menuname + '</a></li>';
				});
			}
			menulist += '</ul></li>';
        });
    		menulist += '</ul></div>';
    });
    
    menulist += '</div>';
    //alert("html  ="+menulist);
	$("#sidebar").html(menulist);
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
			
			