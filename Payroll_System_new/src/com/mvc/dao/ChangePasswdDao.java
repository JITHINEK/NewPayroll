package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mvc.bean.ChangePasswdBean;
import com.mvc.util.DBConnection;

public class ChangePasswdDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public int changePasswd(ChangePasswdBean bean) {
		
		int status =-1;
		try {
			System.out.println("inside ChangePasswdDao...!");
			Connection con = DBConnection.createConnection();
			ps = con.prepareStatement("update user_tb set passwd=? where user_name=? and passwd=?");
			ps.setString(1, bean.getNewPasswd());
			System.out.println("user: " + bean.getUserName());
			ps.setString(2, bean.getUserName());
			ps.setString(3, bean.getCurrentPasswd());
			rs = ps.executeQuery();
			status = 0;
			System.out.println("Status 0");
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return status;
		
	}
}
