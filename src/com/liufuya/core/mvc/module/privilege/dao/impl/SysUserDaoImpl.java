package com.liufuya.core.mvc.module.privilege.dao.impl;

import java.util.List;
import java.util.Map;

import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.IocBean;

import com.liufuya.core.mvc.module.BasicDao;
import com.liufuya.core.mvc.module.privilege.model.SysUser;

@IocBean
public class SysUserDaoImpl extends BasicDao {
	
	
	/**
	 * 根据id删除用户
	 * 
	 * @param sysUser
	 * @return
	 */
	public boolean deleteSysUserById(String sysUserId) {
		return super.delById(new Integer(sysUserId.trim()).intValue(),
				SysUser.class);
	}

	/**
	 * 根据登陆名和密码查当前用户
	 * 
	 * @param map
	 * @return
	 */
	public SysUser findSysUser(Map<String, Object> map) {
		Cnd condition = Cnd.where("loginName", "=", map.get("loginName"))
				.and("logPwd", "=", map.get("loginPwd"))
				.and("status", "=", "1");

		return findByCondition(SysUser.class, condition);
	}

	/**
	 * 添加登陆日记 ,目前没有这个表
	 * 
	 * @param map
	 * @return
	 */
//	 public void insertLoginLog(Map<String,Object> map) throws Exception{
//	 return this.getSqlSessionTemplate().insert(this.nameSpace +
//	 ".insertLoginLog", map);
//	 }

	/**
	 * 根据usercode修改用户登陆密码
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean updateLoginPwd(Map<String, Object> map) throws Exception {
		// update SYS_USER set LOG_PWD=#{newLoginPwd} where
		// USER_CODE=#{userCode} and STATUS='1'
		boolean flag = update(
				SysUser.class,
				Chain.make("logPwd", map.get("newLoginPwd")),
				Cnd.where("userCode", "=", map.get("userCode")).and("status",
						"=", 1));
		return flag;
	}

	/**
	 * 新增系统用户
	 * 
	 * @param sysUser
	 */
	public void saveSysUser(SysUser sysUser) {
		this.save(sysUser);
	}

	/**
	 * 根据id修改用户
	 * 
	 * @param sysUser
	 * @return
	 */
	public boolean updateSysUserById(SysUser sysUser) {
		// Cnd condition = Cnd.where("name", "=",
		// map.get("loginName")).and("status", "=", "1");
		update(SysUser.class,Chain.make("loginName", sysUser.getLoginName())
					    .make("logPwd", sysUser.getLogPwd())
					    .make("userName", sysUser.getUserName())
					    .make("email", sysUser.getEmail())
						.make("userPhone", sysUser.getUserPhone())
						.make("userType", sysUser.getUserType())
						.make("sellerCode", sysUser.getSellerCode())
						.make("createDate", sysUser.getCreateDate())
						.make("status", sysUser.getStatus()),
				Cnd.where("userCode", "=", sysUser.getUserCode()));

		return this.update(sysUser);
	}

	/**
	 * 根据id查询用户
	 * 
	 * @param sysUserId
	 * @return
	 */
	public List<SysUser> getSysUserById(String sysUserId) {
		// select * from SYS_USER where user_code=#{id} and STATUS='1'
		Cnd condition = Cnd.where("userCode", "=", sysUserId).and("status",
				"=", "1");
		return search(SysUser.class, condition);
	}

	/**
	 * 查询当前所有管理员 用户数量
	 * 
	 * @return
	 */
	public int getTotalCount() {
		Cnd condition = Cnd.where("status", "=", 1);
		return this.searchCount(SysUser.class, condition);
	}

	/**
	 * 分页查询系统用户
	 */
	public List<SysUser> getAllSysUserList(int startNum, int rows) {

		Pager pager = dao.createPager(startNum, rows);
		// 设置一共可以查询的条数
		pager.setRecordCount(dao.count(SysUser.class,
				Cnd.where("status", "=", 1)));
		List<SysUser> users = dao.query(SysUser.class,
				Cnd.where("status", "=", 1), pager);

		return users;
	}

	/**
	 * 根据loginName查询系统用户
	 */
	public List<SysUser> findSysUserByLoginName(Map<String, Object> map) {
		List<SysUser> users = this.searchByPageLike(SysUser.class, "loginName",
				(String) map.get("loginName"), (Integer) map.get("startNum"),
				(Integer) map.get("rows"));
		return users;
	}

	/**
	 * 根据loginName查询系统用户的总记录数
	 */
	public int findSysUserByLoginNameCount(Map<String, Object> map) {
		return searchByPageLike(SysUser.class, "loginName",(String) map.get("loginName"));
	}

	/**
	 * 根据loginName验证登录名是否唯一
	 */
	public List<SysUser> checkLoginName(Map<String, Object> map) {
		Cnd condition = Cnd.where("name", "=", map.get("loginName")).and(
				"status", "=", "1");
		return search(SysUser.class, condition);
	}

}
