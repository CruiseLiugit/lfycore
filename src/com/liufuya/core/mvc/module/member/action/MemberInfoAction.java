package com.liufuya.core.mvc.module.member.action;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.liufuya.common.Constants;
import com.liufuya.common.dwz.DWZ;
import com.liufuya.common.dwz.ReturnBean;
import com.liufuya.core.mvc.module.privilege.model.Button;
import com.liufuya.core.mvc.module.privilege.model.Menus;
import com.liufuya.core.mvc.module.privilege.model.SysUser;
import com.liufuya.core.mvc.module.privilege.service.impl.MenusServiceImpl;

/**
 * 门店管理模块，控制器类
 * 
 * @author 刘立立
 * 
 */
@IocBean
public class MemberInfoAction {

	private static final Log log = Logs.get();

	@Inject("refer:menusServiceImpl")
	public MenusServiceImpl menusService;

	// ************************************************************************************
	// memberInfoList.jsp 页面，点击按钮 <高级检索>，跳转到 高级搜索页面
	@At("/m5_toMemberSearch")
	@Ok("jsp:jsp.5member.memberSearch")
	public void m5_toMemberSearch() {

	}

	// ************************************************************************************
	// memberInfoList.jsp 页面，点击按钮 <添加> , 跳转到新增会员界面
	@At("/m5_toCreateMember")
	@Ok("jsp:jsp.5member.memberInfoAdd")
	public void m5_toCreateMember(HttpServletRequest request) {
		// 简单跳转,获取菜单需要的 操作按钮，传递过去
		
	}

}
