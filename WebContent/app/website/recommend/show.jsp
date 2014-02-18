<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>文章信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#state').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
			
			$('#type').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
			
			$('#queryTable').datagrid({
				title : '推荐木门',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/website/recommend/listRecomentMM.action',
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					title : '标识',
					width : 40,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'brand',
					title : '品牌',
					width : 150,
					sortable : true
				}, {
					field : 'model',
					title : '型号',
					width : 200,
					sortable : true
				}, {
					field : 'oldCost',
					title : '原价',
					width : 80,
					sortable : true
				}, {
					field : 'nowCost',
					title : '现价',
					width : 80,
					sortable : true
				}, {
					field : 'typename',
					title : '类型',
					width : 80,
					sortable : true
				}, {
					field : 'statename',
					title : '状态',
					width : 80,
					sortable : true
				}, {
					field : 'factory',
					title : '厂商',
					width : 150,
					sortable : true
				}, {
					field : 'createtime',
					title : '创建时间',
					width : 120,
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
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/website/recommend/add.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}, {
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
								window.location.href='<%=request.getContextPath()%>/app/website/recommend/deleteRecommend.action?ids='+ids.join('__');
							}
						});
						return false;
					}
				}, '-']
			});
			
			$('#cid').combogrid({
				panelWidth : 600,
				idField : 'id',
				textField : 'name',
				pagination : true,
				rownumbers : true,
				sortName : 'id',
				sortOrder : 'asc',
				remoteSort : true,
				url : '<%=request.getContextPath()%>/app/website/content/list.action',
				columns : [[
					{field : 'id',title : '标识',width : 150, sortable : true},
					{field : 'name',title : '名称',width : 100, sortable : true},
					{field : 'hasShowName',title : '显示', width : 120, sortable : true}
				]],
				onSelect:function(record){
					queryVO();
			    }
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					cid : $('#cid').combogrid('getValue'),
					title : $('#title').val(),
					type : $('#type').combobox('getValue'),
					createTime : $('#createTime').datebox('getValue'),
					operaterName : $('#operaterName').val(),
					state : $('#state').combobox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/website/recommend/deleteRecommend.action?ids=' + id;
				}
			});
			return false;
		}
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/website/recommend/queryRecommend.action?id='+ id;
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>目录标识:</td>
					<td><select id="cid" name="cid" type="text"></select></td>
					<td>题目:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td>创建时间:</td>
					<td><input id="createTime" name="createTime" class="easyui-datebox" type="text"></input></td>
					<td>操作人:</td>
					<td><input id="operaterName" name="operaterName" type="text"></input></td>
				</tr>
				<tr align="right">
					<td>类型:</td>
					<td align="left"><select id="type" class="easyui-combobox"
						name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=article.state" valueField="id"
						textField="text" mode="remote"></select></td>
					<td>是否显示:</td>
					<td align="left"><select id="state" class="easyui-combobox"
						name="state" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=visible" valueField="id"
						textField="text" mode="remote"></select></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>




