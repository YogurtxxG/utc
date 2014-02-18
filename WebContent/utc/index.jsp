
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/top.css" rel="stylesheet" type="text/css" />
<link href="css/global.css" rel="stylesheet" type="text/css" />
<LINK href="<%=request.getContextPath()%>/door/css/qq.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="<%=request.getContextPath()%>/door/js/slides.min.jquery.js"></script>
<title>东北木门网</title>
<style type="text/css">
	a,img{border:0;}
	#clsrw img{width:122px;height:163px;}
	#tjmmtp img{width:100px;height:133px;}
	.scrollleft{width:900px;padding:2px 20px 0px 20px;margin:-8px auto;}
	.scrollleft li{float:left;margin-right:7px;display:inline;width:158px;text-align:center;line-height:19px}
	.scrollleft img{width:136px;height:100px;padding:10px;border:solid 1px #ddd;}
	
	.rw_scrollleft{width:900px;padding:2px 20px 0px 20px;margin:-8px auto;}
	.rw_scrollleft li{float:left;margin-right:7px;display:inline;text-align:center;line-height:19px}
	.rw_scrollleft img{width:136px;height:100px;padding:10px;border:solid 1px #ddd;}
	
	.zz_scrollleft{width:900px;padding:2px 20px 0px 20px;margin:-8px auto;}
	.zz_scrollleft li{float:left;margin-right:7px;display:inline;width:158px;text-align:center;line-height:19px}
	.zz_scrollleft img{width:136px;height:100px;padding:10px;border:solid 1px #ddd;}
	
</style>
<script type="text/javascript">

		//Marquee
		$('#marquee6').kxbdSuperMarquee({
			isMarquee:true,
			isEqual:false,
			scrollDelay:7,
			direction:'up'
		});

		$(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				play: 5000,
				pause: 2500,
				hoverPause: true,
				animationStart: function(current){
					$('.caption').animate({
						bottom:-35
					},100);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationStart on slide: ', current);
					};
				},
				animationComplete: function(current){
					$('.caption').animate({
						bottom:0
					},200);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationComplete on slide: ', current);
					};
				},
				slidesLoaded: function() {
					$('.caption').animate({
						bottom:0
					},200);
				}
			});
		});
		
	$(function() {
		//获得文章列表
		getArticleList("s_notice",14,{aid:"door.notice",start:'0',offset:'7'});
		
		getArticleList_rdhy("s_hot",20,{aid:"door.hot",start:'0',offset:'5'});
		
		getArticleList("s_qydt",14,{aid:"door.qydt",start:'0',offset:'7'});
		
		getNewDoorList("s_newdoor",{start:'0',offset:'6'});
		
		getArticleList("s_zthd",14,{aid:"door.zthd",start:'0',offset:'9'});
		
		getRecommendList("s_tjmm",{start:'0',offset:'10'});
		
		getArticlePicList_tjmm("s_tjmmPic",6,{aid:"doorimage.tjmm",start:'0',offset:'10'});
		
		getArticlePicList_sdpp("s_sdppPic",6,{aid:"doorimage.brand",start:'0',offset:'10'});
		
		getArticleList("s_mmzs",14,{aid:"door.mmzs",start:'0',offset:'5'});
		getArticleList("s_zjk1",14,{aid:"door.zjk",start:'0',offset:'6'});
		getArticleList("s_zjk2",14,{aid:"door.zjk",start:'6',offset:'4'});
		getArticleList("s_gyjs",21,{aid:"door.gyjs",start:'0',offset:'10'});
		getArticleList("s_people",20,{aid:"door.people",start:'0',offset:'6'});
		
		getArticlePicList_people("s_peoplePic",4,{aid:"doorimage.rw",start:'0',offset:'6'});
		getArticlePicList_jctp("s_jctpPic",6,{aid:"doorimage.jctp",start:'0',offset:'10'});
		getArticlePicList_dzzz("s_dzzzPic",6,{aid:"doorimage.dzzz",start:'0',offset:'10'});
		
		getArticleList("s_qygq",18,{aid:"door.qygq",start:'0',offset:'7'});
		getArticleList("s_xgqy",20,{aid:"door.xgqy",start:'0',offset:'7'});
		getArticleList("s_zsjm",15,{aid:"door.zsjm",start:'0',offset:'6'});
		getArticleList("s_zhxx",15,{aid:"door.zhxx",start:'0',offset:'6'});
		
		getArticleList_vip("s_vip",20,{aid:"door.vip",start:'0',offset:'6'});
		
		getArticlePicList_xhzl("s_xhzlPic",6,{aid:"doorimage.xhzl",start:'0',offset:'10'});
		
		getArticleList("s_download",15,{aid:"door.download",start:'0',offset:'6'});
		
		//获得广告列表
		getGuangGao("gga",{aid:null,id:'555'});
		getGuangGao("pica",{aid:null,id:'557'});
		getGuangGao("picb",{aid:null,id:'558'});
		getGuangGao("guangg",{aid:null,id:'559'});
		getGuangGao("guangg1",{aid:null,id:'560'});
		getGuangGao("ggc",{aid:null,id:'561'});
		getGuangGao("gg7",{aid:null,id:'562'});
		getGuangGao("gg8",{aid:null,id:'563'});
		getGuangGao("gg9",{aid:null,id:'564'});
		getGuangGao("gg10",{aid:null,id:'565'});
		});
	function getArticlePicList_sdpp(divid,size,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/list.jsp?cid="+opt.aid);
		//获得文章列表
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/pp01.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<a href=\""+url+"\"><img width=\"130\" height=\"70\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a>";
							$("#"+divid).html(str);
						}
					}
					
				}, 
				"json");
	}
	function getArticlePicList_tjmm(divid,size,opt){
		//获得文章列表
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/oushi.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<li><a href=\""+url+"\"><img width=\"100\" height=\"153\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a><br/><font>"+title+"</font></li>";
							$("#"+divid).html(str);
						}
					}
					
					$(".scrollleft").imgscroll({
						speed: 40,    //图片滚动速度
						amount: 0,    //图片滚动过渡时间
						width: 1,     //图片滚动步数
						dir: "left"   // "left" 或 "up" 向左或向上滚动
					});
				}, 
				"json");
	}
	function getArticlePicList_people(divid,size,opt){
		//获得文章列表
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/grk.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<li><a href=\""+url+"\"><img style=\"width: 55px;height: 55px;\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a><br><font>"+title+"</font></li>";
							$("#"+divid).html(str);
						}
					}
					
					$(".rw_scrollleft").imgscroll({
						speed: 40,    //图片滚动速度
						amount: 0,    //图片滚动过渡时间
						width: 1,     //图片滚动步数
						dir: "left"   // "left" 或 "up" 向左或向上滚动
					});
				}, 
				"json");
	}
	
	function getArticlePicList_jctp(divid,size,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/list.jsp?cid="+opt.aid);
		//获得文章列表
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/jctp_01.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<li><a href=\""+url+"\"><img width=\"160\" height=\"118\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a><span>"+title+"</span></li>";
							$("#"+divid).html(str);
						}
					}
					
					$(".scrollleft").imgscroll({
						speed: 40,    //图片滚动速度
						amount: 0,    //图片滚动过渡时间
						width: 1,     //图片滚动步数
						dir: "left"   // "left" 或 "up" 向左或向上滚动
					});
				}, 
				"json");
	}
	function getArticlePicList_xhzl(divid,size,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/list.jsp?cid="+opt.aid);
		//获得文章列表
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/xhzl_01.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<li><a href=\""+url+"\"><img width=\"140\" height=\"100\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a><font>"+title+"</font></li>";
							$("#"+divid).html(str);
						}
					}
					
					$(".scrollleft").imgscroll({
						speed: 40,    //图片滚动速度
						amount: 0,    //图片滚动过渡时间
						width: 1,     //图片滚动步数
						dir: "left"   // "left" 或 "up" 向左或向上滚动
					});
				}, 
				"json");
	}
	
	function getArticlePicList_dzzz(divid,size,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/list.jsp?cid="+opt.aid);
		//获得文章列表
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/zazhia.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<li><a href=\""+url+"\"><img width=\"122\" height=\"163\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a><br/><font>"+title+"</font></li>";
							$("#"+divid).html(str);
						}
					}
				}, 
				"json");
	}
	
	function getArticleList_rdhy(divid,size,opt){
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
							var text = json.rows[i].text.replace(/<.+?>/g,"").replace("&nbsp;","").substr(0,30)+"...";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							if(i==0){
								$("#s_hot1Title").html(title);
								$("#s_hot1Href").attr("href",url);
								$("#s_hot1Content").html(text);
							}else{
								str=$("#"+divid).html()+"<div class=\"liebiao\">";
								str+="<li  class=\"lb\"><a href=\""+url+"\">·"+title+"</a></li>";
								str+="<div class=\"sj\">["+datetime+"]</div>";
								str+="</div>";
								$("#"+divid).html(str);
							}
						}
					}
				}, 
				"json");
	}
	function getArticleList_vip(divid,size,opt){
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
							var text = json.rows[i].text;
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
							str="<li  class=\"lb\"><a href=\""+url+"\">·"+title+"</a></li>";
							str+="<div class=\"sj\">["+datetime+"]</div>";
							$("#s_vip"+(i+1)).html(str);
						}
					}
				}, 
				"json");
	}
	
	function getNewDoorList(divid,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/newdoorlist.jsp");
		//获得新品木门列表
		$.post("<%=request.getContextPath()%>/webdo/newdoor/newdoorListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var brand = json.rows[i].brand;
							var model = json.rows[i].model;
							var price = json.rows[i].price;
							var mole = json.rows[i].mole;
							var typeName = json.rows[i].typeName;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/men.jpg";
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/newdoordetail.jsp?did="+id;
							$("#"+divid+(i+1)+"_1").html("<a href=\""+url+"\"><img src=\""+image+"\" width=\"62\" height=\"132\" /></a>");
							//$("#"+divid+(i+1)+"_2").attr("src",image);
							$("#"+divid+(i+1)+"_3").html("品牌："+brand);
							$("#"+divid+(i+1)+"_4").html("型号："+model);
							$("#"+divid+(i+1)+"_5").html("价格："+price);
							$("#"+divid+(i+1)+"_6").html("风格："+mole);
							$("#"+divid+(i+1)+"_7").html("类型："+typeName);
							$("#"+divid+(i+1)+"_8").html("<a href=\""+url+"\"><详细介绍></a>");
						}
					}
				}, 
				"json");
	}
	
	function getRecommendList(divid,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/recommendlist.jsp");
		//获得推荐木门列表
		$.post("<%=request.getContextPath()%>/webdo/recommend/recommendListByPage.do", 
				opt, 
				function(json){
					var str = "<tr>";
					str+= "<th align=\"center\">品牌</th>";
					str+= "<th align=\"center\">型号</th>";
					str+= "<th align=\"center\">原价</th>";
					str+= "<th align=\"center\">现价</th>";
					str+= "<th align=\"center\">厂家</th>";
					str+= "</tr>";
			      
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var brand = json.rows[i].brand;
							var model = json.rows[i].model;
							var oldCost = json.rows[i].oldCost;
							var nowCost = json.rows[i].nowCost;
							var factory = json.rows[i].factory;
							var datetime = json.rows[i].createtime.substr(0,10);
							var url="<%=request.getContextPath()%>/door/recommenddetail.jsp?did="+id;
							str+= "<tr onclick=\"javascript:location='"+url+"';\" style=\"cursor: pointer;\">";
							str+= "<td>"+brand+"</td>";
							str+= "<td>"+model+"</td>";
							str+= "<td>"+oldCost+"</td>";
							str+= "<td>"+nowCost+"</td>";
							str+= "<td>"+factory+"</td>";
							str+= "</tr>";
						}
					}
					$("#"+divid).html(str);
				}, 
				"json");
	}
	
	function getGuangGao(divid,opt){
		//按获广告得文章
		$.post("<%=request.getContextPath()%>/webdo/article/onearticle.do", 
				opt, 
				function(json){
					var id = json.id;
					var titlez = json.title;
					var text = json.text;
					$("#"+divid).html(text);

				}, 
				"json");
	}
</script>
</head>

<body>
<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/door/js/qq.js"></script>
<p id="back-to-top"><a href="#top"><span style="background: url('images/top.png');"></span></a></p>
<a name="top"></a>
<div id="container">
	<%@ include file="include/top.jsp" %>
  	<div id="gg">
    	<div class="xhgg">
        <div class="ggt">
        <h1>协会公告</h1>
        <span><a id="s_noticeMore" href="#">更多</a></span>
        </div>
        <div class="ggz">
       	  <ul id="s_notice" class="gonggao">
            </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
        </div><!--协会公告-->
        <div class="hyrd">
        	<div class="rd">
           		<div class="rdt">
       				<div class="rdtt">
        				<h1>行业热点</h1>
       				 	<span><a id="s_hotMore" href="#">更多</a></span>
        			</div>
               </div>
               <div class="rdz">
               		<div class="piche">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="35%"><a href="#"><img src="images/hyrd_tu.jpg" width="136" height="75" /></a></td>
    <td width="65%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" style="color:#F00; font-size:16px; text-align:center;" id="s_hot1Title"></td>
      </tr>
      <tr>
        <td><a id="s_hot1Href" href="#"><div id="s_hot1Content"></div></a></td>
      </tr>
    </table></td>
  </tr>
</table>
                 </div>
                 <div class="piche">
                   <ul id="s_hot" class="lib">
                        
		           </ul>
                 </div>
                 <div class="clear"></div>
               </div>
               <div class="rdx"><img src="images/xhrd_x.jpg" width="477" height="4" /></div>
            </div><!--热点-->   
        </div><!--行业热点-->
      <div class="xhgg">
        <div class="ggt">
        <h1>企业动态</h1>
        <span><a id="s_qydtMore" href="#">更多</a></span>
        </div>
        <div id="marquee6">
        	<div class="ggz">
	        	<ul id="s_qydt" class="gonggao">
	            </ul>
            </div>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
      </div><!--企业动态-->
        <div class="clear"></div>
</div><!--公告一-->
    <div id="gga"><!-- <img src="images/gga.jpg" width="960" height="76" /> --></div><!--广告一-->
    <div id="mmpp">
    	<div class="xmm">
			<div class="xpmm">
        	<div class="xpmmt">
            	<h1>新品木门</h1>
                <span><a id="s_newdoorMore" href="#">更多</a></span>
            </div>
            <div class="xpmmz">
            	<table width="94%" border="0" cellspacing="0" cellpadding="0" class="xinpin">
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xiaoshou">
      <tr>
        <td width="35%" id="s_newdoor1_1"></td>
        <td width="65%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xswd">
          <tr>
            <td id="s_newdoor1_3"></td>
          </tr>
          <tr>
            <td id="s_newdoor1_4"></td>
          </tr>
          <tr>
            <td id="s_newdoor1_5"></td>
          </tr>
          <tr>
            <td id="s_newdoor1_6"></td>
          </tr>
          <tr>
            <td id="s_newdoor1_7"></td>
          </tr>
          <tr>
            <td id="s_newdoor1_8" valign="top" style="height:30px;"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xiaoshou">
      <tr>
        <td width="35%" id="s_newdoor2_1"></td>
        <td width="65%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xswd">
          <tr>
            <td id="s_newdoor2_3"></td>
          </tr>
          <tr>
            <td id="s_newdoor2_4"></td>
          </tr>
          <tr>
            <td id="s_newdoor2_5"></td>
          </tr>
          <tr>
            <td id="s_newdoor2_6"></td>
          </tr>
          <tr>
            <td id="s_newdoor2_7"></td>
          </tr>
          <tr>
            <td id="s_newdoor2_8" valign="top" style="height:30px;"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xiaoshou">
      <tr>
        <td width="35%" id="s_newdoor3_1"></td>
        <td width="65%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xswd">
          <tr>
            <td id="s_newdoor3_3"></td>
          </tr>
          <tr>
            <td id="s_newdoor3_4"></td>
          </tr>
          <tr>
            <td id="s_newdoor3_5"></td>
          </tr>
          <tr>
            <td id="s_newdoor3_6"></td>
          </tr>
          <tr>
            <td id="s_newdoor3_7"></td>
          </tr>
          <tr>
            <td id="s_newdoor3_8" valign="top" style="height:30px;"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xiaoshou">
      <tr>
        <td width="35%" id="s_newdoor4_1"></td>
        <td width="65%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xswd">
          <tr>
            <td id="s_newdoor4_3"></td>
          </tr>
          <tr>
            <td id="s_newdoor4_4"></td>
          </tr>
          <tr>
            <td id="s_newdoor4_5"></td>
          </tr>
          <tr>
            <td id="s_newdoor4_6"></td>
          </tr>
          <tr>
            <td id="s_newdoor4_7"></td>
          </tr>
          <tr>
            <td id="s_newdoor4_8" valign="top" style="height:30px;"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xiaoshou">
      <tr>
        <td width="35%" id="s_newdoor5_1"></td>
        <td width="65%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xswd">
          <tr>
            <td id="s_newdoor5_3"></td>
          </tr>
          <tr>
            <td id="s_newdoor5_4"></td>
          </tr>
          <tr>
            <td id="s_newdoor5_5"></td>
          </tr>
          <tr>
            <td id="s_newdoor5_6"></td>
          </tr>
          <tr>
            <td id="s_newdoor5_7"></td>
          </tr>
          <tr>
            <td id="s_newdoor5_8" valign="top" style="height:30px;"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xiaoshou">
      <tr>
        <td width="35%" id="s_newdoor6_1"></td>
        <td width="65%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xswd">
          <tr>
            <td id="s_newdoor6_3"></td>
          </tr>
          <tr>
            <td id="s_newdoor6_4"></td>
          </tr>
          <tr>
            <td id="s_newdoor6_5"></td>
          </tr>
          <tr>
            <td id="s_newdoor6_6"></td>
          </tr>
          <tr>
            <td id="s_newdoor6_7"></td>
          </tr>
          <tr>
            <td id="s_newdoor6_8" valign="top" style="height:30px;"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

            </div>
            <div class="xpmmx"><img src="images/xpmm_x.jpg" width="719" height="4" /></div>
        </div>
        </div><!--木门-->
        <div class="xhgg">
        <div class="ggt">
        <h1>专题活动</h1>
        <span><a id="s_zthdMore" href="#">更多</a></span>
        </div>
        <div class="ggz g">
       	  <a href="#"><img src="images/zthd_tu.jpg" width="212" height="89" /></a>
          <p style="text-align:center; color:#a06e0b; line-height:24px;">中国最具投资价值的浙江门业十大品牌</p>
          <ul id="s_zthd" class="gonggao">
          </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
      </div><!--专题活动-->
		<div class="clear"></div>
    </div><!--新品木门-->
    <div id="ggb">
    	<div id="pica"></div>
        <div id="picb"></div>
  </div><!--广告二-->
    <div id="tjmm">
    <div id="mmpp">
    	<div class="xmm">
			<div class="xpmm">
        	<div class="xpmmt">
            	<h1>推荐木门</h1>
                <span><a id="s_tjmmMore" href="#">更多</a></span>
            </div>
            <div class="xpmmz m">
            	<div class="mumen">
                	<table width="92%" border="0" cellspacing="0" cellpadding="0" class="tjmumen">
  <tr>
    <td width="24%"><table width="77%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><a href="#"><img src="images/men_pic.jpg" width="152" height="237" /></a></td>
        </tr>
      <tr>
        <td style="text-align:center; line-height:24px;">将相豪</td>
        </tr>
      </table></td>
    <td width="76%" valign="top"><table id="s_tjmm" width="95%" border="0" cellspacing="0" cellpadding="0" class="tjmumenxq">
    </table></td>
  </tr>
</table>

              </div>
                <div class="fengge">
                <div class="fg">
           			<div class="scrollleft" style="width:630px;" id="tjmmtp">
						<ul id="s_tjmmPic">
						</ul>
					</div>
				</div>
                <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="xpmmx"><img src="images/xpmm_x.jpg" width="719" height="4" /></div>
            <div class="xmmm">
            	<div id="guangg"></div>
       	 	  	<div id="guangg1"><a href="#"><img src="images/S06_v2.gif" width="235" height="256" /></a></div>            
    		
    		<!-- 木门知识 -->
    		<div class="mmzhishi">
                	<div class="mmzstt">
                    <h3>木门知识</h3>
                    <div class="zs"><a id="s_mmzsMore" href="#">更多</a></div>
                    </div>
                    <div class="mmzsz">
                    	<div class="bzm"><img src="images/bzm.jpg" width="200" height="80" /></div>
                        <ul id="s_mmzs" class="gonggao">
          				</ul>
                    	
                    </div>
                    <div class="mmzsx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
              </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        
        </div><!--木门-->
        <div class="xhgg">
        <div class="ggt">
        <h1>木门十大品牌</h1>
        <span></span>
        </div>
        <div class="ggz i">
        	<div id="s_sdppPic" class="pp">
            </div>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
        <div class="clear"></div>
      </div><!--木门十大品牌-->
		<div class="clear"></div>
    </div>
    </div>
    <!--推荐木门-->
    
    <div id="ggc"></div><!--广告6-->
    <div id="zjk">
    	<div class="zj">
        	<div class="zjtt">
            	<h1>专家库</h1>
                <span><a id="s_zjk1More" href="#">更多</a></span>
            </div>
            <div class="zjz">
       	    <div class="zjka">
                	<div class="tt"><a href="#"><img src="images/ren.jpg" width="110" height="149" /></a></div>
                    <ul id="s_zjk1" class="gonggao">
            		<li><a href="#">·王光源：中国木门的艺术之美</a></li>
            		<li><a href="#">·石建鹏——网络营销实战专家</a></li>
            		<li><a href="#">张国林：中国木门行业双标</a></li>
					<li><a href="#">·任长青：努力推动门业与互动</a></li>
                    <li><a href="#">张国林：中国木门行业双标</a></li>
					<li><a href="#">·任长青：努力推动门业与互动</a></li>
            	</ul>
              </div>
                <ul id="s_zjk2" class="gonggao">
            		<li><a href="#">·任长青：努力推动门业与互联网深度跨越</a></li>
            		<li><a href="#">·高乐平：经销商盈利系统终端销售的维护</a></li>
            		<li><a href="#">·康有正：新媒体品牌传播与中国门业品牌新营销</a></li>
            		<li><a href="#">·田灵江：为您解读国家康居示</a></li>
            	</ul>
                <div class="clear"></div>
            </div>
            <div class="zjx"><img src="images/zjk_x.jpg" width="313" height="3" /></div>
        </div><!--专家库-->
    	<div class="gyjs">
        	<div class="jishu">
            	<div class="zj">
        	<div class="zjtt">
           	  <h1>工艺技术</h1>
                <span><a id="s_gyjsMor" href="#">更多</a></span>
            </div>
            <div class="zjz">
            	<ul id="s_gyjs" class="gonggao">
            	</ul>
            </div>
            <div class="zjx"><img src="images/zjk_x.jpg" width="313" height="3" /></div>
        </div><!--工艺-->
            </div>
        </div><!--工艺技术-->
    	<div class="zj">
        	<div class="zjtt">
            	<h1>人物</h1>
                <span><a id="s_peopleMore" href="#">更多</a></span>
            </div>
            <div class="zjz">
    	    <div class="gonggao" style="height:88px;">
                	<div class="grk">
	                    <div class="rw_scrollleft" style="width:235px;" id="clsrw1">
							<ul id="s_peoplePic">
							</ul>
						</div>
                    </div>
             	</div>
            	<ul id="s_people" class="gonggao">
            	</ul>
                <div class="clear"></div>
            </div>
            <div class="zjx"><img src="images/zjk_x.jpg" width="313" height="3" /></div>
        </div><!--人物-->
        <div class="clear"></div>
    </div><!--专家库工艺技术人物-->
    <div id="gdtp">
    	<div class="jctp">
        	<h1>精彩图片</h1>
        	<span><a id="s_jctpPicMore" href="#">更多</a></span>
        </div>
        <div class="jctpz">
        	<div class="jc">
			  <div class="scrollleft">
				<ul id="s_jctpPic">
				</ul>
			</div>
            </div>
   	  </div>
   	  <script type="text/javascript">

</script> 
    	<div class="jctpx"><img src="images/jctp_x.jpg" width="960" height="4" /></div>
  </div><!--滚动图片-->
    <div id="dzzz">
    	<div class="jctp">
        	<h1>电子杂志</h1>
        	<span><a id="s_dzzzPicMore" href="#">更多</a></span>
        </div>
        <div class="jctpz d">
        	<div class="zazhi">
            		<div class="zz_scrollleft" style="width:905px;" id="clsrw">
						<ul id="s_dzzzPic">
						</ul>
					</div>
				</div>
            <div class="clear"></div>
      </div>
    	<div class="jctpx"><img src="images/jctp_x.jpg" width="960" height="4" /></div>
    </div><!--电子杂志-->
    <div id="ggd">
    	<div id="gg7"></div>
        <div id="gg8"></div>
    </div><!--广告四-->
    <div id="qygq">
    <div id="zjk">
    	<div class="zj">
        	<div class="zjtt">
            	<h1>企业供求</h1>
                <span><a id="s_qygqMore" href="#">更多</a></span>
            </div>
            <div class="zjz q">
            	<ul id="s_qygq" class="gonggao">
            </ul>
            </div>
            <div class="zjx"><img src="images/zjk_x.jpg" width="313" height="3" /></div>
        </div><!--企业供求-->
    	<div class="gyjs">
        	<div class="jishu">
            	<div class="zj">
        	<div class="zjtt">
            	<h1>相关企业</h1>
                <span><a id="s_xgqyMore" href="#">更多</a></span>
            </div>
            <div class="zjz q">
            	<ul id="s_xgqy" class="gonggao">
            </ul>
            </div>
            <div class="zjx"><img src="images/zjk_x.jpg" width="313" height="3" /></div>
        </div><!--相关-->
            </div>
        </div><!--相关企业-->
    	<div class="zj">
        	<div class="zjtt">
            	<h1>焦点图</h1>
                <span><a href="#">更多</a></span>
            </div>
            <div class="zjz qq">
					<div id="slides">
						<div class="slides_container">
								<div class="slide">
						<a href="" title="纳米比亚总统府的选择"><img src="images/jd6.jpg" width="300" height="170" alt="Slide 1"></a>
						<div class="caption" style="bottom:0">
							<p>公主系列</p>
						</div>
					</div>
					<div class="slide">
						<a href="" title="大型豪华门" target="_blank"><img src="images/jd4.jpg" width="300" height="170" alt="Slide 2"></a>
						<div class="caption">
							<p>公主系列</p>
						</div>
					</div>
					<div class="slide">
						<a href="" title="简约风尚" target="_blank"><img src="images/jd1.jpg" width="300" height="170" alt="Slide 3"></a>
						<div class="caption">
							<p>全家福系列</p>
						</div>
					</div>
						</div>
						<a href="#" class="prev"><img src="images/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
						<a href="#" class="next"><img src="images/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
					</div>
            </div>
            <div class="zjx"><img src="images/zjk_x.jpg" width="313" height="3" /></div>
        </div><!--焦点图-->
        <div class="clear"></div>
    </div><!--图-->
    
    
    </div><!--企业供求相关企业焦点图-->
    <div id="zsjm">
    <div id="gg">
    	<div class="xhgg">
        <div class="ggt">
        <h1>招商加盟</h1>
        <span><a id="s_zsjmMore" href="#">更多</a></span>
        </div>
        <div class="ggz z">
        	<ul id="s_zsjm" class="gonggao">
            </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
        </div><!--招商加盟-->
        <div class="hyrd">
        	<div class="rd">
           		<div class="rdt">
       				<div class="rdtt">
        				<h1>会员展示</h1>
       				 	<span><a id="s_vipMore" href="#">更多</a></span>
        			</div>
               </div>
               <div class="rdz z">
               		<div class="kong"></div>
   		    		<div id="s_vip1" class="liebiao hy">
                    </div>
                    <div id="s_vip2" class="liebiao hy">
                    </div>
                    <div id="s_vip2" class="liebiao hy">
                    </div>
                    <div id="s_vip4" class="liebiao hy">
                    </div>
                    <div id="s_vip5" class="liebiao hy">
                    </div>
                    <div id="s_vip6" class="liebiao hy">
                    </div>
                    <div class="clear"></div>
              </div>
               <div class="rdx"><img src="images/xhrd_x.jpg" width="477" height="4" /></div>
            </div><!--会员-->   
        </div><!--会员展示-->
      <div class="xhgg">
        <div class="ggt">
        <h1>展会信息</h1>
        <span><a id="s_zhxxMore" href="#">更多</a></span>
        </div>
        <div class="ggz z">
        	<ul id="s_zhxx" class="gonggao">
            </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
      </div><!--展会信息-->
        <div class="clear"></div>
</div><!--招商会员展会-->
    </div><!--招商加盟会员展示展会信息-->
    <div id="gg10"></div><!--广告五-->
  <div id="xhzl">
  <div id="mmpp">
    	<div class="xmm">
			<div class="xpmm">
        	<div class="xpmmt">
            	<h1>协会专栏</h1>
                <span><a id="s_xhzlPicMore" href="#">更多</a></span>
            </div>
            <div class="xpmmz l">
            	
                <div class="zhuanlan">
           	  	<div class="scrollleft" style="width:635px">
					<ul id="s_xhzlPic">
					</ul>
					</div>
				</div>
                <div class="clear"></div>
            </div>
            <div class="xpmmx"><img src="images/xpmm_x.jpg" width="719" height="4" /></div>
        </div>
        </div><!--协会专栏-->
        <div class="xhgg">
        <div class="ggt">
        <h1>文件下载</h1>
        <span><a id="s_downloadMore" href="#">更多</a></span>
        </div>
        <div class="ggz l">
        	<ul id="s_download" class="gonggao">
            </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
      </div><!--文件下载-->
		<div class="clear"></div>
    </div><!--协会文件-->
  </div><!--协会专栏文件下载-->
  <div id="yqlj">
  	<div class="jctp">
        	<h1>友情链接</h1>
        	<span></span>
        </div>
        <div class="jctpz y">
        	<ul class="yqlianjie">
            <li><a href="http://www.mumen.com.cn">中国木门网</a></li>
            <li><a href="http://www/bmlink.com">中国建材网</a></li>
            <li><a href="http://www.jj999.com">辽宁省家具协会</a></li>
            <li><a href="http://www.dbtimber.cn">黑龙江木门协会</a></li>
            <li><a href="http://www.bmd09.cn">福建木门协会</a></li>
            <li><a href="http://www.cqsmmxh.cn">重庆木门协会</a></li>
            <li><a href="http://lyt.jl.gov.cn">吉林省林业厅</a></li>
            <li><a href="http://www.jllycy.com">省林业产业协会</a></li>
			<li><a href="http://www.cnwood.org">中国木材与木质</a></li>
            <li><a href="#">木门加盟网</a></li>
            <li><a href="#">中华名门网</a></li>
            <li><a href="#">建材网</a></li>
            <li><a href="#">中国门都网</a></li>
            <li><a href="#">木门网百科</a></li>
            <li><a href="#">城外诚家居</a></li>
            <li><a href="#">开心木门</a></li>
            <li><a href="#">门业杂志</a></li>
            </ul>
        </div>
    	<div class="jctpx"><img src="images/jctp_x.jpg" width="960" height="4" /></div>
  </div><!--友情链接-->
  <%@ include file="include/foot.jsp" %>
</div><!--容器-->

</body>
</html>