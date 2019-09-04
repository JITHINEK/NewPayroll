package com.mvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import com.mvc.util.DBConnection;

public class PayrollDAO {
	Connection con = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	
	
	public int payroll(int id, Date date) {
		
		int tire = 0;
		
		Date sysdate;
		Date joinDate = null;
		
		//String Qurey1 = "select extract(month from sysdate),extract(year from sysdate),extract(month from joining_date),extract(year from joining_date),tire_no from emp_tb where id = ?";
		String Qurey1 = "select sysdate,joining_date,tire_no from emp_tb where id = ?";
		//String Query2 = "select tire_no,basic,hra,special_allowance,food_rembersement,bonus,pf,gratuity from tire_tb where tire_no = ?";
		ResultSet rs1 = null;
		//ResultSet rs2 = null;
		try {
			con = DBConnection.createConnection();
			ps = con.prepareStatement(Qurey1);
			ps.setInt(1, id);
			rs1 = ps.executeQuery();
			rs1.next();
			sysdate = rs1.getDate(1);
			joinDate = rs1.getDate(2);
			tire = rs1.getInt(3);
			if(date.after(joinDate) && date.before(sysdate)) {
				/*
				System.out.println("hello");
				ps = con.prepareStatement(Query2);
				ps.setInt(1, tire);
				rs2 = ps.executeQuery();
				*/
				return tire;
			}
			else {
				return -1;
			}
		}catch(Exception e){
				System.out.println(e);
		}
		return tire;
	}
	
	public ResultSet fetchSal(int id) {
		String Que= "select tire_no,basic,hra,special_allowance,food_rembersement,bonus,pf,gratuity from tire_tb where tire_no = ?";
		ResultSet rs = null;
		try {
			con = DBConnection.createConnection();
			ps = con.prepareStatement(Que);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			return rs;

		}catch(Exception e){
				System.out.println("fetchSal error");
				System.out.println(e);
		}
		return rs;
	}
}