package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mvc.bean.EditProfileBean;
import com.mvc.util.DBConnection;

public class ProfileDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	
	public ResultSet[] profile(int id) {
		
		String pDQuery = "select name,id,emai_id,joining_date from emp_tb where emp_tb.id=?";
		String idenQuery = "select adhar_no,pan_no,ph_no from personaldetails_tb where emp_id = ?";
		String condQuery = "select addr,city,state,pin from addr_tb where emp_id = ?";
		String bankQuery = "select bank_name,acc_no,ifsc_code from bank_tb where emp_id = ?";
		
		ResultSet[] resultSet = new ResultSet[4];
		
		try {
			con = DBConnection.createConnection();
			ps = con.prepareStatement(pDQuery);
			ps.setLong(1,id);
			resultSet[0] = ps.executeQuery();
			ps = con.prepareStatement(idenQuery);
			ps.setLong(1, id);
			resultSet[1] = ps.executeQuery();
			ps = con.prepareStatement(condQuery);
			ps.setLong(1, id);
			resultSet[2] = ps.executeQuery();
			ps = con.prepareStatement(bankQuery);
			ps.setLong(1, id);
			resultSet[3]= ps.executeQuery();
			
			
			return resultSet;
		}
		catch (SQLException e) {
			System.out.println("doa catch");
			e.printStackTrace();
		}
		return resultSet;
	}
	
	public int EditProfile(EditProfileBean edit) {
		
		ResultSet[] resultSet = new ResultSet[4];
		
		try {
			
			System.out.println("inside profileDao...!");
			
			con = DBConnection.createConnection();
			System.out.println("control from DBConnection.....!");
			
			ps = con.prepareStatement("update emp_tb set emai_id= ? where id = ?");
			System.out.println(edit.getEmailId());
			ps.setString(1, edit.getEmailId());
			System.out.println(edit.getId());
			ps.setInt(2, edit.getId());
			resultSet[0] = ps.executeQuery();
			System.out.println("Emp_tb updation completed");
			
			
			ps = con.prepareStatement("update addr_tb set addr= ?, city = ?, state = ?, pin = ? where emp_id = ?"); 
			ps.setString(1, edit.getAddr());
			ps.setString(2, edit.getCity()); 
			ps.setString(3, edit.getState());
			ps.setInt(4, edit.getPincode()); 
			ps.setInt(5, edit.getId());
			resultSet[1] = ps.executeQuery();
			System.out.println("Addr_tb updation completed");
			 
			ps = con.prepareStatement("update personaldetails_tb set adhar_no = ?, pan_no = ?, ph_no = ? where emp_id = ?"); 
			ps.setLong(1,edit.getAadharNo()); 
			ps.setString(2, edit.getPan()); 
			ps.setLong(3, edit.getMobileNo()); 
			ps.setInt(4, edit.getId()); 
			resultSet[2] = ps.executeQuery();
			System.out.println("personaldetails_tb updation completed");
			
			ps = con.prepareStatement("update bank_tb set bank_name = ?, acc_no = ?, ifsc_code = ? where emp_id = ?");
			ps.setString(1, edit.getBankName());
			ps.setLong(2, edit.getAccNo());
			ps.setString(3, edit.getIfscCode());
			ps.setInt(4, edit.getId());
			resultSet[3] = ps.executeQuery();
			System.out.println("bank_tb updation completed");
			
		}catch(Exception e) {
			System.out.println("Edit catch!");
			System.out.println(e);
			return -1;
		}
		return 0;
	}
}
