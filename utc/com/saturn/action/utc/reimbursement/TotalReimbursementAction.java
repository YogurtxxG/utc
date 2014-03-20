package com.saturn.action.utc.reimbursement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.utc.Reimbursement;

public class TotalReimbursementAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);
		Reimbursement vo = BeanUtils.getBean(request,Reimbursement.class);
		
		ListData<Reimbursement> data = Reimbursement.getReimbursementsAll(
				vo, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());
		ListData<Reimbursement> data1 = Reimbursement.getReimbursementsSum(
				vo, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList(),data1.getList()));
	}
	@Override
	public String requestMapping() {
		return "/app/utc/reimbursement/TotalReimbursement.action";
	}
}
