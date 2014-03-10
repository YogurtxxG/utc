package com.saturn.action.utc.reimbursementDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.ReimbursementDetail;

public class QueryReimbursementDetailAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");

		ReimbursementDetail rebe = ReimbursementDetail.get(id);
		request.setAttribute("reimb", rebe);
		return new JspView("/utc/apply/editDetail.jsp");

	}

	@Override
	public String requestMapping() {
		return "/utc/reimbursementDetail/queryReimbursementDetail.action";
	}
}
