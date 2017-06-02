package com.kosta.book.admin.login.model;

public class EmployeeVO {
	
	/*create table Employee (
			  empNo number,
			  pwd varchar2(20),
			  name varchar2(20),
			  empClass varchar2(20),
			  address1 varchar2(200),
			  address2 varchar2(200),
			  phone varchar2(11),
			  gender varchar2(1),
			  birth varchar2(6),
			  branch varchar2(20)
			);*/
	
	private String pwd, name, empClass, address1, address2, phone, gender, birth, branch;
	private int empNo;
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmpClass() {
		return empClass;
	}
	public void setEmpClass(String empClass) {
		this.empClass = empClass;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	

}
