package com.model2.mvc.service.domain;

public class StaffSkill {
	
	private int staffSkillNo;
	private int staffNo;
	private int skillCode;

	public StaffSkill() {}
	
	public int getStaffSkillNo() {
		return staffSkillNo;
	}

	public void setStaffSkillNo(int staffSkillNo) {
		this.staffSkillNo = staffSkillNo;
	}

	public int getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}

	public int getSkillCode() {
		return skillCode;
	}

	public void setSkillCode(int skillCode) {
		this.skillCode = skillCode;
	}

	@Override
	public String toString() {
		return "StaffSkill [staffSkillNo=" + staffSkillNo + ", staffNo=" + staffNo 
				+ ", skillCode=" + skillCode + "]";
	}
	
	
	
}
