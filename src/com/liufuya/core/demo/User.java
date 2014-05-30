package com.liufuya.core.demo;

import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.Id;

//@Table("tb_user")
public class User {
	//@Id
	private long id;
	
	//唯一
	//@Name
	private String name;
	
	//设置为 瞬时变量
	private transient String passwd;

	private String status;
	
	public User(){}

	public User(String name, String passwd, String status) {
		super();
		this.name = name;
		this.passwd = passwd;
		this.status = status;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
	
}
