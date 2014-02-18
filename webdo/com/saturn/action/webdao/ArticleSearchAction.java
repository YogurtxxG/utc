package com.saturn.action.webdao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.website.Article;

public class ArticleSearchAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-------
		String type = request.getParameter("type");
		String text = request.getParameter("text");
		String start = request.getParameter("start");
		String offset = request.getParameter("offset");
		if("1".equals(type)){
			ListData<Article> data = Article.getSearchList(text,start,offset);
			return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
					data.getList()));
		}else{
			return null;
		}
		
	}

	public String requestMapping() {
		return "/webdo/article/searchlist.do";
	}

}
