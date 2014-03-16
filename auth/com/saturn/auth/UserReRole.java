package com.saturn.auth;

import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class UserReRole {
	private String userId;
	private String roleId;
	
	private static ORMapping<UserReRole> mapping = new ResultORMapping<UserReRole>();


	public static UserReRole get(String userId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM auth_re_user_role WHERE 1 = 1 and userId = '" + userId + "'",
				null, mapping, UserReRole.class);
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	
}
