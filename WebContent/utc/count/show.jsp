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
	$('#projectName').combobox({
		width : 200,
		onSelect : function(record){
			$('#projectName').val(record.text);
	    }
	});
});


	$(function() {
		$('#queryTable').datagrid({
			title : '报销列表',
			iconCls : 'icon-datalist',
			nowrap : false,
			striped : true, //数据条纹显示
			collapsible : true,
			singleSelect : false,//只能选一行
			url : '<%=request.getContextPath()%>/app/utc/reimbursement/TotalReimbursement.action',
			sortName : 'id',
			sortOrder : 'desc',
			remoteSort : true,
			showFooter:true,
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
				sortable : true,
				formatter:function(value,rec){
					if(value==''){
						return "总计";
					}
					return ''+value;
				}
			}, {
				field : 'money_total',
				title : '金额',
				width : 120,
				formatter:function(value,rec){
					if(value==''||isNaN(value)){
						return "";
					}
					return ''+value;
				}
			}, {
				field : 'number_total',
				title : '数量',
				width : 120,
				sortable : true,
				formatter:function(value,rec){
					if(value==''||isNaN(value)){
						return "";
					}
					return ''+value;
				}
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
				field : 'opt',
				title : '操作',
				width : 100,
				align : 'center',
				rowspan : 2,
				formatter : function(value, rec) {
					if(rec.id==''){
						return "";
					}
					return '<span><a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
				}
			} ] ],
			pagination : true,
			rownumbers : true,
			showFooter : true,
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
	
	function viewVO(id){
		window.location.href='<%=request.getContextPath()%>/utc/state/show.jsp?id='+ id;
		return false;
	}
	
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
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true"
		style="padding: 10px;">

		<form id="queryForm" method="post">
		<table>
			<tr>	
			<td>报销编号:</td>
			<td><input id="number" type="text" name="number"></input></td>
			<td>项目:</td>
			<td><select id="projectName" class="easyui-combobox"
						name="projectName" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=utc.project"
						 valueField="id"
						textField="text" editable="false"></select></td>
			<td>时间:</td>
			<td><input id="date" type="text" name="date" class="easyui-datebox"></input></td>
			<td>报销人 :</td>
			<td><input id="userName" type="text" name=""userName""></input><td>
			<td>状态:</td>
			<td><input id="state" type="text" name="state"></input><td>
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