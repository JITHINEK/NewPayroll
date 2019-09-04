package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.MboPayoutDao;

public class MboPayout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");
		//String month = request.getParameter("month");
		int year = Integer.parseInt(request.getParameter("year"));
		MboPayoutDao mbo = new MboPayoutDao();
		int a = mbo.mboDao(id,year);
		if(a == 1) {
			RequestDispatcher rd = request.getRequestDispatcher("Mbo1.jsp"); 
			rd.forward(request, response);
		}
		
		
	}

}
