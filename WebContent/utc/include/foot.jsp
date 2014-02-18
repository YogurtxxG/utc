<%@page import="com.saturn.website.Article"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="com.saturn.website.CountPerson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    long count = CountPerson.replaceCount(request.getRealPath("/")+"count.txt");
   if(session.getAttribute("CHEN_CHAO")==null){
    session.setAttribute("CHEN_CHAO","123");
    session.setMaxInactiveInterval(60*60*24);
   count = count+1;
   CountPerson.saveCount(request.getRealPath("/")+"count.txt",count);
}
 %>
<script type="text/javascript">
			$(function() {
				//按获得文章
				$.post("<%=request.getContextPath()%>/webdo/article/onearticle.do", 
						{aid:"doorhtml.foot",id:""}, 
						function(json){
							var id = json.id;
							var titlez = json.title;
							var text = json.text;
							if(text==null||text.Trim()=="")
								$("#bq").html("");
							else
								$("#bq").html(text);
						}, 
						"json");
			});

			function toIndex(){
			//返回首页
				location="./index.jsp";
			}
			
			function toNew(){
			//跳转到新闻页
				location="./newlist.jsp?cid=ccgdzs.newlist";
			}
</script>
<div style="position: absolute;z-index:9999;color:#b20505;margin:40px 0px 0px 400px;font-size: 18px" >累计访问量：<%=count%></div>
	<div id="bq">
  </div><!--版权-->
    <div class="clear"></div>
 
  