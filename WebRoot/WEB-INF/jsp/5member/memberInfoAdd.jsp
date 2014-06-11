<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp"%>


<form action="${base}/createMemberInfo" method="post" class='required-validate pageForm' onsubmit="return validateCallback(this, dialogAjaxDone);">
<input type="hidden" name="navTabId" value="A_USERMANAGE" />

<div class="pageContent">
	
		<div class="pageFormContent" layoutH="56">
			<div class="unit">
				<label>真实姓名：</label>
				<input  class="required" id="c_realName" type="text" name="member.realName" size="30"  alt="请输入真实姓名"/>
			</div>
			
			<div class="unit">
				<label>手机号码：</label>
				<input class="required" id="c_loginName" type="text" name="member.telphone" size="30"  alt="手机号码就是登录名" value=""/>
			</div>
			
			<div class="unit">
				<label>用户原始密码：</label>
				<input type="text" readonly="readonly" name="member.loginPwd" value="123456"  size="30" class="textInput">	
			</div>
			<div class="unit">
				<label>用户邮箱：</label>
				<input class="textInput email" type="text"  name="member.email"  value=""  size="30"  alt="请输入正确的邮箱">
			</div>
			<div class="unit">
				<label>用户性别：</label>
				<input type="radio" name="member.sex" value="1"  checked="checked"/>男
				<input type="radio" name="member.sex" value="0"  />女
			</div>
			<div class="unit">
				<label>用户生日：</label>
				<input type="text" name="member.birthday" class="date" readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
			</div>
			<div class="unit">
				<label>身份证号：</label>
				<input  name="member.card_number" type="text" size="30" alt="请输入身份证号码" class="textInput"/>
			</div>
			<div class="unit">
				<label>所在城市：</label>
				<input class="required" name="member.city" type="text" size="30" alt="请输入所在城市，如上海市"/>
			</div>
			<div class="unit">
				<label>所在县区：</label>
				<input class="required" name="member.city_part" type="text" size="30" alt="请输入所在城区，如徐汇区"/>
			</div>
			<div class="unit">
				<label>详细地址：</label>
				<input class="required"  name="member.default_address" type="text" size="30" alt="如 xx市xx区xx路2号楼203室" />
			</div>
			<div class="unit">
				<label>年龄段：</label>
				<select class="required combox" name="member.age_area">
					<option value="0">请选择</option>
                    <option value="60前">60前</option>
                    <option value="60后">60后</option>
                    <option value="70后">70后</option>
                    <option value="80后" selected>80后</option>
                    <option value="90后">90后</option>
                    <option value="00后">00后</option>
                    <option value="10后">10后</option>
				</select>
			</div>
			<div class="unit">
				<label>职业：</label>
				<select class="required combox" name="member.work_type">
					<option value="0">请选择</option>
					<option value="无职业" selected>无职业</option>
                    <option value="科研人员">科研人员</option>
                    <option value="律师/法务/合规">律师/法务/合规</option>
                    <option value="教师">教师</option>
                    <option value="医院/医疗/护理">医院/医疗/护理</option>
                    <option value="公务员">公务员</option>
                    <option value="在校学生">在校学生</option>
                    <option value="翻译">翻译</option>
                    <option value="建筑装潢/市政建设">建筑装潢/市政建设</option>
                    <option value="行政/后勤">行政/后勤</option>
                    <option value="互联网/电子商务/网游">互联网/电子商务/网游</option>
                    <option value="销售人员">销售人员</option>
                    <option value="采购">采购</option>	
                    <option value="公关/媒介">公关/媒介</option>	
                    <option value="酒店/旅游">酒店/旅游</option>	
                    <option value="计算机软件">计算机软件</option>	
                    <option value="物流/仓储">物流/仓储</option>	
                    <option value="人力资源">人力资源</option>	
                    <option value="艺术/设计">艺术/设计</option>
				</select>
			</div>
			<div class="unit">
				<label>家庭收入：</label>
				<select class="required combox" name="member.family_money">
					<option value="0">请选择</option>
					<option value="1000以下">1000以下</option>
                    <option value="1000-3000">1000-3000</option>
                    <option value="3000-5000">3000-5000</option>
                    <option value="5000-10000" selected>5000-10000</option>
                    <option value="10000-20000">10000-20000</option>
                    <option value="20000-50000">20000-50000</option>
                    <option value="50000以上">50000以上</option>
				</select>
			</div>
			
			
			<div class="unit">
				<label>实体卡号：</label>
				<input  name="member.entityCardNumber" type="text" size="30" alt="请输入实体卡号码" class="textInput"/>
			</div>
			<div class="unit">
				<label>实体状态：</label>
				<select class="required combox" name="member.entityCardStatus" id="c_usertype">
					<option value="0">请选择</option>
					<option value="1" selected>已开卡</option>
					<option value="2">已使用</option>
					<option value="3">已作废</option>
				</select>
			</div>
			<div class="unit">
				<label>会员卡余额：</label>
				<input id="c_userphone"  name="member.memberCard_balance" type="text" size="30" alt="请输入会员卡余额" class="textInput" value="0"/>
			</div>
			<div class="unit">
				<label>会员卡积分：</label>
				<input id="c_userphone"  name="member.memberCard_score" type="text" size="30" alt="请输入会员卡积分" class="textInput" value="0"/>
			</div>
			
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="adduserBtn">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	
</div>

</form>

<script type="text/javascript">
	
</script>



