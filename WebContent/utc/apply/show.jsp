<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报销信息</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#queryTable').datagrid({
			title : '报销列表',
			iconCls : 'icon-datalist',
			nowrap : false,
			striped : true, //数据条纹显示
			collapsible : true,
			singleSelect : false,//只能选一行
			url : '<%=request.getContextPath()%>/app/utc/reimbursement/listReimbursement.action',
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
				field : 'createTime',
				title : '时间',
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
				field : 'opt',
				title : '操作',
				width : 100,
				align : 'center',
				rowspan : 2,
				formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
				}
			} ] ],
			pagination : true,
			rownumbers : true,
			toolbar : [ {
				id : 'btnadd',
				text : '创建',
				iconCls : 'icon-add',
				handler : function() {
					window.location.href='<%=request.getContextPath()%>/utc/apply/toReimbursementDetail.action';
					return false;//解决IE6的不跳转的bug
				}
			},'-',{
				id : 'btnedit',
				text : '查看明细',
				iconCls : 'icon-redo',
				handler : function() {
					var rows = $('#queryTable').datagrid('getSelections');
					if (rows.length == 0) {
						$.messager.alert('提示','请选择操作项','info');
						return;
					} else if (rows.length > 1) {
						$.messager.alert('提示','只能选择一项','info');
						return;
					}
					
					window.location.href='<%=request.getContextPath()%>/utc/apply/showDetail.jsp?numId='+rows[0].number;
					return false;
				}
			},'-',{
				id : 'btnedit',
				text : '提交',
				iconCls : 'icon-redo',
				handler : function() {
					var rows = $('#queryTable').datagrid('getSelections');
					if (rows.length == 0) {
						$.messager.alert('提示','请选择操作项','info');
						return;
					} else if (rows.length > 1) {
						$.messager.alert('提示','只能选择一项','info');
						return;
					}
					
					window.location.href='<%=request.getContextPath()%>/utc/reimbursement/applyReimbursement.action?id='+rows[0].id;
					return false;
				}
			} , '-' ,{
					id : 'btnedit',
					text : '打印',
					iconCls : 'icon-manger',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择修改项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						window.location.href='<%=request.getContextPath()%>/app/auth/user/queryUserRecource.action?id=' + rec.number;
						return false;
					}
				}]
		});
	});
	
	function deleteVO(id,number){
		$.messager.confirm('确认删除项', '确认删除该选项', function(result){
			if (result){
				window.location.href='<%=request.getContextPath()%>/utc/reimbursement/deleteReimbursement.action?ids=' + id;
			}
		});
		return false;
	}
	
	function editVO(id){
		window.location.href='<%=request.getContextPath()%>/app/auth/user/queryUser.action?id='+ id;
		return false;
	}
	
	function queryVO() {
		$('#queryTable').datagrid({
			queryParams : {
				id : $('#id').val(),
				name : $('#name').val(),
				email : $('#email').val(),
				phone : $('#phone').val()
			}});
		$('#queryTable').datagrid("load");
	}
	
	function clearQueryForm() {
		$('#queryForm').form('clear');
	}
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true"
		style="padding: 10px;">

		<form id="queryForm" method="post">
		<table>
			<tr>	
			<td>编号:</td>
			<td><input id="id" type="text" name="id"></input></td>
			<td>项目:</td>
			<td><select id="project" class="easyui-combobox"
						name="project" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=utc.project"
						 valueField="id"
						textField="text" editable="false"></select></td>
			<td>时间:</td>
			<td><input id="createTime" type="text" name="createTime" class="easyui-datebox"></input></td>
			<td>报销人 :</td>
			<td><input id="phone" type="text" name="phone"></input><td>
			<td>状态:</td>
			<td><input id="phone" type="text" name="phone"></input><td>
			</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" iconCls="icon-search">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a>
			</div>
		</form>
		
	</div>
	<table id="queryTable"></table>
</body>
</html>