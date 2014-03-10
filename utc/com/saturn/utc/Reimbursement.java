package com.saturn.utc;

import java.sql.Connection;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class Reimbursement {
	private String id = "";
	private String projectName = "";
	private String date = "";
	private String userId = "";
	private String userName = "";
	private String state = "";
	private String createTime = "";
	private String money_total = "";
	private String number_total = "";
	private String number = "";
	private String remark = "";

	private static ORMapping<Reimbursement> mapping = new ResultORMapping<Reimbursement>();

	public static int add(Reimbursement reimbursement) {
		return SimpleDaoTemplate
				.update("INSERT INTO utc_reimbursement(projectName, date, userId, userName, state, createTime, money_total, number_total, number, remark) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						reimbursement.getProjectName(),
						reimbursement.getDate(), reimbursement.getUserId(),
						reimbursement.getUserName(), reimbursement.getState(),
						reimbursement.getCreateTime(),
						reimbursement.getMoney_total(),
						reimbursement.getNumber_total(),
						reimbursement.getNumber(),
						reimbursement.getRemark());

	}


	public static int edit(Reimbursement reimbursement) {
		return SimpleDaoTemplate
				.update("UPDATE utc_reimbursement SET projectName = ?, date = ?, userId = ?,"
						+ " userName = ?, state = ?, createTime = ?, money_total = ? , number_total = ?, number = ?, remark = ? "
						+ "WHERE id = ?",
						reimbursement.getProjectName(),
						reimbursement.getDate(), reimbursement.getUserId(),
						reimbursement.getUserName(), reimbursement.getState(),
						reimbursement.getCreateTime(),
						reimbursement.getMoney_total(),
						reimbursement.getNumber_total(),
						reimbursement.getNumber(),
						reimbursement.getRemark(),reimbursement.getId());
	}

	public static Reimbursement get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=Reimbursement
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如Reimbursement表，tableName=Reimbursement
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM utc_reimbursement WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Reimbursement.class);
	}

	public static Reimbursement getMaxNumber() {
		//指定值对象类型(VOClass)。例子VOClass=Reimbursement
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如Reimbursement表，tableName=Reimbursement
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT max(number) as number FROM utc_reimbursement WHERE 1 = 1",
				null, mapping, Reimbursement.class);
	}
	
	public static ListData<Reimbursement> getReimbursements(Reimbursement reimbursement, String start,
			String offset, String orderBy, String order) {

		return SimpleDaoTemplate.query(
				"SELECT * FROM utc_reimbursement WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(reimbursement, "id", "name",
						"state", "phone").addCondition("ORDER BY {0} {1}",
						orderBy, order), mapping, Reimbursement.class, start, offset);
	}

	public static int removeAllResource(String id) {
		return SimpleDaoTemplate.update(
				"DELETE FROM auth_re_Reimbursement_resource WHERE ReimbursementId = ?", id);
	}

	public static int remove(final String id) {
		return SimpleDaoTemplate.update(new ITransaction() {

			public int execute(Connection connection) {
				SimpleDaoTemplate.update(connection,
						"DELETE FROM utc_reimbursement WHERE Id = ?", id);

				return SimpleDaoTemplate.update(connection,
						"DELETE FROM utc_reimbursement WHERE id = ?", id);
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

	public static int removeRole(String ReimbursementId, String roleId) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_Reimbursement_role WHERE ReimbursementId = ? and roleId = ?",
						ReimbursementId, roleId);
	}

	public static void removeRoles(String ReimbursementId, String[] roleIds) {
		if (roleIds != null) {
			for (String roleId : roleIds) {
				removeRole(ReimbursementId, roleId);
			}
		}
	}

	public static int removeAllRole(String ReimbursementId) {
		return SimpleDaoTemplate.update(
				"DELETE FROM auth_re_Reimbursement_role WHERE ReimbursementId = ?", ReimbursementId);
	}

	public static ListData<Reimbursement> getReimbursementsByRoleId(String roleId, String start,
			String offset, String orderBy) {

		return SimpleDaoTemplate
				.query("SELECT Reimbursement.* FROM auth_Reimbursements Reimbursement, auth_re_Reimbursement_role ReimbursementRole WHERE 1=1 and Reimbursement.id = ReimbursementRole.ReimbursementId",
						new DymaticCondition().addCondition(
								"AND ReimbursementRole.roleId = '?'", roleId)
								.addCondition("ORDER BY ? desc", orderBy),
						mapping, Reimbursement.class, start, offset);

	}


	public Reimbursement() {
	}

	public Reimbursement(String id, String projectName, String date,
			String userId, String userName, String state, String createTime,
			String money_total, String number_total, String number, String remark) {
		this.id = id;
		this.projectName = projectName;
		this.date = date;
		this.userId = userId;
		this.userName = userName;
		this.state = state;
		this.createTime = createTime;
		this.money_total = money_total;
		this.number_total = number_total;
		this.number = number;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	
	public String getNumber() {
		return number;
	}


	public void setNumber(String number) {
		this.number = number;
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
