document.write("<div class='QQbox' id='divQQbox' >");

document.write("	<div class='Qlist' id='divOnline' onmouseout='hideMsgBox(event);' style='display : none;'>");

document.write("		<div class='t'></div>");

document.write("		<div class='con'>");

document.write("<h2>QQ在线咨询</h2>");

document.write("<ul>");

document.write("<li class=odd><a href='http://wpa.qq.com/msgrd?V=1&amp;Uin=1305457111&amp;Site=www.ahubbs.com&amp;Menu=yes' target='_blank' title='咨询1'><img border=0 src=http://wpa.qq.com/pa?p=1:1305457111:17> QQ在线</a></li>");
document.write("<li class=odd><a href='http://wpa.qq.com/msgrd?V=1&amp;Uin=1305457111&amp;Site=www.ahubbs.com&amp;Menu=yes' target='_blank' title='咨询2'><img border=0 src=http://wpa.qq.com/pa?p=1:1305457111:17> QQ在线</a></li>");

document.write("</ul>");
document.write("<p style=clear:both;height:8px;overflow:hidden;></p>");
document.write("<h2>电话咨询</h2>");

document.write("<ul>");

document.write("<li class=odd>0431-8888888</a></li>");


document.write("</ul>");
document.write("<p style=clear:both;height:8px;overflow:hidden;></p>");
document.write("</div>");

document.write("<div class='b'></div>");

document.write("</div>");

document.write("<div id='divMenu' onmouseover='OnlineOver();'><div class='press'></div></div>");

document.write("</div>");




var tips; var theTop = 50; var old = theTop;

function initFloatTips() {

  tips = document.getElementById('divQQbox');

  moveTips();

};

function moveTips() {

  var tt=50;

  if (window.innerHeight) {

    pos = window.pageYOffset

  }

  else if (document.documentElement && document.documentElement.scrollTop) {

    pos = document.documentElement.scrollTop

  }

  else if (document.body) {

    pos = document.body.scrollTop;

  }

  pos=pos-tips.offsetTop+theTop;

  pos=tips.offsetTop+pos/10;



  if (pos < theTop) pos = theTop;

  if (pos != old) {

    tips.style.top = pos+"px";

    tt=10;

  //alert(tips.style.top);

  }



  old = pos;

  setTimeout(moveTips,tt);

}

//!]]>

initFloatTips();



function OnlineOver(){

document.getElementById("divMenu").style.display = "none";

document.getElementById("divOnline").style.display = "block";

document.getElementById("divQQbox").style.width = "145px";

}



function OnlineOut(){

document.getElementById("divMenu").style.display = "block";

document.getElementById("divOnline").style.display = "none";



}



 function hideMsgBox(theEvent){  

      if (theEvent){

       var browser=navigator.userAgent;   

         if (browser.indexOf("Firefox")>0){  

        if (document.getElementById('divOnline').contains(theEvent.relatedTarget)) {  //�������Ԫ��

              return;   

                        } 

                  } 

                  if (browser.indexOf("MSIE")>0){  

                         if (document.getElementById('divOnline').contains(event.toElement)) { 

                                return;  

                          }

                   }

             }


document.getElementById("divMenu").style.display = "block";

document.getElementById("divOnline").style.display = "none";

 }