package com.model2.mvc.service.staff;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.CodeDepartment;
import com.model2.mvc.service.domain.CodeSchool;
import com.model2.mvc.service.domain.CodeSkill;
import com.model2.mvc.service.domain.Staff;
import com.model2.mvc.service.domain.StaffSkill;



public interface StaffDao {
	
	// SELECT LIST
	public List<Staff> getStaffList(Search search) throws Exception;
	
	public List<Staff> getStaffList2(Search search) throws Exception;
	
	public int addStaff(Staff staff) throws Exception;

	public int addStaffSkill(StaffSkill staffSkill) throws Exception;
	
	public Staff getStaff(String juminNo) throws Exception;
	
	public Staff getStaff2(int staffNo) throws Exception;
	
	public StaffSkill getStaffSkill(int staffNo) throws Exception;
	
	public List<StaffSkill> getStaffSkill2(int staffNo) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public int getTotalCount2(Search search) throws Exception;
	
	public void updateStaff(Staff staff) throws Exception;
	
	public void updateStaffSkill(StaffSkill staffSkill) throws Exception;
	
	public void deleteStaff(String juminNo) throws Exception;
	
	public void deleteStaffSkill(int staffNo) throws Exception;
}
