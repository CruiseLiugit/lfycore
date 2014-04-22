package com.liufuya.core.mvc.module.privilege.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.liufuya.core.mvc.module.privilege.model.Menus;
import com.liufuya.core.mvc.module.privilege.model.SysUser;
import com.liufuya.core.mvc.module.privilege.service.impl.MenusServiceImpl;

/**
 * 用户权限模块，菜单管理控制器类
 * 
 * @author 刘立立
 * 
 */
@IocBean
public class MenusAction {

	private static final Log log = Logs.get();

	@Inject("refer:menusServiceImpl")
	public MenusServiceImpl menusService;

	// ************************************************************************************
	/**
	 * sysMenusList.jsp 页面，查看、修改菜单 按钮，异步请求操作
	 * 返回的数据中，包含了当前菜单的 按钮操作项目，包含已选和未选两种
	 * 这个问题困扰我一天 2014-04-21 晚 11:48
	 */
	@At("/seeMenuById")
	@Ok("json")
	public String seeMenuById(@Param("menuid") String menucode,
			HttpServletRequest req, HttpServletResponse res) {
		log.info("查看菜单项目....... menucode ="+menucode);
		// 1 根据输入值，查询当前菜单表、按钮表、菜单与按钮关系表 获取 json
		String menujson = menusService.getSeeMenusJson(req, res, menucode);
		log.info("menujson    ="+menujson);
		// 3 把结果组合成 json 返回
		if (menujson != null) {
			// 返回验证后的状态
			return menujson;
		} else {
			return "{\"status\":201,\"info\":\"查询错误\",\"data\":[]}";
		}
	}

	
	/**
	 * sysMenusList.jsp 页面，增加、修改菜单 按钮，异步请求操作
	 */
	@At("/saveMenus")
	@Ok("json")
	public String saveMenus(@Param("::menu.") Menus menus,@Param("buttonchks") String selectButtonIds,HttpServletRequest request) {
		log.info("页面传递来的 菜单项输入 ....... menucode ="+menus.getMenuName());
		log.info("按钮复选框值 buttonchks ="+selectButtonIds);
		String msg ="";
		try {
			menusService.saveMenus(request, menus, selectButtonIds);
			msg="{\"status\":200,\"info\":\"查询正确\",\"data\":[]}";
		} catch (Exception e) {	   
			msg="{\"status\":201,\"info\":\"查询错误\",\"data\":[]}";
			log.error("保存失败:"+e.getStackTrace());
		}
		
		return msg;
	}

	
	/**
	 * sysMenusList.jsp 页面，删除菜单 按钮，异步请求操作
	 */
	@At("/deleteMenus")
	@Ok("json")
	public String deleteMenus(@Param("menuid") String ids,HttpServletRequest request) {
		//log.info("删除，页面传递来的 菜单项输入 ....... menuid ="+ids);
		//log.info("按钮复选框值 buttonchks ="+selectButtonIds);
		String msg ="";
		  try {
			menusService.deleteMenus(ids); // 删除菜单
			msg="{\"status\":200,\"info\":\"正常删除\",\"data\":[]}";
		} catch (Exception e) {
			msg="{\"status\":201,\"info\":\"删除出现错误\",\"data\":[]}";  // 删除失败
		    log.error("删除失败:"+e.getStackTrace());
		}
		return msg;
	}
	
}
