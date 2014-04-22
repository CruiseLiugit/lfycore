package com.liufuya.core.mvc.module.privilege.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
 * @author 刘立立
 * 
 */
@IocBean
public class SysUserAction {
	private static final Log log = Logs.get();

	@Inject("refer:sysUserServiceImpl")
	public SysUserServiceImpl sysUserService;

	// ************************************************************************************
	// 用户登录、退出 模块
	// 2014-04-14
	/**
	 * 登陆
	 * 
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
			// return new ViewWrapper(new JspView("admin.main"), m);

			// 登录日志
			/*
			 * String type = "1";// 登陆 try { String ip =
			 * BaseController.getIpAddr(request); //处理登录日志 int i =
			 * sysUserService.insertLoginLog(sysUser, ip, type); if (i < 1) {
			 * result = 1; } } catch (Exception e) { logger.error("登陆日记插入失败!");
			 * }
			 */
		} else {
			req.setAttribute("error", "用户名或者密码错误！");
			return new JspView("jsp.account.login");
		}
	}

	/**
	 * 退出系统
	 * 
	 * @param req
	 */
	@At("/logout")
	@Ok("jsp:jsp.account.login")
	public void logout(HttpServletRequest req, HttpServletResponse response) {
		HttpSession session = req.getSession();
		// session.removeAttribute("loginName");
		// session.removeAttribute(Constants.CURRENT_LOGIN_USER);
		session.invalidate();
		try {
			String ip = BaseController.getIpAddr(req);
			// 暂时不做
			// sysUserService.insertLoginLog(sysUser, ip, type);
		} catch (Exception e) {
			log.error("退出日记插入失败!");
		}

	}

	// ************************************************************************************
	// 登录时，动态取出当前用户菜单、头部获取当前登录用户 姓名 功能
	// 2014-04-18
	/**
	 * 异步加载主页左边树结构
	 * 
	 * @param request
	 * @param response
	 */
	@At("/userloadMenus")
	public void loadMenus(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		SysUser sysUser = (SysUser) session
				.getAttribute(Constants.CURRENT_LOGIN_USER);
		String menuS = sysUserService.loadMenus(sysUser);
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

	/**
	 * 异步加载头部显示
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@At("/usertopLoginName")
	public void topLoginName(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		String topLoginName = (String) session.getAttribute("loginName");
		// log.info("登录名为 :"+topLoginName);
		try {
			// 解决返回值为 XMLDocument 问题
			// response.setContentType("text/html");

			PrintWriter pw = response.getWriter();
			pw.println(topLoginName);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			log.error("异步加载头部显示失败!");
		}
	}

	// ************************************************************************************
	// 所有页面顶部 top.jsp,修改账户信息模块
	// 2014-04-19
	/**
	 * 跳转到 修改密码页面
	 */
	@At("/toEditPwd")
	@Ok("jsp:jsp.account.editPassword")
	public void toEditPwd() {
	}

	/**
	 * 修改个人账户信息功能，前验证旧密码是否正确
	 */
	@At("/userCheckOldPwd")
	@Ok("json")
	public String userCheckOldPwd(@Param("oldname") String oldname,
			@Param("oldpwd") String oldpwd, HttpSession session) {
		// 1 从session 中取出当前登录 用户对象
		SysUser sysUser = (SysUser) session
				.getAttribute(Constants.CURRENT_LOGIN_USER);
		// 2 对比 界面 editPasword.jsp 传递过来的密码，要进行 MD5加密
		oldname = oldname.trim().intern();
		oldpwd = oldpwd.trim().intern();
		log.info("oldname ="+oldname +" , oldpwd ="+oldpwd);
		
		String dbpwd = new MD5().getMD5ofStr(oldpwd);
		// 3 与当前 Session 中保存的进行对比
		if (oldname.equals(sysUser.getLoginName())
				&& dbpwd.equals(sysUser.getLogPwd())) {
			// 返回验证后的状态
			return "{\"status\":200}";
		} else {
			return "{\"status\":201}";
		}
	}

	/**
	 * 修改个人账户信息功能
	 */
	@At("/usertopEditPwd")
	@Ok("jsp:jsp.index")
	public void userTopEditPwd(@Param("user_name") String username,
			@Param("login_newpwd") String newpwd, @Param("email") String email,
			@Param("phone") String phone, HttpSession session) {
		// 1 从session 中取出当前登录 用户对象
		SysUser sysUser = (SysUser) session
				.getAttribute(Constants.CURRENT_LOGIN_USER);
		// 2 根据界面 editPasword.jsp 更新的数据，修改这个对象中的数据
		username = username.trim().intern();
		newpwd = newpwd.trim().intern();
		email = email.trim().intern();
		phone = phone.trim().intern();
		
		//这里要做一个 邮箱、电话的正则表达验证。前端没有做好
		sysUser.setUserName(username);
		sysUser.setLogPwd(new MD5().getMD5ofStr(newpwd));
		sysUser.setEmail(email);
		sysUser.setUserPhone(phone);
		
		// 3 调用 服务层方法，修改数据库
		try {
			boolean flag = sysUserService.updateLoginPwd(sysUser);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	// ************************************************************************************
	// 用户管理， 增加、查看、修改、删除用户模块
	// 2014-04-20
	/**
	 * sysUserList.jsp 页面，增加 用户功能，异步操作
	 */
	@At("/createSysUser")
	@Ok("json")
	//data:{,"loginpwd":c_loginPwd.val(),"email":c_usermail.val(),"phone":c_userphone.val(),"type":c_usertype.val(),},
	//@Param 适配器获取 HTTP 参数，:: 表示参数是个对象 ,user. 表示表单参数名前缀
	public String createSysUser(@Param("::user.") SysUser user){
		// 1 适配器自动把页面数据，封装到 user 对象中
		// 2 对比 界面 sysUserList.jsp 传递过来的密码，要进行 MD5加密
		user.setLogPwd(new MD5().getMD5ofStr(user.getLogPwd().intern()));
		// 3 封装默认到参数
		log.info("type = "+user.getUserType());
		String uuid = UUID.randomUUID().toString();
		user.setUserCode(uuid);
		user.setStatus(Constants.SYSUSER_STATUS_VALID);
		user.setCreateDate(new Date());
		// 4 插入数据库
		try {
			///////////////4月20日晚，暂时没有菜单模块，角色模块，所以暂停////////////////
			//sysUserService.saveSysUser(user,relativedRoles);
			//message = "新增系统用户成功";
		} catch (Exception e) {
			e.printStackTrace();
			//message="新增系统用户失败:";
		}
			// 返回验证后的状态
			return "{\"status\":200}";
		
	}
	
	
	

}
