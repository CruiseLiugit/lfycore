package com.liufuya.core.mvc.module;

import javax.servlet.http.HttpServletRequest;
import org.nutz.ioc.annotation.InjectName;
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

import com.liufuya.core.bean.User;
import com.liufuya.core.dao.ManagerDao;
/**
 * 声明当前类被 ioc 控制， 接收所有 / 根路径下的输入请求
 * 
 * 我更喜欢 xxxAction
 * 
 * @author lililiu
 * 
 */
@IocBean
@InjectName
public class IndexAction extends BaseAction {

	private static final Log log = Logs.get();

	@Inject
	private ManagerDao managerDao;

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	
	/**
	 * 进入首页， 可以使用 View 对象控制返回到哪个视图路径
	 */
	// @At("/")
	// @Fail("jsp:error.404")
	// public View index(HttpServletRequest req) {
	// return new JspView("jsp.index");
	// }

	@At("/")
	@Ok("jsp:jsp.account.login")
	public void index() {
	}

	/**
	 * 进入首页， 查询首页数据， 使用 @Ok 控制返回路径
	 * 
	 * @param req
	 */
	@At("/login")
	public View login(@Param("username") String name,
			@Param("password") String passwd, HttpServletRequest req) {
		// Strings 专门处理 web 项目字符串的方法
		if (Strings.isBlank(name) || Strings.isBlank(passwd)) {
			req.setAttribute("error", "用户名或者密码不能为空！请重新输入。");
			return new JspView("jsp.account.login");
		}

		name = name.trim().intern();
		passwd = passwd.trim().intern();
		
		User m = managerDao.login(name, passwd);
		if (m != null) {
			
			req.getSession().setAttribute("admin", m);
			
			return new JspView("jsp.index");
			//return new ViewWrapper(new JspView("admin.main"), m);
		}else {
			if (m == null) {
				req.setAttribute("error", "用户名或者密码错误！");
			} else {
				req.setAttribute("error", "用户已经被禁用！");
			}
			return new JspView("jsp.account.login");
		}
	}
	
	
	
	@At("/logout")
	@Ok("jsp:jsp.account.login")
	public void logout(HttpServletRequest req) {
		req.getSession().invalidate();
	}
	
	
	
	

}
