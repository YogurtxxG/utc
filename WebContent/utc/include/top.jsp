<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
			$(function() {
				//获得菜单
				$.post("<%=request.getContextPath()%>/webdo/menu/menulist.do", 
						{rootcid:"door"}, 
						function(json){
							var str = "";
							var num = json.length;
							if(num>0){
								for(var i=0;i<num;i++) {
									
									var id = json[i].id;
									var url = json[i].path;
									var title = json[i].name;
									if(url!=null&&url.Trim()!="default"&&url.Trim()!=""){
										if(url.Trim().indexOf("http://")<0){
											if(url.Trim().indexOf("?")<0){
												url="<%=request.getContextPath()%>/door/"+url.Trim()+"?cid="+id;
											}else{
												if(url.Trim().indexOf("cid")<0){
													url="<%=request.getContextPath()%>/door/"+url.Trim()+"&cid="+id;
												}else{
													url="<%=request.getContextPath()%>/door/"+url.Trim();
												}
											}
										}else{
											url=url.Trim();
										}
									}else{
										url="javascript:void(0);";
									}
									var __id = "<%= request.getParameter("cid")%>";
									if (__id == null) {
										__id = id;
									}
									if (__id==id) {
										str=$("#menulist").html()+"<li><a href=\""+url+"\" style=\"color:#f0d065\">"+title+"</a></li>";
									}else{
										str=$("#menulist").html()+"<li><a href=\""+url+"\">"+title+"</a></li>";
									}
									
									$("#menulist").html(str);
								}
							}
						}, 
						"json");
			});
</script>
<script type="text/javascript">
function getArticleList(divid,size,opt){
	$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/list.jsp?cid="+opt.aid);
	//获得文章列表
	$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
			opt, 
			function(json){
				var str = "";
				$("#"+divid).html(str);
				var num = json.rows.length;
				var aid = "";
				if(num>0){
					for(var i=0;i<num;i++) {
						var id = json.rows[i].id;
						var image = json.rows[i].image;
						var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
						var datetime = json.rows[i].createTime.substr(0,10);
						var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
						str=$("#"+divid).html()+"<li><a href=\""+url+"\">·"+title+"</a></li>";
						$("#"+divid).html(str);
					}
				}
			}, 
			"json");
}
</script>
<div id="top">
    	<div class="logo"><img src="images/dbmmwlogo.jpg" width="204" height="82" /></div>
        <div class="search">
          <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/door/search.jsp">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="searcha">
              <tr>
                <td width="26%" align="center"><select name="type" id="type" class="zpp">
                  <option value="1">找文章</option>
                </select></td>
                <td width="7%">&nbsp;</td>
                <td width="54%"><input name="textfield" type="text" class="gjz" id="textfield" size="45" style="border:none;height:30px;line-height: 30px" value="请输入关键字查找" onclick="this.value=''" onblur="this.value='请输入关键字查找'"/></td>
                <td width="13%" align="center" class="sou"><a href="javascript:$('#form1').submit();"><img src="<%=request.getContextPath()%>/door/images/sous.jpg" style="margin-top:2px"></img></a></td>
              </tr>
            </table>
          </form>
        </div>
        <div class="clear"></div>
    </div><!--头部-->
    <div id="menu">
    	<ul id="menulist">
		</ul>
</div><!--导航-->
    

