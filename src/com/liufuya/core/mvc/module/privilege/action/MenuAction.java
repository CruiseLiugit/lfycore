package com.liufuya.core.mvc.module.privilege.action;

import java.util.Date;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;


/**
 * 用户所有菜单链接的跳转
 * 
 * @author 刘立立
 * 
 */
@IocBean
public class MenuAction {

	private static final Log log = Logs.get();
	
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
	
	//---------------------左侧菜单-----------------------
	//跳转到 用户管理 管理列表界面
	@At("/sysUserList")
	@Ok("jsp:jsp.sysuser.sysUserList")
	public void sysUserList() {	
	}
	
	
	
	
	
	
}
