<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.User"%>
<%@page import="com.saturn.utc.Reimbursement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报销信息</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	User user = (User)request.getSession().getAttribute("authUser");
	String userName = user.getName();
	String userId = user.getId();
	
	String numId = request.getParameter("numId");
	Reimbursement vo = Reimbursement.getByNumber(numId);
	String projectName;
	String remark;
	String date;
	String name;
	if(vo == null){
		 projectName = "";
		 remark = "";
		 date = "";
		 name = "";
	} else{
		 projectName = vo.getProjectName();
		 remark = vo.getRemark();
		 date = vo.getDate();
		 name = vo.getUserName();
	}
	
%>
<script type="text/javascript">

function add() {
	$('#addForm').submit();
}

$(function() {
	$('#projectName').combobox({
		width : 200,
		value : '<%=projectName%>',
		onSelect : function(record){
			$('#projectName').val(record.text);
	    }
	});
});
	$(function() {
		$('#queryTable').datagrid({
			title : '报销明细列表',
			iconCls : 'icon-datalist',
			nowrap : false,
			striped : true, //数据条纹显示
			collapsible : true,
			singleSelect : false,//只能选一行
			url : '<%=request.getContextPath()%>/utc/reimbursementDetail/listReimbursementDetail.action?numId=<%=numId%>',
			sortName : 'id',
			sortOrder : 'desc',
			remoteSort : true,
			fitColumns: true,
			rownumbers:true,
			showFooter:true,
			idField : 'id',//唯一标识列
			frozenColumns : [ [ {
				title : '名称',
				field : 'name',
				width : 100,
				sortable : true
			} ] ],
			columns : [ [ {
				field : 'money',
				title : '金额',
				width : 80,
				sortable : true
			}, {
				field : 'number',
				title : '数量',
				width : 80,
				sortable : true
			}, {
				field : 'createTime',
				title : '时间',
				width : 80	
			}, {
				field : 'remark',
				title : '备注',
				width : 150	
			}] ],
			pagination : true,
			rownumbers : true,
			toolbar : [{
				id : 'btndelete',
				text : '返回',
				iconCls : 'icon-back',
				handler : function() {
							window.location.href='<%=request.getContextPath()%>/utc/count/show.jsp';
						}
			}]
		});
	});
	
	<%-- function deleteVO(id){
		$.messager.confirm('确认删除项', '确认删除该选项', function(result){
			if (result){
				window.location.href='<%=request.getContextPath()%>/utc/reimbursementDetail/deleteReimbursementDetail.action?ids=' + id;
			}
		});
		return false;
	}
	
	function editVO(id){
		window.location.href='<%=request.getContextPath()%>/utc/reimbursementDetail/queryReimbursementDetail.action?id='+ id;
		return false;
	} --%>
	
	function clearQueryForm() {
		$('#queryForm').form('clear');
	}
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="报销申请单"
		icon="icon-query-form" collapsible="true"
		style="padding: 10px;">

		<form id="addForm" method="post" action="<%=request.getContextPath()%>/utc/reimbursement/AddToReimbursement.action">
			<table>
			<tr>	
			<td>编号:</td>
			<td><input id="number" type="text" name="number" value="<%=numId %>" size="39" disabled="disabled"/></td>
			<td></td>
			<td>项目:</td>
			<td><select id="projectName" class="easyui-combobox"
						name="projectName" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=utc.project"
						 valueField="id"
						textField="text" editable="false" disabled="disabled"></select></td>
			<td></td>
			<td>时间:</td>
			<td><input id="date" type="text" name="date"  class="easyui-datebox" value="<%=date %>" disabled="disabled"></input></td>
			<td></td>
			<td>员工名:</td>
			<td><input id="userName" type="text" name="userName" value="<%=name %>"  disabled="disabled" readonly="readonly"></input><td>
			</tr>
			<tr>
				<td>备注:</td>
				<td><textarea id="remark" name="remark" style="width:260px; height:50px" disabled="disabled"><%=remark %></textarea></td>
			</tr>
			</table>
			<!-- <div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="add();" iconCls="icon-search">提交</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a>
			</div> -->
			<input id="userId" type="hidden" name="userId" value="<%=userId %>"></input>
			<input id="state" type="hidden" name="state" value="待提交"></input>
			<input id="createTime" type="hidden" name="createTime"  value="<%=DateUtils.getSystemTime()%>" />
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>