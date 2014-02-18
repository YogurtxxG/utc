package com.saturn.action.webdao;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.website.Article;

public class ArticleAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-------
		String aid = request.getParameter("aid");
		String id = request.getParameter("id");
		Article article = null;
		if(id!=null&&!"".equals(id.trim())&&!"null".equals(id.trim())){
			article = Article.get(id);
		}else{
			article = Article.getOneByCid(aid);
		}
		JSONObject jobj = new JSONObject();
		if (article != null) {
			jobj = new JSONObject(article);
		}
		return new JsonView(jobj.toString());
	}

	public String requestMapping() {
		return "/webdo/article/onearticle.do";
	}

}
