package com.liufuya.core.mvc.module;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.liufuya.common.Constants;
import com.liufuya.core.mvc.module.privilege.model.Button;
import com.liufuya.core.mvc.module.privilege.model.Menus;
import com.liufuya.core.mvc.module.privilege.model.Role;
import com.liufuya.core.mvc.module.privilege.model.SysUser;
import com.liufuya.core.mvc.module.privilege.service.impl.MenusServiceImpl;
import com.liufuya.core.mvc.module.privilege.service.impl.RoleServiceImpl;
import com.liufuya.core.mvc.module.privilege.service.impl.SysUserServiceImpl;

/**
 * 用户所有菜单链接的跳转
 * 
 * @author 刘立立
 * 
 */
@IocBean
public class LeftMenuAction {

	private static final Log log = Logs.get();

	@Inject("refer:sysUserServiceImpl")
	public SysUserServiceImpl sysUserService;

	@Inject("refer:menusServiceImpl")
	public MenusServiceImpl menusService;
	
	@Inject("refer:roleServiceImpl")
	public RoleServiceImpl roleServiceImpl;

	/**
	 * 项目启动时的验证，搭建项目框架使用，返回当前系统时间
	 * 
	 * @return
	 */
	@At("/ping")
	public Object ping() {
		return new Date();
	}

	/**
	 * 进入登陆页面， 可以使用 View 对象控制返回到哪个视图路径
	 */
	@At("/")
	@Ok("jsp:jsp.account.login")
	public void index() {
	}

	// ---------------------左侧菜单-----------------------
	/**
	 * 跳转到 用户管理 管理列表界面 sysUserList.jsp
	 * @param request
	 */
	@At("/sysUserList")
	@Ok("jsp:jsp.sysuser.sysUserList")
	public void sysUserList(HttpServletRequest request) {
		// 这里查询数据库，获取所有系统用户列表
		List<SysUser> userlist = this.sysUserService.getAllSysUserList(1,
				Constants.SYSUSER_PAGE_SIZE);
		request.setAttribute("sysuserlist", userlist);
	}

	/**
	 * 跳转到 菜单管理列表界面 sysMenusList.jsp
	 */
	@At("/sysMenusList")
	@Ok("jsp:jsp.sysmenus.sysMenusList")
	public void queryAllMenusList(HttpServletRequest request) {
		// 这里查询数据库，获取所有系统菜单列表
		List<Menus> menuslist = this.menusService.getMenusList(1,
				Constants.MENUS_PAGE_SIZE);
		request.setAttribute("sysmenuslist", menuslist);
	}
	
	/**
	 * 跳转到 角色管理列表界面 sysRoleList.jsp
	 */
	@At("/sysRoleList")
	@Ok("jsp:jsp.sysrole.sysRoleList")
	public void sysRoleList(HttpServletRequest request) {
		// 这里查询数据库，获取所有系统菜单列表
		List<Role> rolelist = this.roleServiceImpl.quryAllRoleList(1,
				Constants.ROLES_PAGE_SIZE);
		request.setAttribute("sysroleslist", rolelist);
		
		//取出所有的按钮项目
		//List<Button> buttonslist= menusService.getAllButtons();
		//request.setAttribute("buttonlist", buttonslist);
	}
	
	
	// ---------------------测试 jQuery Easy UI-----------------------
		/**
		 * 跳转到 用户管理 管理列表界面 sysUserList.jsp
		 * @param request
		 */
		@At("/testjqui")
		@Ok("jsp:jsp.testjqeasyui.list")
		public void testjquiList(HttpServletRequest request) {
			// 这里查询数据库，获取所有角色
			List<Role> rolelist = this.roleServiceImpl.quryAllRoleList(1,
					Constants.ROLES_PAGE_SIZE);
			request.setAttribute("sysroleslist", rolelist);
		}
	

}
