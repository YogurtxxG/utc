<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加报销明细</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function add() {
		$('#addForm').submit();
	}
	
	$(function() {
		$('#name').focus();
		
		$('#name').combobox({
			width : 250
		});
	});
</script>
<%
	User user = (User)request.getSession().getAttribute("authUser");
	String userName = user.getName();
	String userId = user.getId();
%>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加报销明细" icon="icon-add-form"
		collapsible="true" style="padding: 10px;">
		<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/utc/reimbursementDetail/AddReimbursementDetail.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>报销名称:</td>
					<td><select id="name" class="easyui-combobox"
						name="name" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=utc.subject"
						 valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>金额:</td>
					<td><input id="money" name="money" type="text"></input></td>
					<td><div id="moneyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>数量:</td>
					<td><input id="number" name="number" type="text"></input>
					</td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">备注:</td>
					<td><textarea id="remark" name="remark"  style="width:250px;height:50px;"></textarea>
					</td>
					<td><div id="remarkTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
				</tr>
			</table>
			<input id="numId" name="numId" type="hidden" value="<%=request.getParameter("numId") %>"></input>
			<input id="state" name="state" type="hidden" value="创建"></input>
			<input id="userId" name="userId" type="hidden" value="<%=userId%>"></input>
			<input id="createTime" type="hidden" name="createTime" value="<%=DateUtils.getSystemTime()%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
/* 
		$("#name").formValidator({
			onfocus : "名称不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50
		});
 */
		$("#money").formValidator({
			onfocus : "金额不能为空！"
		}).inputValidator({
			min : 1,
			max : 10
		});


		$("#number").formValidator({
			empty : true,
			onfocus : "请正确的数量"
		}).regexValidator({
			regexp : "integer"
		});
	});
</script>
</html>