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

public class ArticleListByPageAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-------
		String aid = request.getParameter("aid");
		String start = request.getParameter("start");
		String offset = request.getParameter("offset");
		ListData<Article> data = Article.getByCidByShow(aid,start,offset);
		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	public String requestMapping() {
		return "/webdo/article/articleListByPage.do";
	}

}
