package com.mvc.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.AddEmpBean;
import com.mvc.dao.AdminDao;

import javafx.scene.control.Alert;


@WebServlet("/AddEmpServlet")
public class AddEmpServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id;
		int tireNo;
		int roll = 1;
		
		Date dateOfJoin;
		
		String name;
		String userName;
		String dept;
		String desig;
		String password;
		
		id = Integer.parseInt(request.getParameter("id"));
		tireNo = Integer.parseInt(request.getParameter("tire"));
		
		dateOfJoin = Date.valueOf(request.getParameter("date_of_join"));
		
		name = request.getParameter("name");
		System.out.println(name);
		userName = request.getParameter("username");
		dept = request.getParameter("dept");
		desig = request.getParameter("desig");
		password = request.getParameter("passwd");		
		
		System.out.println("controll goes to addempbean");
		AddEmpBean addEmpBean = new AddEmpBean();
		
		addEmpBean.setId(id);
		addEmpBean.setName(name);
		addEmpBean.setUserName(userName);
		addEmpBean.setDateOfJoin(dateOfJoin);
		addEmpBean.setTire_no(tireNo);
		addEmpBean.setDept(dept);
		addEmpBean.setDesig(desig);
		addEmpBean.setRoll(roll);
		addEmpBean.setPasswd(password);
		
		System.out.println("controll goes to admindao");
		AdminDao addEmp = new AdminDao();
		
		int a = addEmp.addEMP(addEmpBean);
		
		System.out.println("Sucss:" + a);
		
		request.getRequestDispatcher("Adminhome.jsp").forward(request, response);
		
	}

}
