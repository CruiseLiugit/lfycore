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
import com.liufuya.common.base.MD5;
import com.liufuya.common.dwz.DWZ;
import com.liufuya.common.dwz.ReturnBean;
import com.liufuya.core.map.BaiduMapBiz;
import com.liufuya.core.map.jsonbean.Geocoding;
import com.liufuya.core.mvc.module.member.model.Member;
import com.liufuya.core.mvc.module.member.model.MemberAddress;
import com.liufuya.core.mvc.module.member.service.impl.MemberServiceImpl;
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

	@Inject("refer:memberServiceImpl")
	public MemberServiceImpl memberService;

	// ioc 注入，百度工具类
	@Inject("refer:baiduMapBiz")
	private BaiduMapBiz baidu;

	// ************************************************************************************
	// 搜索栏
	// memberInfoList.jsp 页面，点击按钮 <高级检索>，跳转到 高级搜索页面
	@At("/m5_toMemberSearch")
	@Ok("jsp:jsp.5member.memberSearch")
	public void m5_toMemberSearch() {

	}

	// ************************************************************************************
	// CRUD 工具栏
	// memberInfoList.jsp 页面，点击按钮 <批量导入> , 跳转到新增会员界面
	@At("/m5_toImportMember")
	@Ok("jsp:jsp.5member.memberInfoImport")
	public void m5_toImportMember(HttpServletRequest request) {
		// 简单跳转,获取菜单需要的 操作按钮，传递过去

	}

	// memberInfoList.jsp 页面，点击按钮 <添加> , 跳转到新增会员界面
	@At("/m5_toCreateMember")
	@Ok("jsp:jsp.5member.memberInfoAdd")
	public void m5_toCreateMember(HttpServletRequest request) {
		// 简单跳转,获取菜单需要的 操作按钮，传递过去

	}

	// memberInfoAdd.jsp 页面，点击 <保持> 按钮。增加会员数据，并刷新列表
	@At("/createMemberInfo")
	public String createMemberInfo(@Param("::member.") Member member,
			@Param("navTabId") String navTabId, HttpServletRequest request) {
		// log.info("增加会员信息 member :"+member);
		// log.info("增加会员信息 member realName :"+member.getRealName());
		// log.info("增加会员信息 member sex :"+member.getSex());
		// log.info("增加会员信息 member.birthday :"+member.getBirthday());

		// 1 适配器自动把页面数据，封装到 member 对象中
		// 2 对比 界面 sysmemberList.jsp 传递过来的密码，要进行 MD5加密
		// 3 封装默认到参数
		String uuid = UUID.randomUUID().toString();
		member.setUser_code(uuid);
		member.setUser_type("4");
		member.setLoginName(member.getTelphone());
		member.setLoginPwd(new MD5().getMD5ofStr(member.getLoginPwd().intern()));
		// 工作类型，家庭收入，年龄区间
		member.setStatus("1");
		member.setCreate_date(new Date());

		// 准备同时插入会员默认地址
		MemberAddress address = new MemberAddress();
		String uuid2 = UUID.randomUUID().toString();
		address.setAddress_code(uuid2);
		address.setUser_code(uuid); // 用户 code
		address.setCity(member.getCity());
		address.setAddress_keywords(member.getDefault_address());
		// 调用百度地图查询 GPS 周围店铺 code 编号
		Geocoding ge = null;
		try {
			// log.info("百度地图查询1");
			ge = baidu.getMapByGet(member.getDefault_address(),
					member.getCity());
			// log.info("百度地图查询2");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info("百度地图查询异常");
		}
		if (ge != null) {
			if (ge.getResult() != null) {
				// log.info("百度地图查询成功,纬度 lat = "+ge.getResult().getLocation().getLat());
				address.setGps_lat("" + ge.getResult().getLocation().getLat());
				address.setGps_long("" + ge.getResult().getLocation().getLng());
			} else {
				log.info("地址不正确");
			}
		} else {
			log.info("百度地图查询失败");
		}
		address.setCreate_date(new Date());
		address.setIs_default("1"); // 是否是默认地址
		address.setStatus("1");
		address.setIs_available("0"); // 是否可配送，暂时不做
		// available_shops
		// 周边配送符合配送条件的门店编号(Null表示无门店可以配送,有多家门店可以外送存入JSON对象{"n1":"门店编号","n2":"门店编号"})

		ReturnBean bean = new ReturnBean();
		// 4 插入数据库
		try {
			memberService.insertMember(member);
			memberService.insertMemberAddress(address);
			// message = "新增系统会员成功";
			bean.setStatusCode(DWZ.statusCode.ok);
			bean.setMessage("新增会员成功"); // 成功后，弹出提示文字
		} catch (Exception e) {
			e.printStackTrace();
			bean.setStatusCode(DWZ.statusCode.error);
			bean.setMessage("操作失败");
		}

		bean.setNavTabId(navTabId);
		bean.setRel("");
		bean.setCallbackType(DWZ.CallbackType);
		bean.setForwardUrl("");

		/*
		 * { "statusCode":"200", "message":"操作成功", "navTabId":"", "rel":"",
		 * "callbackType":"closeCurrent", "forwardUrl":"" }
		 */
		// 返回验证后的状态
		String json = Json.toJson(bean);
		// log.info(json);
		return json;
	}

	// ///修改
	// memberInfoList.jsp 页面，点击按钮 <修改> , 跳转到修改会员界面
	@At("/m5_toEditMember")
	@Ok("jsp:jsp.5member.memberInfoEdit")
	public void toEditSysUser(@Param("mid") String member_code,
			HttpServletRequest request) {
		// 根据用户 id 查询用户对象
		// log.info("要修改用户的 code ="+uid);
		Member member = this.memberService.getMemberByCode(member_code);
		request.setAttribute("member", member);
		request.setAttribute("member_code", member_code);
	}

	// 修改用户
	@At("/eidtSysUser")
	// @Ok("jsp:jsp.sysuser.sysUserList")
	public String eidtSysUser(@Param("::user.") SysUser user,
			@Param("navTabId") String navTabId, @Param("userid") String uid,
			HttpServletRequest request) {
		// 跳转并刷新列表数据
		// log.info("修改用户信息 user :" + user);
		// log.info("修改用户信息 user loginname :" + user.getLoginName());
		// log.info("修改用户信息 user name :" + user.getUserName());
		// log.info("修改用户信息 user type :" + user.getUserType());

		// 1 适配器自动把页面数据，封装到 user 对象中

		ReturnBean bean = new ReturnBean();
		// 4 插入数据库
		try {
			// /////////////4月20日晚，暂时没有菜单模块，角色模块，所以暂停////////////////
			// sysUserService.saveSysUser(user,relativedRoles);
			// message = "新增系统用户成功";
			bean.setStatusCode(DWZ.statusCode.ok);
			// bean.setMessage(getText("msg.operation.success",request));
			bean.setMessage("操作成功");
			bean.setNavTabId(navTabId);
			bean.setRel("");
			bean.setCallbackType(DWZ.CallbackType);
			bean.setForwardUrl("");
		} catch (Exception e) {
			e.printStackTrace();
			// message="新增系统用户失败:";
		}

		// 返回验证后的状态
		return Json.toJson(bean);
	}

	// 删除用户
	@At("/deleteSysMenus")
	@Ok("json")
	public String deleteSysUser(@Param("uid") String uid,
			HttpServletRequest request) {
		// 简单跳转
		log.info("user id=" + uid);
		// String msg = getText("msg.operation.success", request);
		// log.info("本地 字符串 msg =" + msg);
		// return ajaxForwardSuccess(msg);
		return "";
	}

}
