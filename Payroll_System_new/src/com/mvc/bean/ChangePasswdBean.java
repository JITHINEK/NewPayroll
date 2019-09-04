package com.mvc.bean;

public class ChangePasswdBean {
	String userName;
	String currentPasswd;
	String newPasswd;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCurrentPasswd() {
		return currentPasswd;
	}
	public void setCurrentPasswd(String currentPasswd) {
		this.currentPasswd = currentPasswd;
	}
	public String getNewPasswd() {
		return newPasswd;
	}
	public void setNewPasswd(String newPasswd) {
		this.newPasswd = newPasswd;
	}
	
}
