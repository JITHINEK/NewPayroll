package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.EditProfileBean;
import com.mvc.dao.ProfileDao;


public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside EditProfile servlet!");
		
		HttpSession session = request.getSession();
		
		int id = (int) session.getAttribute("id");
		
		int pincode = Integer.parseInt(request.getParameter("pin"));
		
		long aadharNo = Long.parseLong(request.getParameter("aadhar"));
		long mobileNo = Long.parseLong(request.getParameter("mob"));
		long accNo = Long.parseLong(request.getParameter("accNo"));
		
		String emailId = request.getParameter("mail");
		String addr = request.getParameter("addr");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pan = request.getParameter("pan");
		String bankName = request.getParameter("bankName");
		String ifscCode = request.getParameter("ifsc");
		
		System.out.println("Feched id form session: " + id);
		
		EditProfileBean edit = new EditProfileBean();
		edit.setId(id);
		edit.setPincode(pincode);
		edit.setAadharNo(aadharNo);
		edit.setMobileNo(mobileNo);
		edit.setEmailId(emailId);
		edit.setAddr(addr);
		edit.setCity(city);
		edit.setState(state);
		edit.setPan(pan);
		edit.setBankName(bankName);
		edit.setIfscCode(ifscCode);
		edit.setAccNo(accNo);
		
		ProfileDao profileDao = new ProfileDao();
		
		int status = profileDao.EditProfile(edit);
		System.out.println("status: " + status);
		if(status != -1)
			request.getRequestDispatcher("EmpProfile.jsp").forward(request, response);
		else
			System.out.println("somthing went wrong ....!");
		
		
		
		
		
	}

}
