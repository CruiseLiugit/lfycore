var ioc ={
		dataSource:{
			type:"org.apache.commons.dbcp.BasicDataSource",
			events:{
				depose:"close"
			},
			fields:{
				driverClassName:"com.mysql.jdbc.Driver",
				url:"jdbc:mysql://127.0.0.1:3306/lfycore?useUnicode=true&characterEncoding=UTF-8",
				username:"root",
				password:"",
				initialSize : 10,
				maxActive : 100,
				minIdle : 10,
				maxIdle : 20,
				defaultAutoCommit : false,
				// validationQueryTimeout : 5,
				validationQuery : "select 1"
			}
		},
		dao :{
			type :"org.nutz.dao.impl.NutDao",
			args :[{refer:"dataSource"}]
		}
};