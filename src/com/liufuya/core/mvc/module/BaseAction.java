package com.liufuya.core.mvc.module;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

//@IocBean
public class BaseAction {
	
	//ioc 注入
	//@Inject("refer:basicDao")
	protected BasicDao basicDao;
	
	public void setBasicDao(BasicDao basicDao) {
		this.basicDao = basicDao;
	}
}
