package com.saturn.action.utc.reimbursement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.Reimbursement;
import com.saturn.utc.ReimbursementDetail;

public class DeleteReimbursementAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");

		Reimbursement vo = Reimbursement.get(idStr);
		String number = vo.getNumber();

		ReimbursementDetail.removeByNumber(number);

		Reimbursement.removes(ids);
		return new JspView("/utc/apply/show.jsp");
	}

	@Override
	public String requestMapping() {
		// TODO Auto-generated method stub
		return "/utc/reimbursement/deleteReimbursement.action";
	}
}
