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
		Reimbursement reimbursement = Reimbursement.getByNumber(vo.getNumber());

		if (reimbursement == null) { //创建
			if (Reimbursement.add(vo) == 1) {
				return new JspView("/utc/apply/show.jsp");
			} else {
				return new JspErrorView("添加信息失败");
			}
		} else {
			if ("审批驳回".equals(reimbursement.getState()) //驳回
					|| "财务驳回".equals(reimbursement.getState())) {
				reimbursement.setState("待提交");
				reimbursement.setRemark(vo.getRemark());
				if (Reimbursement.edit(reimbursement) == 1) {
					return new JspView("/utc/apply/show.jsp");
				} else {
					return new JspErrorView("添加信息失败");
				}
			} else { //查看明细
				if (Reimbursement.edit(reimbursement) == 1) {
					return new JspView("/utc/apply/show.jsp");
				} else {
					return new JspErrorView("添加信息失败");
				}
			}
		}
	}

	@Override
	public String requestMapping() {
		return "/utc/reimbursement/AddToReimbursement.action";
	}
}
