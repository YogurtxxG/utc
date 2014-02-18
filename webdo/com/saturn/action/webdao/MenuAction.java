package com.saturn.action.webdao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.website.Content;

public class MenuAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-------
		//String cid = request.getParameter("cid");
		String rootcid = request.getParameter("rootcid");
		if(rootcid==null||"".equals(rootcid))
			rootcid = "door";
		/*List contents = Content.getChildrenMenu(rootcid);
		JSONArray ja = new JSONArray();
		if (!contents.isEmpty()) {
			List menu = new ArrayList();
			for (int i = 0; i < contents.size(); ++i) {
				Content content = (Content) contents.get(i);
					JSONObject jobj = new JSONObject(content);
					menu.add(jobj);
			}
			ja = new JSONArray(menu);
		}*/
		JSONArray ja = getMenu(rootcid);
		//System.out.println(ja.toString());
		return new JsonView(ja.toString());
	}

	public String requestMapping() {
		return "/webdo/menu/menulist.do";
	}
	
	private JSONArray getMenu(String rootcid){
		List contents = Content.getChildrenMenu(rootcid);
		//String cid = request.getParameter("cid");
		JSONArray ja = new JSONArray();
		if (!contents.isEmpty()) {
			List menu = new ArrayList();
			for (int i = 0; i < contents.size(); ++i) {
				Content content = (Content) contents.get(i);
					JSONObject jobj = new JSONObject(content);
					try {
						jobj.put("children", getMenu(content.getId()));
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					menu.add(jobj);
			}
			ja = new JSONArray(menu);
		}
		return ja;
	}

}
