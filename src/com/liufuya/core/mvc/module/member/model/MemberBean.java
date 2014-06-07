package com.liufuya.core.mvc.module.member.model;

import java.util.Date;

/**
 * 用于封装 WEB-INF/jsp/5member/memberInfoList.jsp 页面中要显示的数据
 * 
 * @author lililiu
 * 
 */
public class MemberBean {
	private int id;
	private String usercode; // 会员编码(随机数字)
	private String realname; // 真实姓名
	private String loginname; // 会员手机号码，登录名
	private String usertype; // 会员注册类型
	private String usersex; // 性别
	private String defaultaddress; // 默认地址
	private String available_shops; //周边配送符合配送条件的门店编号(Null表示无门店可以配送,有多家门店可以外送存入JSON对象{"n1":"门店编号","n2":"门店编号"})
	private String isavailable; // 是否可以配送
	private int memberCardScore; // 会员积分
	private String memberStatus;    //会员状态 1正常 0删除 2拉黑
	private Date createdate; // 注册日期

	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	
	
	public String getAvailable_shops() {
		return available_shops;
	}

	public void setAvailable_shops(String available_shops) {
		this.available_shops = available_shops;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getUsersex() {
		return usersex;
	}

	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}

	public String getDefaultaddress() {
		return defaultaddress;
	}

	public void setDefaultaddress(String defaultaddress) {
		this.defaultaddress = defaultaddress;
	}

	public String getIsavailable() {
		return isavailable;
	}

	public void setIsavailable(String isavailable) {
		this.isavailable = isavailable;
	}

	

	public int getMemberCardScore() {
		return memberCardScore;
	}

	public void setMemberCardScore(int memberCardScore) {
		this.memberCardScore = memberCardScore;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	

}
