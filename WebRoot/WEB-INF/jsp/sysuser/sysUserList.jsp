<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/taglibs.jsp"%>

<form id="pagerForm" method="post" action="demo_page1.html">
	<input type="hidden" name="status" value="${param.status}">
	<input type="hidden" name="keywords" value="${param.keywords}" />
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
</form>


<div class="pageHeader">
	<form  action="demo_page1.html" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					我的客户：<input type="text" name="keyword" />
				</td>
				<td>
					<select class="combox" name="province">
						<option value="">所有省市</option>
						<option value="北京">北京</option>
						<option value="上海">上海</option>
						<option value="天津">天津</option>
						<option value="重庆">重庆</option>
						<option value="广东">广东</option>
					</select>
				</td>
				<td>
					建档日期：<input type="text" class="date" readonly="true" />
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				<li><a class="button" href="demo_page6.html" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${base }/toCreateSysUser" rel="usersNav"  target="dialog" width="600"><span>添加系统用户</span></a></li>
			<li><a class="delete" href="${base }/deleteSysUser?uid={slt_userid}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="${base }/toEditSysUser?uid={slt_userid}" rel="usersNav" target="dialog" width="600" ><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="120" align="center">姓名</th>
				<th width="80">邮箱</th>
				<th width="80">电话</th>
				<th width="80">类型</th>
				<th width="80">创建时间</th>			  
			</tr>
		</thead>
		<tbody>
		<c:forEach var="sysuser" items="${sysuserlist}" varStatus="sts">	
			<tr target="slt_userid" rel="${sysuser.userCode }">
				<td>${sysuser.userName }</td>
				<td>${sysuser.email }</td>
				<td>${sysuser.userPhone }</td>
				<td><c:choose>
						<c:when test="${sysuser.userType eq null}">
								<span class="label label-success">系统</span>		
						</c:when>
						<c:when test="${sysuser.userType == 1}">
								<span class="label label-success">系统</span>		
						</c:when>
						<c:when test="${sysuser.userType == 2}">
						     	<span class="label label-warning">商家</span>	
						</c:when>
						<c:otherwise>
								<span class="label label-important">未知</span>
						</c:otherwise>
					</c:choose></td>
				<td><fmt:formatDate value="${sysuser.createDate }" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>	
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="200" numPerPage="20" pageNumShown="10" currentPage="1"></div>

	</div>
</div>
