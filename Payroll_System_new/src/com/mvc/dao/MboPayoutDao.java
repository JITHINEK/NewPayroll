package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mvc.util.DBConnection;

public class MboPayoutDao {
	Connection con = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	public int mboDao(int id, int year){
		
		int currentYear;
		int joinYear;
		String Query = "select extract(year from sysdate),extract(year from joining_date) from emp_tb where id = ?";   
		ResultSet rs1 = null;
		try {
			con = DBConnection.createConnection();
			ps = con.prepareStatement(Query);
			ps.setInt(1, id);
			rs1 = ps.executeQuery();
			rs1.next();
			currentYear = rs1.getInt(1);
			joinYear = rs1.getInt(2);
			if(year>=joinYear && year<=currentYear) {
				return 1;
			}
			else {
				return -1;
			}
		}catch(Exception e){
				System.out.println(e);
		}
		return 1;
	}
	
	public ResultSet fetchRating(int id) {
		String Que= "select rating from emp_tb where id = ?";
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
