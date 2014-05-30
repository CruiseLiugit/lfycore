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
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					<!-- 1 工作台 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>工作台</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree">
							<li><a href="${base }/m1_tomyDesk" target="navTab" rel="module1_work_dayly">日常工作</a></li>
							<!-- <li><a href="#" target="navTab" rel="module1_work_report">日常报表</a></li>  -->
							<li><a>日常报表</a></li>
						</ul>
					</div>
				
				
					<!-- 2 门店管理 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>门店管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<!-- 二级菜单 -->		
							<li><a href="tabsPage.html" target="navTab">门店资料管理</a>
								<ul>
									<!-- 三级菜单 -->
									<li><a href="${base }/m2_toCityList" target="navTab" rel="module2_citypart">门店所在城市</a></li>
									<li><a href="${base }/m2_toStoreList" target="navTab" rel="module2_store">已开门店列表</a></li>
								</ul>
							</li>
							
							<li><a>门店地图管理</a>
								<ul>
									<li><a>门店地图管理</a></li>
									<li><a>门店区域统计</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					<!-- 3 产品管理菜单 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>产品管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<!-- 二级菜单 -->
							<li><a>产品类别管理</a></li>
							<li><a>产品属性管理</a></li>
							<li><a>产品资料管理</a></li>
							<li><a>优惠直通车管理</a></li>
						</ul>
					</div>
					
					<!-- 4 内容管理 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>内容管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<!-- 二级菜单 -->
							<li><a>基础设置</a>
								<ul>
									<!-- 三级菜单  -->
									<li><a>内容类型管理</a></li>
									<li><a>帮助中心管理</a></li>
								</ul>
							</li>
									
							<li><a>内容发布</a>
								<ul>
									<li><a>首页公告发布</a></li>
									<li><a>图片广告发布</a></li>
									<li><a>促销活动宣传</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					<!-- 5 会员管理 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>会员管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<!-- 二级菜单 -->
							<li><a>会员资料管理</a>
								<ul>
									<!-- 
									<li><a href="${base }/m5_importCartList" target="navTab" rel="module5_importcard">实体卡导入</a></li>
									 -->
									<li><a href="${base }/m5_memberInfoList" target="navTab" rel="module2_memberinfo">会员资料</a></li>
								</ul>
							</li>
							
							<li><a>订单管理</a></li>
							<li><a>换购订单管理</a></li>
							<li><a>会员优惠券管理</a></li>
							<li><a>会员积分管理</a></li>
							<li><a>黑名单管理</a></li>
							<li><a>会员报表查询</a>
								<ul>
									<li><a href="${base }/m5_MemberSexReport" target="navTab" rel="module5_sexpiechart">会员性别比分析</a></li>
									<li><a>饼图</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					<!-- 6 积分管理 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>积分管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<!-- 二级菜单 -->
							<li><a>积分规则管理</a></li>
							<li><a>换购商品管理</a></li>
							<li><a>订单管理</a></li>
						</ul>
					</div>
					
					
					<!-- 7 订单管理 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>订单管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<!-- 二级菜单 -->
							<li><a>当天订单管理</a></li>
							<li><a>订单跟踪管理</a></li>
							<li><a>配送范围管理</a></li>
							<li><a>订单历史查询</a></li>
							<li><a>订单投诉管理</a></li>
							<li><a>电话订单管理</a></li>
						</ul>
					</div>
					
					
					
					<!-- 7 报表分析 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>报表分析</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a>会员资料分析</a></li>
							<li><a>会员消费分析</a></li>
							<li><a>门店销售分析</a></li>
							<li><a>其他分析</a></li>
						</ul>
					</div>
					
					
					
					<!-- 8 权限管理菜单 -->
					<div class="accordionHeader">
						<h2><span>Folder</span>系统功能</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<!-- 二级菜单 -->
							<li><a>权限管理</a>
								<ul>
									<!-- 三级菜单 -->
									<li><a href="${base }/sysUserList" target="navTab" rel="user_manage">用户管理</a></li>
									<li><a>角色管理</a></li>
									<li><a href="${base }/sysMenusList" target="navTab" rel="menu_manage">菜单管理</a></li>
								</ul>
							</li>
							
							
						</ul>
					</div>
					
					
				</div>
				<!--  </div> 左侧菜单 end -->
			</div>
		</div>
		<!-- leftside end -->


<!-- 异步根据用户权限，加载菜单 -->
<script type="text/javascript">
/*
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

*/

</script>			
			
			