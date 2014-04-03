var ioc ={
		dataSource:{
			type:"org.apache.commons.dbcp.BasicDataSource",
			events:{
				depose:"close"
			},
			fields:{
				driverClassName:"com.mysql.jdbc.Driver",
				url:"jdbc:mysql://127.0.0.1:3306/lfycore?useUnicode=true&characterEncoding=utf-8",
				username:"root",
				password:""
			}
		},
		dao :{
			type :"org.nutz.dao.impl.NutDao",
			args :[{refer:"dataSource"}]
		}
};