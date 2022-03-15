package com.model2.mvc.service.staff.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Staff;
import com.model2.mvc.service.domain.StaffSkill;
import com.model2.mvc.service.staff.StaffDao;


@Repository("staffDaoImpl")
public class StaffDaoImpl implements StaffDao {
	
	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public StaffDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public List<Staff> getStaffList(Search search) throws Exception {
		return sqlSession.selectList("StaffMapper.getStaffList", search);
	}
	
	@Override
	public List<Staff> getAllStaffList(Search search) throws Exception {
		return sqlSession.selectList("StaffMapper.getAllStaffList", search);
	}
	
	@Override
	public int addStaff(Staff staff) throws Exception {
		return sqlSession.insert("StaffMapper.addStaff", staff);
	}	
	
	@Override
	public int addStaffSkill(StaffSkill staffSkill) throws Exception {
		return sqlSession.insert("StaffMapper.addStaffSkill", staffSkill);
	}	
	
	public Staff getStaff(String juminNo) throws Exception{
		return sqlSession.selectOne("StaffMapper.getStaff", juminNo);
	}
	
	public Staff getStaff2(int staffNo) throws Exception{
		return sqlSession.selectOne("StaffMapper.getStaff2", staffNo);
	}	
	
	public StaffSkill getStaffSkill(int staffNo) throws Exception{
		return sqlSession.selectOne("StaffMapper.getStaffSkill", staffNo);
	}
	
	public List<StaffSkill> getStaffSkill2(int staffNo) throws Exception {
		return sqlSession.selectList("StaffMapper.getStaffSkill", staffNo);
	}	
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("StaffMapper.getTotalCount", search);
	}

	public void updateStaff(Staff staff) throws Exception {
		sqlSession.update("StaffMapper.updateStaff", staff);
	}

	public void updateStaffSkill(StaffSkill staffSkill) throws Exception {
		sqlSession.update("StaffMapper.updateStaffSkill", staffSkill);
	}

	public void deleteStaff(String juminNo) throws Exception {
		sqlSession.delete("StaffMapper.deleteStaff", juminNo);
	}

	public void deleteStaffSkill(int staffNo) throws Exception {
		sqlSession.delete("StaffMapper.deleteStaffSkill", staffNo);
	}












	
}
