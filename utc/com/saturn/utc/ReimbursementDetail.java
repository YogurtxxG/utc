package com.saturn.utc;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class ReimbursementDetail {
	private String id = "";
	private String name = "";
	private String money = "";
	private String number = "";
	private String state = "";
	private String createTime = "";
	private String remark = "";
	private String userId = "";
	private String numId = "";

	private static ORMapping<ReimbursementDetail> mapping = new ResultORMapping<ReimbursementDetail>();

	public static int add(final ReimbursementDetail reimbursementDetail) {
		SimpleDaoTemplate
				.update("INSERT INTO utc_reimbursement_detail(name, money, number, state, createTime, remark, userId, numId) VALUES(?, ?, ?, ?, ?, ?, ?, ?)",
						reimbursementDetail.getName(),
						reimbursementDetail.getMoney(),
						reimbursementDetail.getNumber(),
						reimbursementDetail.getState(),
						reimbursementDetail.getCreateTime(),
						reimbursementDetail.getRemark(),
						reimbursementDetail.getUserId(),
						reimbursementDetail.getNumId());

		updateTotal(reimbursementDetail.getNumId());
		return 1;

	}

	public static void updateTotal(String id) {
		Reimbursement reimbursement = Reimbursement.getByNumber(id);

		if (reimbursement != null && reimbursement.getId() != null) {

			int totalMoney = getTotalMoney(id);
			int totalNumber = getTotalNumber(id);

			reimbursement.setMoney_total(totalMoney + "");
			reimbursement.setNumber_total(totalNumber + "");
			Reimbursement.edit(reimbursement);
		}
	}

	public static int getTotalMoney(String id) {
		return SimpleDaoTemplate.queryCount(
				"select sum(money) from utc_reimbursement_detail where numId = '"
						+ id + "'", null);
	}

	public static int getTotalNumber(String id) {
		return SimpleDaoTemplate.queryCount(
				"select sum(number) from utc_reimbursement_detail where numId = '"
						+ id + "'", null);
	}

	public static int edit(final ReimbursementDetail reimbursementDetail) {
		SimpleDaoTemplate
				.update("UPDATE utc_reimbursement_detail SET name = ?, money = ?,  number = ?,"
						+ "  state = ?, createTime = ?, remark = ?, userId = ?, numId = ? "
						+ "WHERE id = ?", reimbursementDetail.getName(),
						reimbursementDetail.getMoney(),
						reimbursementDetail.getNumber(),
						reimbursementDetail.getState(),
						reimbursementDetail.getCreateTime(),
						reimbursementDetail.getRemark(),
						reimbursementDetail.getUserId(),
						reimbursementDetail.getNumId(),
						reimbursementDetail.getId());

		updateTotal(reimbursementDetail.getNumId());

		return 1;
	}

	public static ReimbursementDetail get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=ReimbursementDetail
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如ReimbursementDetail表，tableName=ReimbursementDetail
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM utc_reimbursement_detail WHERE 1 = 1 and id = '"
						+ id + "'", null, mapping, ReimbursementDetail.class);
	}

	public static ListData<ReimbursementDetail> getReimbursementDetails(
			ReimbursementDetail reimbursementDetail, String start,
			String offset, String orderBy, String order) {

		return SimpleDaoTemplate.query(
				"SELECT * FROM utc_reimbursement_detail WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(reimbursementDetail,
						"numId", "projectname", "state", "date").addCondition(
						"ORDER BY {0} {1}", orderBy, order), mapping,
				ReimbursementDetail.class, start, offset);
	}

	public static ListData<ReimbursementDetail> getReimbursementDetailsSum(
			ReimbursementDetail reimbursementDetail, String start,
			String offset, String orderBy, String order) {

		return SimpleDaoTemplate
				.query("SELECT sum(money) money, sum(number) number FROM utc_reimbursement_detail WHERE 1 = 1",
						new DymaticCondition().addSimpleCondition(
								reimbursementDetail, "numId", "projectname",
								"state", "date").addCondition(
								"ORDER BY {0} {1}", orderBy, order), mapping,
						ReimbursementDetail.class, start, offset);
	}

	public static int removeAllResource(String id) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_ReimbursementDetail_resource WHERE ReimbursementDetailId = ?",
						id);
	}

	public static int remove(final String id) {
		SimpleDaoTemplate.update(
				"DELETE FROM utc_reimbursement_detail WHERE id = ?", id);
		ReimbursementDetail reimbursementDetail = get(id);
		updateTotal(reimbursementDetail.getNumId());
		return 1;
	}

	public static int removeByNumber(final String numId) {
		return SimpleDaoTemplate.update(
				"DELETE FROM utc_reimbursement_detail WHERE numId = ?", numId);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public static int removeRole(String ReimbursementDetailId, String roleId) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_ReimbursementDetail_role WHERE ReimbursementDetailId = ? and roleId = ?",
						ReimbursementDetailId, roleId);
	}

	public static void removeRoles(String ReimbursementDetailId,
			String[] roleIds) {
		if (roleIds != null) {
			for (String roleId : roleIds) {
				removeRole(ReimbursementDetailId, roleId);
			}
		}
	}

	public static int removeAllRole(String ReimbursementDetailId) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_ReimbursementDetail_role WHERE ReimbursementDetailId = ?",
						ReimbursementDetailId);
	}

	public static ListData<ReimbursementDetail> getReimbursementDetailsByRoleId(
			String roleId, String start, String offset, String orderBy) {

		return SimpleDaoTemplate
				.query("SELECT ReimbursementDetail.* FROM auth_ReimbursementDetails ReimbursementDetail, auth_re_ReimbursementDetail_role ReimbursementDetailRole WHERE 1=1 and ReimbursementDetail.id = ReimbursementDetailRole.ReimbursementDetailId",
						new DymaticCondition().addCondition(
								"AND ReimbursementDetailRole.roleId = '?'",
								roleId)
								.addCondition("ORDER BY ? desc", orderBy),
						mapping, ReimbursementDetail.class, start, offset);

	}

	public ReimbursementDetail() {
	}

	public ReimbursementDetail(String id, String name, String money, String number,
			String state, String createTime, String remark, String userId,
			String numId) {

		this.id = id;
		this.name = name;
		this.money = money;
		this.number = number;
		this.state = state;
		this.createTime = createTime;
		this.remark = remark;
		this.userId = userId;
		this.numId = numId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNumId() {
		return numId;
	}

	public void setNumId(String numId) {
		this.numId = numId;
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
