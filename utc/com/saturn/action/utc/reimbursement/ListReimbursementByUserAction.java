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
import com.saturn.auth.User;
import com.saturn.utc.Reimbursement;

public class ListReimbursementByUserAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);
		
		Reimbursement vo = BeanUtils.getBean(request,Reimbursement.class);
		User user = (User)request.getSession().getAttribute("authUser");
		if("guyu".equals(user.getId())){
			vo.setState("待审核");
			ListData<Reimbursement> data = Reimbursement.getReimbursements(
					vo, dataGridInfo.getStartPage(),
					dataGridInfo.getRows(), dataGridInfo.getSortId(),
					dataGridInfo.getOreder());
			
			ListData<Reimbursement> data1 = Reimbursement.getReimbursementsSum(
					vo, dataGridInfo.getStartPage(),
					dataGridInfo.getRows(), dataGridInfo.getSortId(),
					dataGridInfo.getOreder());

			return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
					data.getList(),data1.getList()));
		} else if("liuchunyu".equals(user.getId())){
			vo.setState("待确认");
			ListData<Reimbursement> data = Reimbursement.getReimbursements(
					vo, dataGridInfo.getStartPage(),
					dataGridInfo.getRows(), dataGridInfo.getSortId(),
					dataGridInfo.getOreder());
			ListData<Reimbursement> data1 = Reimbursement.getReimbursementsSum(
					vo, dataGridInfo.getStartPage(),
					dataGridInfo.getRows(), dataGridInfo.getSortId(),
					dataGridInfo.getOreder());

			return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
					data.getList(), data1.getList()));
		} else 
			return null;
	}
	@Override
	public String requestMapping() {
		return "/app/utc/reimbursement/listReimbursementByUser.action";
	}
}
