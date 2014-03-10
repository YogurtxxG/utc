package com.saturn.action.utc.reimbursement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.Reimbursement;

public class AddReimbursementAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		Reimbursement vo = BeanUtils.getBean(request, Reimbursement.class);
		
		if (Reimbursement.add(vo) == 1) {
			return new JspView("/utc/apply/show.jsp");
		} else {
			return new JspErrorView("添加信息失败");
		}
	}

	@Override
	public String requestMapping() {
		return "/utc/reimbursement/AddToReimbursement.action";
	}
}
