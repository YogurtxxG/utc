<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title>详细信息</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function() {
	var cid = '<%=request.getParameter("cid")%>';
	var did = '<%=request.getParameter("did")%>';
	//按获得文章
	$.post("<%=request.getContextPath()%>/webdo/article/onearticle.do", 
			{aid:cid,id:did}, 
			function(json){
				var id = json.id;
				var titlez = json.title;
				var text = json.text;
				if(titlez==null||titlez.Trim()=="")
					$("#titlez").html("");
				else
					$("#titlez").html(""+titlez);
				
				if(text==null||text.Trim()=="")
					$("#content").html("");
				else
					$("#content").html(text);

			}, 
			"json");
	});

</script>
</head>
<body>
<p id="back-to-top"><a href="#top"><span style="background: url('images/top.png');"></span></a></p>
<a name="top"></a>
<div id="container">
	<%@ include file="include/top.jsp" %>
  	<div id="contant">
    	<%@ include file="include/left.jsp" %>
        <div class="right">
        	<div class="rtnr">
           	  <div class="xpmmt">
        	<div class="xpmmtto">
            	<h5 id="titlez"></h5>
            </div>
            <div class="ll">
            	<div id="content" class="lanmu">
                </div>
            </div>
            <div class="xpmmx"><img src="images/xpmm_x.jpg" width="719" height="4" /></div>
        </div>
            
            </div>
        </div><!--右侧-->
    </div><!--内容区-->
 <%@ include file="include/foot.jsp" %>
</div><!--容器-->
</body>
</html>
