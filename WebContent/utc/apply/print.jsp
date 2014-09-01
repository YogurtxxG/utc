<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.saturn.utc.Reimbursement" %>
<%@ page import="com.saturn.utc.ValuesConvertUppercase" %>
<%
	String id=request.getParameter("id");
    Reimbursement vo = new Reimbursement();
    String upper = "";
	if(id!=null&&!id.trim().equals("")){
		vo = Reimbursement.get(id);
		 upper = ValuesConvertUppercase.valuesToString(vo.getMoney_total());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>优泰科技报销单</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "宋体";
	font-size: 18px;
}
.STYLE4 {font-family: "宋体"; font-size: 18px; }
-->
</style>
<script> 
var hkey_root,hkey_path,hkey_key 
hkey_root="HKEY_CURRENT_USER" 
hkey_path="file://software//Microsoft//Internet Explorer\\PageSetup\\" 
//设置网页打印的页眉页脚为空 
function pagesetup_null(){ 
try{ 
var RegWsh = new ActiveXObject("WScript.Shell"); 
hkey_key="header";
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
hkey_key="footer";
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
}catch(e){} 
} 
//设置网页打印的页眉页脚为默认值 
function pagesetup_default(){ 
try{ 
var RegWsh = new ActiveXObject("WScript.Shell");
hkey_key="header" ;
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P"); 
hkey_key="footer" ;
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&u&b&d"); 
}catch(e){} 
} 
function setdivhidden(id){//把指定id以外的层统统隐藏 
document.getElementById("div0").style.display="none"; 
}
function setdivvisible(id){//把指定id以外的层统统显示 
document.getElementsByTagName("div0").display="block"; 
} 
function printpr() //预览函数 
{ 
pagesetup_null();//预览之前去掉页眉，页脚 
setdivhidden("div1");//打印之前先隐藏不想打印输出的元素 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);//在body标签内加入html（WebBrowser activeX控件） 
WebBrowser1.ExecWB(7, 1);//打印预览 
WebBrowser1.outerHTML = "";//从代码中清除插入的html代码 
pagesetup_default();//预览结束后页眉页脚恢复默认值 
setdivvisible("div1");//预览结束后显示按钮 
} 
function print() //打印函数 
{ 
pagesetup_null();//打印之前去掉页眉，页脚 
setdivhidden("div1"); //打印之前先隐藏不想打印输出的元素 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);//在body标签内加入html（WebBrowser activeX控件） 
WebBrowser1.ExecWB(6, 1);//打印 
WebBrowser1.outerHTML = "";//从代码中清除插入的html代码 
pagesetup_default();//打印结束后页眉页脚恢复默认值 
setdivvisible("div1");//打印结束后显示按钮 
} 
</script> 
</head>

<body>
<center>
<!-- <div id="div0"> 
<input type="button" onclick="printpr();"  value="打印预览"> 
<input type="button" onClick="print();" value="打印"> <p>
</div>  -->
<div id="div1"> 
<table border="0" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <col width="193" />
  <col width="72" span="3" />
  <col width="93" />
  <col width="72" span="2" />
  <col width="95" />
  <tr height="30">
    <td colspan="2" height="30" width="641"><div align="center" class="STYLE1">优泰科技报销单据</div></td>
  </tr>
 	 <tr>
   	 	 <td colspan="4"><div align="right"><span class="STYLE4">报销编号:</span></div></td>
   	 	 <td colspan="5"><div align="right"><span class="STYLE4"><%=vo.getNumber() %></span></div></td>
    </tr>
    <tr>
   	 	<td colspan="9" colspan="2"><div align="right"><span class="STYLE4"><%=vo.getDate() %></span></div></td>
    </tr>
    <tr>
	    <td colspan="7"><div align="right"><span class="STYLE4">凭证数:</span></div></td>
	    <td colspan="2"><div align="right"><span class="STYLE4"><%=vo.getNumber_total() %></span>张</div></td>
    </tr>
    <tr>
    	<td colspan="7"><div align="right"><span class="STYLE4">合计金额:</span></div></td>
	    <td colspan="2"><div align="right"><span class="STYLE4"><%=vo.getMoney_total() %></span>元</div></td>
  </tr>
  <tr>
	    <td colspan="5"><div align="right"><span class="STYLE4">(大写合计):</span></div></td>
	    <td colspan="4"><div align="right"><span class="STYLE4"><%=upper %></span></div></td>
    </tr>
    	<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
   		<tr><td>&nbsp;</td></tr>
    <tr>
    	<td><div align="left"><span class="STYLE4">领导签字:</span></div></td>
	    <td colspan="4"><div align="left"><span class="STYLE4">部门签字:</span></div></td>
	    <td colspan="4"><div align="left"><span class="STYLE4">报销人:<%=vo.getUserName() %></span></div></td>
    </tr>
</table>
</div>
</center>
</body>
</html>
