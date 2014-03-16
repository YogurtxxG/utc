package com.saturn.action.utc.reimbursement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.utc.Reimbursement;

public class ToReimbursementDetailAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		User user = (User)request.getSession().getAttribute("authUser");
		String name = user.getId();
		Reimbursement vo = Reimbursement.getMaxNumber();
		
		String number = "";
		if("".equals(vo.getNumber()) || vo.getNumber() == null ){
			number += name + "_";
			number += "201400000";
		} else {
			number += name + "_";
			String voNumber = vo.getNumber();
			voNumber = voNumber.substring(voNumber.length()-9, voNumber.length());
			
			number += Integer.toString((Integer.parseInt(voNumber) + 1));
		}

		return new JspView("/utc/apply/showDetail.jsp?numId="+number);
	}

	@Override
	public String requestMapping() {
		return "/utc/apply/toReimbursementDetail.action";
	}
}
