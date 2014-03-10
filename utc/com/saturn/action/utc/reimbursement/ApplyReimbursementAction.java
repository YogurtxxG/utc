package com.saturn.action.utc.reimbursement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.utc.Reimbursement;
import com.saturn.utc.ReimbursementState;

public class ApplyReimbursementAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("id");
		Reimbursement vo = Reimbursement.get(id);
		vo.setState("待审核");

		String createTime = vo.getCreateTime();
		String state = vo.getState();
		
		ReimbursementState reimbursementState = new ReimbursementState(
				vo.getId(), vo.getProjectName(), vo.getUserName(), state,
				createTime, vo.getMoney_total(), vo.getNumber_total(),
				vo.getRemark());
		
		if (Reimbursement.edit(vo) == 1) {
			if(ReimbursementState.add(reimbursementState) == 1){
				return new JspView("/utc/apply/show.jsp");
			}
			 	return new JspErrorView("添加状态信息或者编辑失败");
		} else {
			return new JspErrorView("修改信息失败");
		}
	}

	@Override
	public String requestMapping() {
		return "/utc/reimbursement/applyReimbursement.action";
	}
}
