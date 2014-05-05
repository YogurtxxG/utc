package com.saturn.action.utc.reimbursementDetail;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.utc.ReimbursementDetail;

public class UpdateAjaxReimbursementDetailAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		ReimbursementDetail reimbursementDetail = BeanUtils.getBean(request, ReimbursementDetail.class);
		
		if(ReimbursementDetail.edit(reimbursementDetail) == 1){
			return new JsonView("true");
		} else {
			return new JsonView("false");
		}
	}
	@Override
	public String requestMapping() {
		return "/utc/reimbursementDetail/updateAjaxReimbursementDetail.action";
	}
}
