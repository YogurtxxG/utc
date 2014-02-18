<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加网站文章</title>
<!-- kindEditor和easyui样式冲突 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/panel.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/combo.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/combobox.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/linkbutton.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/saturn.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/formValidator/validator.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/easyui-lang-zh_CN.js"></script>

<%@ include file="/app/includes/kindEditor.jsp" %>
<script type="text/javascript">
var editor = "";
	function edit() {
		editor.sync();
		$('#addForm').submit();
	}
	
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="text"]', {
			cssPath : '<%=request.getContextPath()%>/app/js/kindEditor/plugins/code/prettify.css',
			fileManagerJson : '<%=request.getContextPath()%>/app/system/upload/fileManager.action',
			uploadJson : '<%=request.getContextPath()%>/app/system/upload/upload.action',
			allowFileManager : true
		});
	});
	
	$(function() {
		$('#title').focus();
		
		$('#type').combobox({
			width : 250,
			value : "article.state.normal",
			onSelect : function(record){
				$('#typeName').val(record.text);
		    }
		});
		
		$('#state').combobox({
			width : 250,
			value : "visible.true",
			onSelect : function(record){
				$('#stateName').val(record.text);
		    }
		});
	});
	
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改信息"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/website/recommend/updateRecommend.action"
			method="post">
			<table>
			<tr>
			<td width="550px">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>品牌:</td>
					<td><input id="brand" name="brand" type="text" value="${recommend.brand }"></input></td>
					<td><div id="brandTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>型号:</td>
					<td><input id="model" name="model" type="text" value="${recommend.model}"></input></td>
					<td><div id="modelTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>原价:</td>
					<td><input id="oldCost" name="oldCost" type="text" value="${recommend.oldCost }"></input></td>
					<td><div id="oldCostTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>现价:</td>
					<td><input id="nowCost" name="nowCost" type="text" value="${recommend.nowCost }"></input></td>
					<td><div id="nowCostTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>厂商:</td>
					<td><input id="factory" name="factory" type="text" value="${recommend.factory }"></input></td>
					<td><div id="factoryTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
						name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=article.state" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>显示:</td>
					<td><select id="state" class="easyui-combobox"
						name="state" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=visible" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="stateTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="edit()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>(提交: Ctrl+Enter)
						</div></td>
				</tr>
			</table>
			</td>
			</tr>
			</table>
			<textarea name="text" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${recommend.text}</textarea>
			<input id="typename" type="hidden" name="typename" type="text" value="普通"></input>
			<input id="statename" type="hidden" name="statename" type="text" value="显示"></input>
			<input id="createtime" type="hidden" name="createtime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
			<input id="id" type="hidden" name="id" type="text" value="${recommend.id }"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
</script>
</html>






