package com.saturn.action.utc.reimbursementDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.utc.ReimbursementDetail;

public class ListReimbursementDetailAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
			DataGridInfo dataGridInfo = new DataGridInfo(request);

			/*ReimbursementDetail reimbursementDetail = new ReimbursementDetail(null,request.getParameter("name"),
					request.getParameter("projectName"), request.getParameter("date"),null,request.getParameter("userName"),
					request.getParameter("state"), request.getParameter("createTime"),null, null, request.getParameter("numId"));*/
			ReimbursementDetail vo = BeanUtils.getBean(request,ReimbursementDetail.class);

			ListData<ReimbursementDetail> data = ReimbursementDetail.getReimbursementDetails(vo, dataGridInfo.getStartPage(),
					dataGridInfo.getRows(), dataGridInfo.getSortId(),
					dataGridInfo.getOreder());
			
			ListData<ReimbursementDetail> data1 = ReimbursementDetail.getReimbursementDetailsSum(
					vo, dataGridInfo.getStartPage(),
					dataGridInfo.getRows(), dataGridInfo.getSortId(),
					dataGridInfo.getOreder());
			
			return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
					data.getList(),data1.getList()));
	}
	@Override
	public String requestMapping() {
		return "/utc/reimbursementDetail/listReimbursementDetail.action";
	}
}
