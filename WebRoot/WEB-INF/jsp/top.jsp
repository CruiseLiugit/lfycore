<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<div id="header">
	<div class="headerNav">
		<a class="logo" href="http://j-ui.com">标志</a>
		<ul class="nav">
			<!-- 
			<li id="switchEnvBox"><a href="javascript:">（<span>北京</span>）切换城市</a>
				<ul>
					<li><a href="sidebar_1.html">北京</a>
					</li>
					<li><a href="sidebar_2.html">上海</a>
					</li>
					<li><a href="sidebar_2.html">南京</a>
					</li>
					<li><a href="sidebar_2.html">深圳</a>
					</li>
					<li><a href="sidebar_2.html">广州</a>
					</li>
					<li><a href="sidebar_2.html">天津</a>
					</li>
					<li><a href="sidebar_2.html">杭州</a>
					</li>
				</ul></li>
				 -->
			
			<li><a href="#"><span class="hidden-phone" id="topLoginName"></span></a></li>
			<li><a href="${base}/toEditPwd" target="dialog" width="600">账户设置</a></li>
			<li><a href="${base}/logout">登出系统</a></li>
		</ul>
	</div>

	<!-- navMenu -->

</div>




<!-- 异步根据用户权限，加载当前用户名 -->
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "${base}/usertopLoginName",
			type : "post",
			success : function(result) {
				$("#topLoginName").html(result);
			}
		});
	});
</script>


