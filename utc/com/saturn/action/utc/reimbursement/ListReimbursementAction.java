package com.saturn.action.utc.reimbursement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.utc.Reimbursement;

public class ListReimbursementAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		Reimbursement reimbursement = new Reimbursement(null,
				request.getParameter("projectName"),
				request.getParameter("date"), null,
				request.getParameter("userName"),
				request.getParameter("state"),
				request.getParameter("createTime"), null, null,
				request.getParameter("number"),null);

		ListData<Reimbursement> data = Reimbursement.getReimbursements(
				reimbursement, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	@Override
	public String requestMapping() {
		return "/app/utc/reimbursement/listReimbursement.action";
	}
}
