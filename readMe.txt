记录每天修改的细节：

//----------------------------------------------
//2014-04-06
1、登录完成后，需要解决权限问题。权限首先要解决都是菜单。
   目前所有菜单全部静态的，但是需要在后台能够管理。每次用户登录时，动态取出分配给他的菜单项目
   


//----------------------------------------------
//2014-04-05
1、实现用户，权限模块
   com.liufuya.core.mvc.module.privilege.dao.impl.SysUserDaoImpl          数据库操作实现
   
   //////////////////////////////////////
   SysUserDaoImpl.java 类实现。
   调用了 父类 BasicDao 类中的大量方法。发现 Nutz 用于做 Dao 层思路很简单。
   updata 操作,通过一个不断增加的  Chain.make() 方法设置多个要修改的值
              通过一个不断增加的  Cnd.where().and() 方法设置多个条件
   很好用!!!!            
   //////////////////////////////////////
   
2、数据库操作实现后，做了一个服务层类 
  com.liufuya.core.mvc.module.privilege.service.impl.SysUserServiceImpl
  
  该类用于 Model 与 Controller 直接的层。
  
3、实现了登录的控制层代码    
   com.liufuya.core.mvc.module.privilege.action.SysUserAction
   
   //////////////////////////////////////
   为了让 Nutz ioc 容器管理上面的 三个类。统一都在类名前面添加 @IocBean
   为了让 Nutz ioc 容器注入需要都对象，在对象前面添加 @Inject("refer:sysUserServiceImpl")   
   //////////////////////////////////////	

4、实现了 WEB-INF/jsp/account/login.jsp 页面的 脚本验证

5、页面遇到一个问题。当把资源文件 image css js 文件夹放在 WebRoot 目录下。
   在设置访问路径的时候 增加一级目录会导致资源文件无法找到。
   目前都只使用一级目录
   
//----------------------------------------------
//2014-04-04
1、增加用户角色、权限表
   ddl/sys_role.sql
   ddl/sys_user_role.sql
   ddl/sys_user.sql
   ddl/sys_authorities.sql
   ddl/sys_roles_authorities.sql
   ddl/sys_menus.sql    子菜单
   ddl/sys_model.sql    增删改查功能按钮

2、增加表的对应实体类，并进行 Nutz 映射配置
  com.liufuya.core.mvc.module.privilege.model
  
3、完成 模型层和 service 层代码搭建
	//使用 Nutz 觉得麻烦，去掉了接口 包   mapper     inter
   com.liufuya.core.mvc.module.privilege.model  数据库表映射实体类 
   com.liufuya.core.mvc.module.privilege.dao.mapper        数据库操作接口 
   com.liufuya.core.mvc.module.privilege.dao.impl          数据库操作实现

   com.liufuya.core.mvc.module.privilege.service.inter MVC 服务层接口
   com.liufuya.core.mvc.module.privilege.service.impl  MVC 服务层实现
   
   com.liufuya.core.mvc.module.privilege.action        MVC 控制层
   
   
//----------------------------------------------
//2014-04-03
1、把 缪汉斌 工程中使用的工具类导入工程中
   com.liufuya.common
   com.liufuya.common.base
   com.liufuya.common.util
   com.liufuya.common.uuid
   
   这些包都不会被 Nutz 扫描到
   备注：在导入这些包中的类时，把所有的 json 解析换成 Nutz JSON 解析了；
com.liufuya.common.CommonExcel.java 中用 POI 处理 Excel ，添加了 poi-3.0-FINAL.jar
com.liufuya.common.ResponseUtils.java 使用了Apache Commons 语言工具 StringUtils，添加了 commons-lang-2.4.jar
   
2、把 页面常用的 工具页面也导入到工程中
  WEB-INF/jsp/common/taglibs.jsp
     



//----------------------------------------------
//2014-04-01
1、选中后台页面模版
2、准备好后台页面模版需要的 样式、脚本文件
  WebRoot/css
  WebRoot/img
  WebRoot/js
3、通过后台类，控制欢迎页面
  com.liufuya.core.mvc.module.BaseAction.java  父Action，获取数据库Dao对象，ioc 注入
  com.liufuya.core.mvc.module.IndexAction.java 首页Action，访问项目根路径/，跳转到
     WEB-INF/jsp/account/login.jsp 页面
  通过 Nutz 注解  @At(/) 实现   
     
4、login.jsp 页面中，通过 ${base} 获取项目根路径，读取 WEB-INF 目前外部的 css js 文件
5、login.jsp 登录表单，提交给 action="${base}/login" ,由 IndexAction.java 处理
6、com.liufuya.core.dao.ManagerDao.java  是专门为 管理员数据库操作新建的类。所有跟用户有关的数据库访问代码都放在这里
7、IndexAction.java  中通过 ioc 注入 ManagerDao 对象
   @Inject
   private ManagerDao managerDao;
  
   经过验证后，返回错误信息
   req.setAttribute("error", "用户名或者密码错误！");
   
   用户登录成功后，当前用户对象存入 HttpSession 中
   req.getSession().setAttribute("admin", m);
   
   跳转到相应页面，由于路径多余两个，所以使用  JspView 控制返回路径
   return new JspView("jsp.index");	
   	     
      


//----------------------------------------------
//2014-03-30
1、使用 Nutz 框架建立一个 能够连接数据库的 MVC 原型
2、com.liufuya.core.MainModeule.java 配置了系统的 IOC
3、com.liufuya.core.CoreSetup.java   创建了启动是提前或销毁时做的操作，暂无
4、一个初始的登录例子
  WebRoot/testlogin.jsp 
  com.liufuya.core.bean.User.java 
  com.liufuya.core.mvc.module.UserModule.java 
  
  
  