package com.model2.mvc.service.domain;

import java.util.Date;

public class Staff {
	
	private int staffNo;
	private String staffName;
	private String juminNo;
	private CodeSchool codeSchool;
	private CodeDepartment codeDepartment;
	private String graduateDay;
	
	public Staff() {};
	
	public String getJuminNo() {
		return juminNo;
	}

	public void setJuminNo(String juminNo) {
		this.juminNo = juminNo;
	}
	
	public int getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getGraduateDay() {
		return graduateDay;
	}

	public void setGraduateDay(String graduateDay) {
		this.graduateDay = graduateDay;
	}

	public CodeSchool getCodeSchool() {
		return codeSchool;
	}

	public void setCodeSchool(CodeSchool codeSchool) {
		this.codeSchool = codeSchool;
	}

	public CodeDepartment getCodeDepartment() {
		return codeDepartment;
	}

	public void setCodeDepartment(CodeDepartment codeDepartment) {
		this.codeDepartment = codeDepartment;
	}

	@Override
	public String toString() {
		return "StaffVO [staffNo=" + staffNo + ", staffName=" + staffName 
				+ ", juminNo=" + juminNo + ", graduateDay=" + graduateDay + "]"
				+ ", codeSchool=" + codeSchool.getSchoolCode() + ",codeDepartment=" + codeDepartment.getDepartmentCode();
	}	
	
}
