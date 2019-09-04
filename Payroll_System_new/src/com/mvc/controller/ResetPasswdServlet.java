package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.ChangePasswdBean;
import com.mvc.dao.ChangePasswdDao;

@WebServlet("/ResetPasswdServlet")
public class ResetPasswdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String currentPasswd = request.getParameter("currentPasswd");
		String newPasswd = request.getParameter("newPasswd");
		ChangePasswdBean changePasswdBean = new ChangePasswdBean();
		changePasswdBean.setUserName((String)session.getAttribute("username"));
		changePasswdBean.setCurrentPasswd(currentPasswd);
		changePasswdBean.setNewPasswd(newPasswd);
		
		ChangePasswdDao changePasswdDao = new ChangePasswdDao();
		int status = changePasswdDao.changePasswd(changePasswdBean);
		System.out.println("Status in servlet: "+ status);
		if(status == 0) {
			request.setAttribute("errMessage", "Successfully Update..!");
			request.getRequestDispatcher("/ResetPasswd.jsp").forward(request, response);
		}else {
			request.setAttribute("errMessage", "Something went wrong...!");
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}

}
