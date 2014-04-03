package com.liufuya.core.mvc.module;

import org.nutz.ioc.loader.annotation.Inject;

import com.liufuya.core.dao.BasicDao;


public class BaseAction {
	
	//ioc 注入
	@Inject
	protected BasicDao basicDao;
	
	public void setBasicDao(BasicDao basicDao) {
		this.basicDao = basicDao;
	}
}
