package com.saturn.action.webdao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.website.Content;

public class MenuByCidAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-------
		//String cid = request.getParameter("cid");
		String cid = request.getParameter("cid");
		Content content = Content.get(cid);
		JSONObject jobj = new JSONObject(content);
		return new JsonView(jobj.toString());
	}

	public String requestMapping() {
		return "/webdo/menu/menubycid.do";
	}

}
