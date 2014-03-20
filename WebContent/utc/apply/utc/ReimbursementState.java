package com.saturn.utc;

import java.sql.Connection;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class ReimbursementState {

	private String id = "";
	private String reimbursement_id = "";
	private String projectName = "";
	private String userName = "";
	private String state = "";
	private String createTime = "";
	private String money_total = "";
	private String number_total = "";
	private String remark = "";

	private static ORMapping<ReimbursementState> mapping = new ResultORMapping<ReimbursementState>();

	public static int add(ReimbursementState reimbursementState) {
		return SimpleDaoTemplate
				.update("INSERT INTO utc_reimbursement_state(reimbursement_id, projectName, userName, state, createTime, money_total, number_total, remark) VALUES( ?, ?, ?, ?, ?, ?, ?, ?)",
						reimbursementState.getReimbursement_id(),
						reimbursementState.getProjectName(),
						reimbursementState.getUserName(),
						reimbursementState.getState(),
						reimbursementState.getCreateTime(),
						reimbursementState.getMoney_total(),
						reimbursementState.getNumber_total(),
						reimbursementState.getRemark());

	}

	public static int edit(ReimbursementState reimbursementState) {
		return SimpleDaoTemplate
				.update("UPDATE utc_reimbursementState SET reimbursementState_id = ?, projectName = ?"
						+ " userName = ?, state = ?, createTime = ?, money_total = ? , number_total = ?, remark = ?"
						+ "WHERE id = ?",
						reimbursementState.getReimbursement_id(),
						reimbursementState.getProjectName(),
						reimbursementState.getUserName(),
						reimbursementState.getState(),
						reimbursementState.getCreateTime(),
						reimbursementState.getMoney_total(),
						reimbursementState.getNumber_total(),
						reimbursementState.getRemark(),
						reimbursementState.getId());
	}

	public static ReimbursementState get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=reimbursementState
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如reimbursementState表，tableName=reimbursementState
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM utc_reimbursementState WHERE 1 = 1 and id = '" + id
						+ "'", null, mapping, ReimbursementState.class);
	}

	public static ReimbursementState getByNumber(String number) {
		// 指定值对象类型(VOClass)。例子VOClass=reimbursementState
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如reimbursementState表，tableName=reimbursementState
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM utc_reimbursementState WHERE 1 = 1 and number = '" + number
						+ "'", null, mapping, ReimbursementState.class);
	}
	
	public static ReimbursementState getMaxNumber() {
		// 指定值对象类型(VOClass)。例子VOClass=reimbursementState
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如reimbursementState表，tableName=reimbursementState
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate
				.queryOne(
						"SELECT max(number) as number FROM utc_reimbursementState WHERE 1 = 1",
						null, mapping, ReimbursementState.class);
	}

	public static ListData<ReimbursementState> getreimbursementStates(
			ReimbursementState reimbursementState, String start, String offset,
			String orderBy, String order) {

		return SimpleDaoTemplate.query(
				"SELECT * FROM utc_reimbursement_state WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(reimbursementState,
						"reimbursement_id").addCondition(
						"ORDER BY {0} {1}", orderBy, order), mapping,
						ReimbursementState.class, start, offset);
	}

	public static int removeAllResource(String id) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_reimbursementState_resource WHERE reimbursementStateId = ?",
						id);
	}

	public static int remove(final String id) {
		return SimpleDaoTemplate.update(new ITransaction() {

			public int execute(Connection connection) {
				SimpleDaoTemplate.update(connection,
						"DELETE FROM utc_reimbursementState WHERE Id = ?", id);

				return SimpleDaoTemplate.update(connection,
						"DELETE FROM utc_reimbursementState WHERE id = ?", id);
			}
		});
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public static int removeRole(String reimbursementStateId, String roleId) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_reimbursementState_role WHERE reimbursementStateId = ? and roleId = ?",
						reimbursementStateId, roleId);
	}

	public static void removeRoles(String reimbursementStateId, String[] roleIds) {
		if (roleIds != null) {
			for (String roleId : roleIds) {
				removeRole(reimbursementStateId, roleId);
			}
		}
	}

	public static int removeAllRole(String reimbursementStateId) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_reimbursementState_role WHERE reimbursementStateId = ?",
						reimbursementStateId);
	}

	public static ListData<ReimbursementState> getreimbursementStatesByRoleId(
			String roleId, String start, String offset, String orderBy) {

		return SimpleDaoTemplate
				.query("SELECT reimbursementState.* FROM auth_reimbursementStates reimbursementState, auth_re_reimbursementState_role reimbursementStateRole WHERE 1=1 and reimbursementState.id = reimbursementStateRole.reimbursementStateId",
						new DymaticCondition().addCondition(
								"AND reimbursementStateRole.roleId = '?'", roleId)
								.addCondition("ORDER BY ? desc", orderBy),
						mapping, ReimbursementState.class, start, offset);

	}

	public ReimbursementState() {
	}

	public ReimbursementState(String reimbursement_id, String projectName, 
			String userName, String state, String createTime,
			String money_total, String number_total,
			String remark) {
		
		this.reimbursement_id = reimbursement_id;
		this.projectName = projectName;
		this.userName = userName;
		this.state = state;
		this.createTime = createTime;
		this.money_total = money_total;
		this.number_total = number_total;
		this.remark = remark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}


	public String getReimbursement_id() {
		return reimbursement_id;
	}

	public void setReimbursement_id(String reimbursement_id) {
		this.reimbursement_id = reimbursement_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getMoney_total() {
		return money_total;
	}

	public void setMoney_total(String money_total) {
		this.money_total = money_total;
	}

	public String getNumber_total() {
		return number_total;
	}

	public void setNumber_total(String number_total) {
		this.number_total = number_total;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}

}
