<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script type="text/javascript">
			$(function() {
				getArticleList("notice",14,{aid:"door.notice",start:'0',offset:'7'});
				getArticleList("zthd",14,{aid:"door.zthd",start:'0',offset:'9'});
				getArticleList("mmzs",14,{aid:"door.mmzs",start:'0',offset:'5'});
				getArticleList("zhxx",14,{aid:"door.zhxx",start:'0',offset:'6'});
				});
</script>
<div class="left">
        	<div class="dt">
            <div class="xhgg">
        <div class="ggt">
        <h1>协会公告</h1>
        <span><a id="noticeMore" href="#">更多</a></span>
        </div>
        <div class="ggz">
        	<ul id="notice" class="gonggao">
            </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
      </div><!--企业动态-->
      <div class="clear"></div>
            </div>
            
         <div class="dtt">
            <div class="xhgg">
        <div class="ggt">
        <h1>专题活动</h1>
        <span><a id="zthdMore" href="#">更多</a></span>
        </div>
        <div class="ggz g">
       	  <a href="#"><img src="images/zthd_tu.jpg" width="212" height="89" /></a>
          <p style="text-align:center; color:#a06e0b; line-height:24px;">中国最具投资价值的浙江门业十大品牌</p>
          <ul id="zthd" class="gonggao">
          </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
      		</div><!--专题活动-->
			<div class="clear"></div>
        </div>
        
        <div class="dttt">
        	<div class="mmzhishi">
                	<div class="mmzstt">
                    <h3>木门知识</h3>
                    <div class="zs"><a id="mmzsMore" href="#">更多</a></div>
                    </div>
                    <div class="mmzsz">
                    	<div class="bzm"><img src="images/bzm.jpg" width="200" height="80" /></div>
                        <ul id="mmzs" class="gonggao">
          				</ul>
                    	
                    </div>
                    <div class="mmzsx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
              </div>
        
        </div>
        
		<div class="dtttt">
        
        <div class="xhgg">
        <div class="ggt">
        <h1>展会信息</h1>
        <span><a id="zhxxMore" href="#">更多</a></span>
        </div>
        <div class="ggz z">
        	<ul id="zhxx" class="gonggao">
            </ul>
        </div>
        <div class="ggx"><img src="images/xhgg_x.jpg" width="230" height="3" /></div>
      </div>
        </div>
             
        </div><!--左侧-->
