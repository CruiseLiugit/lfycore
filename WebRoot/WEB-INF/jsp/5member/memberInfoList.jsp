<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/taglibs.jsp"%>


<form id="pagerForm" method="post" action="demo_page1.html">
	<input type="hidden" name="status" value="${param.status}"> <input
		type="hidden" name="keywords" value="${param.keywords}" /> <input
		type="hidden" name="pageNum" value="1" /> <input type="hidden"
		name="numPerPage" value="${model.numPerPage}" /> <input type="hidden"
		name="orderField" value="${param.orderField}" />
</form>



<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="demo_page1.html"
		method="post">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>搜索会员姓名：</label><input type="text"/></li>
				<li></li>
			</ul>

			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
					<li><a class="button" href="${base }/m5_toMemberSearch" target="dialog" width="720" height="400" mask="true" title="高级检索" ><span>高级检索</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${base }/m5_toCreateMember"
				rel="usersNav" target="dialog" width="400" height="280"><span>批量导入</span>
			</a></li>
			<li><a class="delete"
				href="${base }/deleteSysMenus?uid={slt_userid}" target="ajaxTodo"
				title="确定要删除吗?"><span>删除</span> </a></li>
			<li><a class="edit"
				href="${base }/toEditSysUser?uid={slt_userid}" rel="usersNav"
				target="dialog" width="600"><span>修改</span> </a></li>
			<li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls"
				target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span>
			</a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40">会员编号</th>
				<th width="30">会员姓名</th>
				<th width="30">会员类型</th>
				<th width="30">性别</th>
				<th width="120">默认地址</th>
				<th width="30">会员积分</th>
				<th width="30">注册日期</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>010120</td>
				<td>张三</td>
				<td>网站注册</td>
				<td>男</td>
				<td>上海闸北区闻喜路954号103室</td>
				<td>100</td>
				<td>2014-05-30</td>
			</tr>
		</tbody>
		<!--
		<tbody> 
			<c:forEach var="sysmenus" items="${sysmenuslist}">
				<c:if test="${sysmenus.menuUrl != '#'}">
					<tr>
						<td>${sysmenus.menuName }</td>
						<td>${sysmenus.levelId }</td>
						<td>${sysmenus.engName }</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
		 -->
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span> <select class="combox" name="numPerPage"
				onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select> <span>条，共${totalCount}条</span>
		</div>

		<div class="pagination" targetType="navTab" totalCount="200"
			numPerPage="20" pageNumShown="10" currentPage="1"></div>

	</div>
</div>
