package com.mvc.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mvc.dao.PayrollDAO;

public class Payroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");
		//PayrollBean payrollBean = new PayrollBean();
		Date date;
		
		date = Date.valueOf(request.getParameter("date_of_receive"));
		request.setAttribute("date", date);
		PayrollDAO payrollDAO = new PayrollDAO();
		int b = payrollDAO.payroll(id, date);
		session.setAttribute("tire", b);
		if(b != -1 ) {
			RequestDispatcher rd = request.getRequestDispatcher("Payslip.jsp"); 
			rd.forward(request, response);
		}
		
		/*
		 * try { rs.next(); payrollBean.setBasic(rs.getInt("basic"));
		 * payrollBean.setBonus(rs.getInt("bonus"));
		 * payrollBean.setFood_remb(rs.getInt("food_rembersement"));
		 * payrollBean.setHra(rs.getInt("hra")); payrollBean.setPf(rs.getInt("pf"));
		 * payrollBean.setSpe_allow(rs.getInt("special_allowance"));
		 * payrollBean.setTire(rs.getInt("tire_no"));
		 * 
		 * System.out.println("Basic: " + payrollBean.getBasic());
		 * 
		 * //session.setAttribute("bean", payrollBean); RequestDispatcher rd=
		 * request.getRequestDispatcher("Payroll.jsp"); rd.forward(request, response);
		 * 
		 * } catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		
		
	}

}
