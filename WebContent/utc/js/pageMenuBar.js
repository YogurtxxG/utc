/**
 * @author Administrator
 */

	function PageMenuBar() {
		this.url="";			// 链接
		this.rowPerPage = 0;		// 每页显示行数
		this.sumRow = 0;			// 总行数
		this.pageNo = 1;			// 当前页号
		this.pagePerScreen = 3;	// 每屏页数
		this.sumPage = 0;		// 总页数
		this.screenNo = 1;		// 当前屏号码
		this.sumScreen = 0;		// 总屏数
		this.pageName = "pageNo";		// 当前分页条当前页参数名
		this.clazz = "";		// css
		this.type = 1;		// 类型
		this.state = 3;		// 状态
		this.func="";	//jquery函数名
		this.args="";	//参数
		//this.strargs="";
	}
	$.extend(PageMenuBar.prototype, {
		printCode: function(j){
			var menubar = "";
			if (this.sumRow <= 0) {
				j.html(menubar);
			}
			if(this.type==1){
				menubar += "&nbsp;[<A href='javascript:" + this.func + "("+ this.args+",1," + this.shouPageFirst() + "," + this.shouPageLast() + ");' title='首页'>首页</A>]&nbsp;";
				menubar += "&nbsp;[<A href='javascript:" + this.func + "("+ this.args+","+ this.getPriviorPage() + "," + this.priviorPageFirst() + "," + this.priviorPageLast() + ");' title='上一页'>上一页</A>]&nbsp;";
				if (this.state > 2) {
					menubar += "<A href='javascript:" + this.func + "("+ this.args+"," + this.getPriviorScreen() + "," + this.priviorScreenFirst() + "," + this.priviorScreenLast() + ");' title='上" + this.pagePerScreen + "页'>&lt;&lt;</A>";
					for (var i = this.getStart(); i < this.getEnd() + 1; i++) {
						if (i == this.pageNo) {
							menubar += "<A href='javascript:" + this.func + "("+ this.args+","+ i + "," + this.pageFirst(i) + "," + this.pageLast(i) + ");'>" + i + "</A>";
						}
						else {
							menubar += "[<A href='javascript:" + this.func + "("+ this.args+"," + i + "," + this.pageFirst(i) + "," + this.pageLast(i) + ");'>" + i + "</A>]";
						}
					}
					menubar += "<A href='javascript:" + this.func + "("+ this.args+","+ this.getNextScreen() + "," + this.nextScreenFirst() + "," + this.nextScreenLast() + ");' title='下" + this.pagePerScreen + "页'>&gt;&gt;</A>";
				}
				menubar += "&nbsp;[<A href='javascript:" + this.func + "("+ this.args+","+ this.getNextPage() + "," + this.nextPageFirst() + "," + this.nextPageLast() + ");' title='下一页'>下一页</A>]&nbsp;";
				menubar += "&nbsp;[<A href='javascript:" + this.func + "("+ this.args+","+ this.sumPage + "," + this.moPageFirst() + "," + this.moPageLast() + ");' title='尾页'>尾页</A>]&nbsp;";
				menubar += " 第<span style=\"color:#ff0000;\">" + this.pageNo + "</span>/" + this.sumPage + "页";
				if (this.state > 1) {
					menubar += " 每页" + this.rowPerPage + "条记录 " + "共" + this.sumRow + "条记录 ";
				}
			}else if(this.type==2){
				menubar += "&nbsp;[<A href='" + this.url + "1&startIndex=" + this.shouPageFirst() + "&endIndex=" + this.shouPageLast() + "' title='首页'>首页</A>]&nbsp;";
				menubar += "&nbsp;[<A href='" + this.url + this.getPriviorPage() + "&startIndex=" + this.priviorPageFirst() + "&endIndex=" + this.priviorPageLast() + "' title='上一页'>上一页</A>]&nbsp;";
				if (this.state > 2) {
					menubar += "<A href='" + this.url + this.getPriviorScreen() + "&startIndex=" + this.priviorScreenFirst() + "&endIndex=" + this.priviorScreenLast() + "' title='上" + this.pagePerScreen + "页'>&lt;&lt;</A>";
					for (var i = this.getStart(); i < this.getEnd() + 1; i++) {
						if (i == this.pageNo) {
							menubar += "<A href='" + this.url + i + "&startIndex=" + this.pageFirst(i) + "&endIndex=" + this.pageLast(i) + "'>" + i + "</A>";
						}
						else {
							menubar += "[<A href='" + this.url + i + "&startIndex=" + this.pageFirst(i) + "&endIndex=" + this.pageLast(i) + "'>" + i + "</A>]";
						}
					}
					menubar += "<A href='" + this.url + this.getNextScreen() + "&startIndex=" + this.nextScreenFirst() + "&endIndex=" + this.nextScreenLast() + "' title='下" + this.pagePerScreen + "页'>&gt;&gt;</A>";
				}
				menubar += "&nbsp;[<A href='" + this.url + this.getNextPage() + "&startIndex=" + this.nextPageFirst() + "&endIndex=" + this.nextPageLast() + "' title='下一页'>下一页</A>]&nbsp;";
				menubar += "&nbsp;[<A href='" + this.url + this.sumPage + "&startIndex=" + this.moPageFirst() + "&endIndex=" + this.moPageLast() + "' title='尾页'>尾页</A>]&nbsp;";
				menubar += " 第<span style=\"color:#ff0000;\">" + this.pageNo + "</span>/" + this.sumPage + "页";
				if (this.state > 1) {
					menubar += " 每页" + this.rowPerPage + "条记录 " + "共" + this.sumRow + "条记录 ";
				}
			}
			if (this.sumRow > 0) {
				j.html(menubar);
			}
		}
	});

	$.fn.pageMenuBar = function(options){
		 var ttp = new PageMenuBar();
		 for( e in options){
			ttp[e] = options[e];
		 }
		 ttp.init();
		 ttp.printCode(this);
	}

	/**
	 * 构造方法
	 * @param url url 链接 如：manageStudentAction.do?xxxx
	 * @param rowPrePage 每页显示行数
	 * @param pageNo 当前页号
	 * @param pagePreScreen 每屏显示页数
	 * @return 总页数
	 */
	PageMenuBar.prototype.init=function() {
		this.pageName=this.pageName!=null?this.pageName:"pageNo";
		this.url=this.url.indexOf("?")>-1?this.url+"&"+this.pageName+"=":this.url+"?"+this.pageName+"=";
		this.rowPerPage=parseInt(this.rowPerPage);
		this.sumRow=parseInt(this.sumRow);
		this.sumPage=this.sumPage_();
		this.pageNo=parseInt(this.pageNo<1?1:this.pageNo>this.sumPage?this.sumPage:this.pageNo);
		this.pagePerScreen = parseInt(this.pagePerScreen);
		this.screenNo=this.screenNo_();
		this.sumScreen=this.sumScreen_();
	}
	/**
	 * 获得首页第一条记录
	 * @return 
	 */
	PageMenuBar.prototype.shouPageFirst=function(){
		return 0;
	}
	/**
	 * 获得首页最后一条记录
	 * @return 
	 */
	PageMenuBar.prototype.shouPageLast=function(){
		var rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (1==this.sumPage)
			rowcount=(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (1 !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return ((1 - 1) * this.rowPerPage + rowcount);
	}
	/**
	 * 获得上一页第一条记录
	 * @return 
	 */
	PageMenuBar.prototype.priviorPageFirst=function(){
		return ((this.getPriviorPage() - 1) * this.rowPerPage+1-1);
	}
	/**
	 * 获得上一页最后一条记录
	 * @return 
	 */
	PageMenuBar.prototype.priviorPageLast=function(){
		var rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getPriviorPage() ==this.sumPage)
			rowcount=(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getPriviorPage() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return ((this.getPriviorPage() - 1) * this.rowPerPage + rowcount);
	}
	/**
	 * 获得上一屏第一条记录
	 * @return 
	 */
	PageMenuBar.prototype.priviorScreenFirst=function(){
		return ((this.getPriviorScreen() - 1) * this.rowPerPage+1-1);
	}
	/**
	 * 获得上一屏最后一条记录
	 * @return 
	 */
	PageMenuBar.prototype.priviorScreenLast=function(){
		var rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getPriviorScreen() ==this.sumPage)
			rowcount=(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getPriviorScreen() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return ((this.getPriviorScreen() - 1) * this.rowPerPage + rowcount);
	}
	/**
	 * 获得当前页第一条记录
	 * @return 
	 */
	PageMenuBar.prototype.pageFirst=function(pNo){
		return ((pNo - 1) * this.rowPerPage + 1-1);
	}
	/**
	 * 获得当前页最后一条记录
	 * @return 
	 */
	PageMenuBar.prototype.pageLast=function(pNo){
		var rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (pNo ==this.sumPage)
			rowcount=(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (pNo !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return ((pNo - 1) * this.rowPerPage + rowcount);
	}
	/**
	 * 获得下一屏第一条记录
	 * @return 
	 */
	PageMenuBar.prototype.nextScreenFirst=function(){
		return ((this.getNextScreen() - 1) * this.rowPerPage+1-1);
	}
	/**
	 * 获得下一屏最后一条记录
	 * @return 
	 */
	PageMenuBar.prototype.nextScreenLast=function(){
		var rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getNextScreen() ==this.sumPage)
			rowcount=(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getNextScreen() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return ((this.getNextScreen() - 1) * this.rowPerPage + rowcount);
	}
	/**
	 * 获得下一页第一条记录
	 * @return 
	 */
	PageMenuBar.prototype.nextPageFirst=function(){
		return ((this.getNextPage() - 1) * this.rowPerPage+1-1);
	}
	/**
	 * 获得下一页最后一条记录
	 * @return 
	 */
	PageMenuBar.prototype.nextPageLast=function(){
		var rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getNextPage() ==this.sumPage)
			rowcount=(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getNextPage() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return ((this.getNextPage() - 1) * this.rowPerPage + rowcount);
	}
	/**
	 * 获得末页第一条记录
	 * @return 
	 */
	PageMenuBar.prototype.moPageFirst=function(){
		if (1==this.sumPage)
			return 0;
		return ((this.sumPage - 1) * this.rowPerPage+1-1);
	}
	/**
	 * 获得末页最后一条记录
	 * @return 
	 */
	PageMenuBar.prototype.moPageLast=function(){
		var rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (0<this.sumRow)
			rowcount=(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		rowcount=rowcount>0?rowcount-1:0;
		return ((this.sumPage - 1) * this.rowPerPage + rowcount);
	}
	/**
	 * 获得总页数
	 * @return 总页数
	 */
	PageMenuBar.prototype.sumPage_=function() {
		return parseInt(this.sumRow%this.rowPerPage==0 ? this.sumRow/this.rowPerPage : this.sumRow/this.rowPerPage+1);
	}
	/**
	 * 获得当前屏号码
	 * @return 当前屏号码
	 */
	PageMenuBar.prototype.screenNo_=function(){
		return parseInt(this.pageNo%this.pagePerScreen==0 ? this.pageNo/this.pagePerScreen : this.pageNo/this.pagePerScreen+1);
	}
	/**
	 * 获得总屏数
	 * @return 总屏数
	 */
	PageMenuBar.prototype.sumScreen_=function(){
		return parseInt(this.sumPage%this.pagePerScreen==0 ? this.sumPage/this.pagePerScreen : this.sumPage/this.pagePerScreen+1);
	}
	/**
	 * 本屏开始页
	 * @return 数字
	 */
	PageMenuBar.prototype.getStart=function() {
		return ((this.screenNo-1)*this.pagePerScreen+1);
	}
	
	/**
	 * 本屏结束页
	 * @return 数字
	 */
	PageMenuBar.prototype.getEnd=function() {
		return (this.screenNo*this.pagePerScreen<this.sumPage?this.screenNo*this.pagePerScreen:this.sumPage);
	}
	/**
	 * 上一页
	 * @return 上一页页码
	 */
	PageMenuBar.prototype.getPriviorPage=function() {
		return (this.pageNo>1?this.pageNo-1:this.pageNo);
	}
	/**
	 * 下一页
	 * @return 下一页页码
	 */
	PageMenuBar.prototype.getNextPage=function() {
		return (this.pageNo<this.sumPage?this.pageNo+1:this.pageNo);
	}
	/**
	 * 上一屏
	 * @return 上一屏页码
	 */
	PageMenuBar.prototype.getPriviorScreen=function() {
		return (this.screenNo>1?(this.screenNo-2)*this.pagePerScreen+1:this.pageNo);
	}
	/**
	 * 下一屏
	 * @return 下一屏页码
	 */
	PageMenuBar.prototype.getNextScreen=function() {
		return (this.screenNo<this.sumScreen?this.screenNo*this.pagePerScreen+1:this.pageNo);
	}
	/**
	 * form表单href
	 * @return href
	 */
	PageMenuBar.prototype.getHref=function(formname,action) {
		return "javascript:document.getElementById('"+formname+"').action='"+action+"';document.getElementById('"+formname+"').submit();";
	}

