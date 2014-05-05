<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改报销明细</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function add() {
		$('#editForm').submit();
	}
	
	$(function() {
		$('#name').focus();
		$('#name').combobox({
			width : 200,
			value : '${reimb.name}'
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改报销明细" icon="icon-add-form"
		collapsible="true" style="padding: 10px;">
		<form id="editForm" name="editForm"
			action="<%=request.getContextPath()%>/utc/reimbursementDetail/updateReimbursementDetail.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>报销名称:</td>
					<td><select id="name" class="easyui-combobox"
						name="name" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=utc.subject"
						 valueField="id" textField="text" editable="false"></select></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>金额:</td>
					<td><input id="money" name="money" type="text" value="${reimb.money}"></input></td>
					<td><div id="moneyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>数量:</td>
					<td><input id="number" name="number" type="text" value="${reimb.number}"></input>
					</td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">备注:</td>
					<td><textarea id="remark" name="remark"  style="width:250px;height:50px;">${reimb.remark}</textarea>
					</td>
					<td><div id="remarkTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">确定</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="${reimb.id}"></input>
			<input id="numId" name="numId" type="hidden" value="${reimb.numId}"></input>
			<input id="state" name="state" type="hidden" value="${reimb.state}"></input>
			<input id="createTime" type="hidden" name="createTime" value="<%=DateUtils.getSystemTime()%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		/* $("#name").formValidator({
			onfocus : "名称不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50
		}); */

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