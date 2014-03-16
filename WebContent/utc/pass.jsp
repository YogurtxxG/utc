<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>低保通过</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
	function check() {
		$('#passForm').submit();
	}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="审批报销意见"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">
		
		<form id="passForm" name="passForm" method="post" action="<%=request.getContextPath()%>/utc/reimbursement/confirmReimbursement.action">
		<input type="hidden" id="id" name="id" value="<%=request.getParameter("id")%>">
		<input type="hidden" id="type" name="type" value="<%=request.getParameter("type")%>">
			<table>
				<tr align="left">
					<td>选项:</td>
					<td><select id="state" class="easyui-combobox"
						name="state" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=utc.type"
						 valueField="id"
						textField="text" editable="false"></select></td>
				</tr>
				<tr align="right">	
					<td>意见:</td>
					<td><textarea id="remark" name="remark" style="width:500px;height:100px;"></textarea></td>
				</tr>
			</table>
			<div style="padding: 40px;" >
				<a href="#" class="easyui-linkbutton" onclick="check();" 
					iconCls="icon-ok">确定</a>
				<a href="javascript:history.back(-1)" class="easyui-linkbutton"
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
</body>
</html>
