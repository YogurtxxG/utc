package com.saturn.action.utc.reimbursementState;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.utc.ReimbursementState;

public class QueryReimbursementState implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		DataGridInfo dataGridInfo = new DataGridInfo(request);
		ReimbursementState vo = BeanUtils.getBean(request, ReimbursementState.class);
		
		String reimbursement_id = request.getParameter("reimbursement_id");
		vo.setReimbursement_id(reimbursement_id);
		ListData<ReimbursementState> data = ReimbursementState.getreimbursementStates(
				vo, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}
	@Override
	public String requestMapping() {
		return "/app/utc/reimbursementState/queryReimbursementState.action";
	}
}
