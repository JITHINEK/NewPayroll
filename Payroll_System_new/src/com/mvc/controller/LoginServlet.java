package com.mvc.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int role = Integer.parseInt(request.getParameter("role"));
		String userName = request.getParameter("uname");
		String password = request.getParameter("passwd");
		
		System.out.println(role);
		System.out.println(userName);
		System.out.println(password);
		
		LoginBean loginBean = new LoginBean();
		
		loginBean.setUserName(userName);
		loginBean.setPassword(password);
		loginBean.setRole(role);

		LoginDao loginDao = new LoginDao();
		
		ResultSet resultSet = loginDao.authenticateUser(loginBean);
		
		int empIdDB = -1;
		String userNameDB = "";
		String passwordDB = "";
		int userRoleDB = -1;
		
		try {
			while(resultSet.next()) {
				empIdDB = resultSet.getInt("id"); 
				userNameDB = resultSet.getString("name"); 
				passwordDB = resultSet.getString("passwd");
				userRoleDB= resultSet.getInt("role");
				
				System.out.println("servlet");
				System.out.println(empIdDB);
				System.out.println(userNameDB);
				System.out.println(passwordDB);
				System.out.println(userRoleDB);
				
				
				if(userName.equals(userNameDB) && password.equals(passwordDB))
					if(userRoleDB ==0) {
						session.setAttribute("username", userName);
						session.setAttribute("id", empIdDB);
						request.getRequestDispatcher("Adminhome.jsp").forward(request, response);
					}else if(userRoleDB == 1) {
						session.setAttribute("username", userName);
						session.setAttribute("id", empIdDB);
						request.getRequestDispatcher("EmpHome.jsp").forward(request, response);
					}else {
						request.setAttribute("errMessage", "Invalid user crdintials");
						request.getRequestDispatcher("/Login.jsp").forward(request, response);
					}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		/*
		 * if (userValidate == 1) { session.setAttribute("userId",
		 * loginBean.getUserId());
		 * request.getRequestDispatcher("/index.jsp").forward(request, response); } else
		 * if(userValidate == 0) { session.setAttribute("userId",
		 * loginBean.getUserId()); request.getRequestDispatcher(
		 * "/Payroll_System/WebContent/adminModule/Adminhome.jsp").forward(request,
		 * response); }else{ request.setAttribute("errMessage", userValidate);
		 * request.getRequestDispatcher("/Login.jsp").forward(request, response); }
		 */
	}
}