package com.saturn.action.utc.reimbursementDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.ReimbursementDetail;

public class DeleteReimbursementDetailAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		ReimbursementDetail.removes(ids);
		return new JspView("/utc/apply/showDetail.jsp");
	}
	@Override
	public String requestMapping() {
		return "/utc/reimbursementDetail/deleteReimbursementDetail.action";
	}
}
