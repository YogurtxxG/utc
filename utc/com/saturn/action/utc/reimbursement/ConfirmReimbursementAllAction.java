package com.saturn.action.utc.reimbursement;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.Reimbursement;
import com.saturn.utc.ReimbursementState;

public class ConfirmReimbursementAllAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		String ids = request.getParameter("ids");
		String[] idStr = ids.split("__");
		if(idStr != null){
			for (int i = 0; i < idStr.length; i++) {
				String id = idStr[i];
				Reimbursement vo = Reimbursement.get(id);
				vo.setState("已付款");

				String createTime = vo.getCreateTime();
				String state = vo.getState();

				ReimbursementState reimbursementState = new ReimbursementState(
						vo.getId(), vo.getProjectName(), vo.getUserName(), state,
						createTime, vo.getMoney_total(), vo.getNumber_total(),
						vo.getRemark());

				Reimbursement.edit(vo);
				ReimbursementState.add(reimbursementState);
						
			}
			return new JspView("/utc/confirm/show.jsp");
		} else {
			return new JspErrorView("信息修改失败");
		}
	}

	@Override
	public String requestMapping() {
		return "/utc/confirm/confirmReimbursementAll.action";
	}
}
