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
	if(vo == null){
		 projectName = "";
		 remark = "";
		 date = "";
	} else{
		 projectName = vo.getProjectName();
		 remark = vo.getRemark();
		 date = vo.getDate();
		 userId = vo.getUserId();
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
		var editRow = undefined;
		
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
			frozenColumns : [ [ {//不可被删除的列
				field : 'ck',
				checkbox : true
			}, {
				title : '名称',
				field : 'name',
				width : 100,
				sortable : true,
				formatter:function(value,rec){
					if(value==''){
						return "总计";
					}
					return ''+value;
				}
				
			} ] ],
			columns : [ [ {
				field : 'money',
				title : '金额',
				width : 80,
				sortable : true,
				formatter:function(value,rec){
					if(value==''||isNaN(value)){
						return "";
					}
					return ''+value;
				}
			}, {
				field : 'number',
				title : '数量',
				width : 80,
				sortable : true,
				formatter:function(value,rec){
					if(value==''||isNaN(value)){
						return "";
					}
					return ''+value;
				}
			}, {
				field : 'createTime',
				title : '时间',
				width : 80,
			}, {
				field : 'remark',
				title : '备注',
				width : 150,
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
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
				}
			} ] ],
			
			pagination : true,
			rownumbers : true,
			toolbar : [
			           {
				id : 'btnadd',
				text : '添加明细',
				iconCls : 'icon-add',
				handler : function() {
					window.location.href='<%=request.getContextPath()%>/utc/apply/add.jsp?numId=<%=numId%>';
					return false;//解决IE6的不跳转的bug
				}
			},{
				id : 'btnedit',
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					var rows = $('#queryTable').datagrid('getSelections');
					if (rows.length == 0) {
						$.messager.alert('提示','请选择修改项','info');
						return;
					} else if (rows.length > 1) {
						$.messager.alert('提示','只能选择一项','info');
						return;
					}
					editVO(rows[0].id);
					//window.location.href='<%=request.getContextPath()%>/app/auth/user/queryUser.action?id='+rows[0].id;
					return false;
				}
			},{
				id : 'btndelete',
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					var rows = $('#queryTable').datagrid('getSelections');
					if (rows.length == 0) {
						$.messager.alert('提示','请选择删除项','info');
						return;
					} 
					
					var ids = [];
					for(var i=0;i<rows.length;i++){
						ids.push(rows[i].id);
					}

					$.messager.confirm('确认删除项', '确认删除该选项', function(result){
						if (result){
							window.location.href='<%=request.getContextPath()%>/utc/reimbursementDetail/deleteReimbursementDetail.action?ids='+ids.join('__');
						}
					});
					return false;
				}
			},{
				id : 'btndelete',
				text : '返回',
				iconCls : 'icon-back',
				handler : function() {
							window.location.href='<%=request.getContextPath()%>/utc/apply/show.jsp';
						}
			}]
		});
	});
	
	function deleteVO(id){
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
	}
	
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
			<td><input id="number" type="text" name="number" value="<%=numId %>" size="38"/></td>
			<td></td>
			<td>项目:</td>
			<td><select id="projectName" class="easyui-combobox"
						name="projectName" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=utc.project"
						 valueField="id"
						textField="text" editable="false"></select></td>
			<td></td>
			<td>时间:</td>
			<td><input id="date" type="text" name="date"  class="easyui-datebox" value="<%=date %>"></input></td>
			<td></td>
			<td>员工名:</td>
			<td><input id="userName" type="text" name="userName" value="<%=userName %>" readonly="readonly"></input><td>
			</tr>
			<tr>
				<td>备注:</td>
				<td><textarea id="remark" name="remark" reg="^[\u4e00-\u9fa5]+$" tip="只允许中文字符" style="width:260px; height:50px"><%=remark %></textarea></td>
			</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="add();" iconCls="icon-search">提交</a>
				<!-- <a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a> -->
			</div>
			<input id="userId" type="hidden" name="userId" value="<%=userId %>"></input>
			<input id="state" type="hidden" name="state" value="待提交"></input>
			<input id="createTime" type="hidden" name="createTime"  value="<%=DateUtils.getSystemTime()%>" />
		</form>
	</div>
	<table id="queryTable"></table>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});

		$("#projectName").formValidator({
			onfocus : "项目名不能为空"
		});

		$("#date").formValidator({
			onfocus : "报销时间不能为空"
		}).inputValidator({
			min : 6,
			max : 12
		});

		$("#remark").formValidator({
			onfocus : "备注不能为空"
		}).regexValidator({
			regexp : "email"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});

		$("#phone").formValidator({
			empty : true,
			onfocus : "请正确填写电话(11位)，例如：13566969636"
		}).regexValidator({
			regexp : "phone"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});
	});
</script>
</html>