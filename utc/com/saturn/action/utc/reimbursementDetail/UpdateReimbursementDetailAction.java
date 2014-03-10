package com.saturn.action.utc.reimbursementDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.ReimbursementDetail;

public class UpdateReimbursementDetailAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ReimbursementDetail reimbursementDetail = BeanUtils.getBean(request, ReimbursementDetail.class);
		
		if(ReimbursementDetail.edit(reimbursementDetail) == 1){
			return new JspView("/utc/apply/showDetail.jsp");
		} else {
			return new JspErrorView("修改信息失败");
		}
		
	}
	@Override
	public String requestMapping() {
		return "/utc/reimbursementDetail/updateReimbursementDetail.action";
	}
}
