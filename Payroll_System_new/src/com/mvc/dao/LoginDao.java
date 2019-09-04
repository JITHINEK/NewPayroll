package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;

public class LoginDao {
	public ResultSet authenticateUser(LoginBean loginBean) {
		
		String userName = loginBean.getUserName();
		String passwd = loginBean.getPassword();
		int role=loginBean.getRole();
		
		System.out.println("deo");
		System.out.println(userName);
		System.out.println(passwd);
		System.out.println(role);
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		
		
		int empIdDB;
		String userNameDB = "";
		String passwordDB = "";
		int userRoleDB;
		
		try {
			con = DBConnection.createConnection();
			ps = con.prepareStatement("select user_tb.emp_id as id, user_tb.user_name as name,user_tb.passwd as passwd,emp_tb.role as role from emp_tb,user_tb where user_tb.user_name = ? and user_tb.passwd = ? and emp_tb.role = ? ");
			ps.setString(1, userName);
			ps.setString(2, passwd);
			ps.setInt(3, role);
			resultSet = ps.executeQuery();
			/*
			 * while (resultSet.next()) { empIdDB = resultSet.getInt("id"); userNameDB =
			 * resultSet.getString("name"); passwordDB = resultSet.getString("passwd");
			 * userRoleDB= resultSet.getInt("role");
			 * 
			 * System.out.println("inside deo while"); System.out.println(empIdDB);
			 * System.out.println(userNameDB); System.out.println(passwordDB);
			 * System.out.println(userRoleDB);
			 * 
			 * if(userRoleDB == 0) {
			 * 
			 * return 0; } else return 1; }
			 */
			return resultSet;
		}
		catch (SQLException e) {
			System.out.println("doa catch");
			e.printStackTrace();
		}
		return resultSet;
			
	}
}