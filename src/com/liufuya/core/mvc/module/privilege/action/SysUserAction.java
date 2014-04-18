package com.liufuya.core.mvc.module.privilege.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;

import com.liufuya.common.Constants;
import com.liufuya.common.base.BaseController;
import com.liufuya.common.base.MD5;
import com.liufuya.core.mvc.module.privilege.model.SysUser;
import com.liufuya.core.mvc.module.privilege.service.impl.SysUserServiceImpl;


/**
 * 用户登录、退出、登录用户密码修改
 * 
 * @author wubin
 * 
 */
@IocBean
public class SysUserAction {
	private static final Log log = Logs.get();
	
	@Inject("refer:sysUserServiceImpl")
	public SysUserServiceImpl sysUserService;
	
	//private Producer captchaProducer;
	
	/**
	 * 项目启动时的验证，搭建项目框架使用，返回当前系统时间
	 * @return
	 */
	@At("/ping") 
	public Object ping(){
		log.debug("====>测试user 模块 sysUserService ="+sysUserService);
		return new Date();
	}
	
	/**
	 * 进入登陆页面， 可以使用 View 对象控制返回到哪个视图路径
	 */
	@At("/")
	@Ok("jsp:jsp.account.login")
	public void index() {
	}
	
	/**
	 * 登陆
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@At("/login")
	public View login(@Param("loginName") String name,
			@Param("logPwd") String passwd, HttpServletRequest req) {
		// Strings 专门处理 web 项目字符串的方法
		if (Strings.isBlank(name) || Strings.isBlank(passwd)) {
			req.setAttribute("error", "用户名或者密码不能为空！请重新输入。");
			return new JspView("jsp.account.login");
		}

		name = name.trim().intern();
		passwd = passwd.trim().intern();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginName", name);
		map.put("loginPwd", new MD5().getMD5ofStr(passwd));
		
		SysUser sysUser = sysUserService.findSysUser(map);
		if (sysUser != null) {// 用户存在
			HttpSession session = req.getSession();
			session.setAttribute("loginName", name);
			session.setAttribute(Constants.CURRENT_LOGIN_USER, sysUser);
		
			return new JspView("jsp.index");
			//return new ViewWrapper(new JspView("admin.main"), m);
			
			//登录日志
			/*String type = "1";// 登陆
			try {
				String ip = BaseController.getIpAddr(request);
				//处理登录日志
				int i = sysUserService.insertLoginLog(sysUser, ip, type);
				if (i < 1) {
					result = 1;
				}
			} catch (Exception e) {
				logger.error("登陆日记插入失败!");
			}*/
		} else {
			req.setAttribute("error", "用户名或者密码错误！");
			return new JspView("jsp.account.login");
		}
	}
	
	
	/**
	 * 退出系统
	 * @param req
	 */
	@At("/logout")
	@Ok("jsp:jsp.account.login")
	public void logout(HttpServletRequest req,HttpServletResponse response) {
		HttpSession session = req.getSession();
		session.removeAttribute("loginName");
		session.removeAttribute(Constants.CURRENT_LOGIN_USER);
		session.invalidate();
		try {
			String ip = BaseController.getIpAddr(req);
			//暂时不做
			//sysUserService.insertLoginLog(sysUser, ip, type);
		} catch (Exception e) {
			log.error("退出日记插入失败!");
		}
		
		
	}
	
	
	/**
	 * 异步加载主页左边树结构
	 * @param request
	 * @param response
	 */
	@At("/userloadMenus")
	public void loadMenus(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		SysUser sysUser = (SysUser) session.getAttribute(Constants.CURRENT_LOGIN_USER);
		String menuS= sysUserService.loadMenus(sysUser);
		log.info("==============================");
		log.info(menuS);
		log.info("==============================");
		try {
			PrintWriter out = response.getWriter();
			out.print(menuS);
			out.flush();
			out.close();
		} catch (IOException e) {
			log.error("处理json数据报错：" + e.getStackTrace());
		}
	}
	
	
	
}
