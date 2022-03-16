package com.model2.mvc.service.staff.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.CodeDepartment;
import com.model2.mvc.service.domain.Staff;
import com.model2.mvc.service.domain.StaffSkill;
import com.model2.mvc.service.staff.StaffDao;
import com.model2.mvc.service.staff.StaffService;


@Service("staffServiceImpl")
public class StaffServiceImpl implements StaffService {
	
	//Field
	@Autowired
	@Qualifier("staffDaoImpl")
	private StaffDao staffDao;
	public void setStaff(StaffDao staffDao) {
		this.staffDao = staffDao;
	}
	
	//Constructor
	public StaffServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Map<String, Object> getStaffList(Search search) throws Exception {
		List<Staff> list = staffDao.getStaffList(search);
		int totalCount = staffDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Map<String, Object> getStaffList2(Search search) throws Exception {
		List<Staff> list = staffDao.getStaffList2(search);
		int totalCount = staffDao.getTotalCount2(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}	
	
	@Override
	public int addStaff(Staff staff) throws Exception {
		return staffDao.addStaff(staff);
	}

	@Override
	public int addStaffSkill(StaffSkill staffSkill) throws Exception {
		return staffDao.addStaffSkill(staffSkill);
	}	
	
	public Staff getStaff(String juminNo) throws Exception{
		return staffDao.getStaff(juminNo);
	}
	
	public Staff getStaff2(int staffNo) throws Exception{
		return staffDao.getStaff2(staffNo);
	}	
	
	public StaffSkill getStaffSkill(int staffNo) throws Exception{
		return staffDao.getStaffSkill(staffNo);
	}
	
	public List<StaffSkill> getStaffSkill2(int staffNo) throws Exception {
		return staffDao.getStaffSkill2(staffNo);
	}

	public void updateStaff(Staff staff) throws Exception {
		staffDao.updateStaff(staff);
	}

	public void updateStaffSkill(StaffSkill staffSkill) throws Exception {
		staffDao.updateStaffSkill(staffSkill);
	}

	public void deleteStaff(String juminNo) throws Exception {
		staffDao.deleteStaff(juminNo);
	}

	public void deleteStaffSkill(int staffNo) throws Exception {
		staffDao.deleteStaffSkill(staffNo);
	}




	




}
