package com.model2.mvc.service.staff;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Staff;
import com.model2.mvc.service.domain.StaffSkill;



public interface StaffService {

	public Map<String , Object> getStaffList(Search search) throws Exception;
	
	public Map<String , Object> getAllStaffList(Search search) throws Exception;
	
	public int addStaff(Staff staff) throws Exception;
	
	public int addStaffSkill(StaffSkill staffSkill) throws Exception;
	
	public Staff getStaff(String juminNo) throws Exception;
	
	public Staff getStaff2(int staffNo) throws Exception;

	public void updateStaff(Staff staff) throws Exception;
	
	public void updateStaffSkill(StaffSkill staffSkill) throws Exception;
	
	public void deleteStaff(String juminNo) throws Exception;
	
	public void deleteStaffSkill(int staffNo) throws Exception;	
	
	
}
