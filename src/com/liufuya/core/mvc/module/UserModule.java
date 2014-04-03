package com.liufuya.core.mvc.module;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.liufuya.core.bean.User;



/**
 * 作为接受页面请求的控制器
 * 测试框架时建立的简单  登录测试类
 * @author lililiu
 *
 */
@IocBean
@At("/user")
public class UserModule {

	private static final Log log = Logs.get();
	
	
	//ioc 注入
	@Inject
	private Dao dao;
	
	@At
	public boolean login(@Param("name")String name,@Param("passwd")String passwd,HttpSession session){
		//Strings 专门处理 web 项目字符串的方法
		if (Strings.isBlank(name) || Strings.isBlank(passwd)) {
			return false;
		}
		
		name = name.trim().intern();
		passwd = passwd.trim().intern();
		
		//查询数据库
		User user = dao.fetch(User.class, Cnd.where("name","=",name).and("passwd","=",passwd));
		if (user == null) {
			return false;
		}
		
		session.setAttribute("me", user);
		return true;
	}
	
	
	/**
	 * @Ok  >> 外部重定向;->内部重定向; / 根;
	 * @param session
	 */
	@At
	@Ok(">>:/")
	public void logout(HttpSession session){
		session.invalidate(); //销毁 session
	}
	
	/**
	 * 从 session 中取出 me ，判断用户是否登录过
	 * @param user
	 * @return
	 */
	@At
	public User me(@Attr("me")User user){
		return user;
	}
	
	
	/**
	 * 项目启动时的验证，搭建项目框架使用，返回当前系统时间
	 * @return
	 */
	@At("/ping") 
	public Object ping(){
		log.debug("====>dao ="+dao);
		return new Date();
	}

}
