<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报销状态信息表</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
$(function() {
	$('#projectName').combobox({
		width : 200,
		onSelect : function(record){
			$('#projectName').val(record.text);
	    }
	});
});


	$(function() {
		$('#queryTable').datagrid({
			title : '报销状态信息列表',
			iconCls : 'icon-datalist',
			nowrap : false,
			striped : true, //数据条纹显示
			collapsible : true,
			singleSelect : false,//只能选一行
			url : '<%=request.getContextPath()%>/app/utc/reimbursementState/queryReimbursementState.action?reimbursement_id=<%=request.getParameter("id")%>',
			sortName : 'id',
			sortOrder : 'desc',
			remoteSort : true,
			idField : 'id',//唯一标识列
			frozenColumns : [ [ {//不可被删除的列
				field : 'ck',
				checkbox : true
			} ] ],
			columns : [ [{
				field : 'number',
				title : '编号',
				width : 120,
				sortable : true
			}, {
				field : 'projectName',
				title : '项目',
				width : 200,
				sortable : true
			}, {
				field : 'money_total',
				title : '金额',
				width : 120,
				
			}, {
				field : 'number_total',
				title : '数量',
				width : 120,
				sortable : true
			}, {
				field : 'date',
				title : '申报日期',
				width : 150,
				sortable : true	
			}, {
				field : 'userName',
				title : '报销人',
				width : 120,
				sortable : true	
			}, {
				field : 'state',
				title : '状态',
				width : 100,
				sortable : true	
			}, {
				field : 'remark',
				title : '审批意见',
				width : 200,
				sortable : true	
			}] ],
			pagination : true,
			rownumbers : true,
			toolbar : [ {
				id : 'btnadd',
				text : '查看明细',
				iconCls : 'icon-add',
				handler : function() {
					window.location.href='<%=request.getContextPath()%>/utc/apply/toReimbursementDetail.action';
					return false;//解决IE6的不跳转的bug
				}
			}]
		});
	});
	
	
	function queryVO() {
		$('#queryTable').datagrid({
			queryParams : {
				number : $('#number').val(),
				projectName : $('#projectName').combobox('getValue'),
				date : $('#date').datebox('getValue'),
				userName : $('#userName').val(),
				state : $('#state').val()
			}});
		$('#queryTable').datagrid("load");
	}
	
	function clearQueryForm() {
		$('#queryForm').form('clear');
	}
</script>
</head>
<body>
	<table id="queryTable"></table>
</body>
</html>