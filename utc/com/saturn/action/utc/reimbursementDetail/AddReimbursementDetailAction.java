package com.saturn.action.utc.reimbursementDetail;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.ReimbursementDetail;

public class AddReimbursementDetailAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		ReimbursementDetail reimbursementDetail = BeanUtils.getBean(request,
				ReimbursementDetail.class);

		String numId = reimbursementDetail.getNumId();
		
		if (ReimbursementDetail.add(reimbursementDetail) == 1) {
			return new JspView("/utc/apply/showDetail.jsp?numId=" + numId);
		} else {
			return new JspErrorView("添加报销明细失败");
		}
	}

	@Override
	public String requestMapping() {
		return "/utc/reimbursementDetail/AddReimbursementDetail.action";
	}
}
