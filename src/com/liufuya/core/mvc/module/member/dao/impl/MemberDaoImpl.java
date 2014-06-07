package com.liufuya.core.mvc.module.member.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.liufuya.core.mvc.module.BasicDao;
import com.liufuya.core.mvc.module.member.model.Member;
import com.liufuya.core.mvc.module.member.model.MemberAddress;
import com.liufuya.core.mvc.module.member.model.MemberBean;
import com.liufuya.core.mvc.module.privilege.model.Authority;
import com.liufuya.core.mvc.module.privilege.model.Button;
import com.liufuya.core.mvc.module.privilege.model.SysUser;
import com.liufuya.core.mvc.module.privilege.model.UserRole;

/**
 * 会员 dao类
 * 
 * @author caryCheng
 * 
 */
@IocBean
public class MemberDaoImpl extends BasicDao {
	private static final Log log = Logs.get();
	
	/**
	 * 获取当前所有的有效的会员信息
	 */
	public List<MemberBean> findAllMembers() {
		Sql sql = Sqls.create("select m.id as id,m.user_code as user_code,m.user_type as user_type,m.loginName as loginName,m.realName as realName,m.sex as sex,m.memberCard_score as memberCard_score,m.create_date as create_date,m.status as status,a.city as city,a.area as area,a.address_keywords as address_keywords,a.available_shops as available_shops,a.is_available as is_available  " +
				"from lfy_member m,lfy_member_address a  " +
				"where m.user_code=a.user_code and a.is_default='1' and a.status='1' order by m.create_date desc");
		
		// dao.execute(sql) 执行前，编写回调函数，解析 查询结果
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql)
					throws SQLException {
				List<MemberBean> list = new LinkedList<MemberBean>();
				while (rs.next()) {
					// m.FMENU_CODE,m.MENU_URL,m.LEVELID,m.SORTVALUE
					MemberBean menu = new MemberBean();
					menu.setId(rs.getInt("id"));
					menu.setUsercode(rs.getString("user_code"));
					menu.setUsertype(rs.getString("user_type"));
					menu.setLoginname(rs.getString("loginName")); //电话
					menu.setRealname(rs.getString("realName"));
					menu.setUsersex(rs.getString("sex"));
					menu.setMemberCardScore(rs.getInt("memberCard_score"));
					menu.setCreatedate(rs.getDate("create_date"));
					menu.setMemberStatus(rs.getString("status"));
					String city = rs.getString("city");
					String area = rs.getString("area");
					String keyword = rs.getString("address_keywords");
					StringBuffer sb = new StringBuffer("");
					if (city != null) {
						sb.append(city);
					}
					if (area != null) {
						sb.append(area);
					}
					if (keyword != null) {
						sb.append(keyword);
					}
					menu.setDefaultaddress(sb.toString());
					menu.setIsavailable(rs.getString("is_available"));
					
					list.add(menu);
				}

				return list;
			}
		});

		dao.execute(sql);
		return sql.getList(MemberBean.class);
		// Nutz内置了大量回调, 请查看Sqls.callback的属性
	}

	/**
	 * 插入会员
	 */
	public void insertMember(Member Member) {
		this.save(Member);
	}
	
	/**
	 * 插入会员
	 */
	public void insertMemberAddress(MemberAddress member_address) {
		this.save(member_address);
	}

	/**
	 * 更新会员
	 */
	public boolean updateMember(Member Member) {
		return this.update(Member);

	}

	/**
	 * 删除会员
	 */
	public boolean deleteMemberById(String id) {
		return super.delById(new Integer(id.trim()).intValue(),Member.class);
	}

	/**
	 * 通过会员Code 获取会员
	 */
	public Member getMemberByCode(String memberCode) {
		//select * from SYS_Member where id = #{id} and status='1'
		Cnd condition = Cnd.where("user_code", "=", memberCode)
				.and("status", "=", "1");
		return findByCondition(Member.class, condition);
	}
	
	/**
	 * 查询所有会员列表 -实现分页
	 */
	public List<Member> getMemberList(int startNum, int rp) {
		Pager pager = dao.createPager(startNum, rp);
		// 设置一共可以查询的条数
		pager.setRecordCount(dao.count(Member.class,Cnd.where("status", "=", 1)));
		List<Member> meuns = dao.query(Member.class,Cnd.where("status", "=", 1), pager);

		return meuns;
	}

	/**
	 * 统计会员数量
	 */
	public int getMemberCount() {
		//select count(1) from SYS_Member where status='1'	
		Cnd condition = Cnd.where("status", "=", 1);
		return this.searchCount(Member.class, condition);
	}

	
	/**
	 * 通过会员 Id获取会员
	 */
	public Member getMemberById(String id) {
		Cnd condition = Cnd.where("id", "=", id).and("status", "=", "1");
		return findByCondition(Member.class, condition);
	}


	/**
	 * 删除角色权限表
	 */
	public void deleteRoleAuthByauthCode(String authCode) {
		//delete from SYS_ROLES_AUTHORITIES where auth_code = #{authCode} 
		
		Sql sql = Sqls.create("delete from SYS_ROLES_AUTHORITIES where auth_code = @authCode ");
		sql.params().set("authCode", authCode);
		dao.execute(sql);
	}

	

	

}
