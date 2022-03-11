package com.model2.mvc.common;


//==>����Ʈȭ���� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean 
public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private String searchName;
	private String searchGender;
	private String searchGender2;
	private String searchDepartment;
	private String searchEducation;
	private String[] searchSkill;
	private String searchGraduateStart;
	private String searchGraduateEnd;
	
	private String dateStart1;
	private String dateStart2;
	private String dateStart3;
	
	private String dateEnd1;
	private String dateEnd2;
	private String dateEnd3;
	
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	

	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchGender() {
		return searchGender;
	}

	public void setSearchGender(String searchGender) {
		this.searchGender = searchGender;
	}
	
	public String getSearchGender2() {
		return searchGender2;
	}

	public void setSearchGender2(String searchGender2) {
		this.searchGender2 = searchGender2;
	}

	public String getSearchDepartment() {
		return searchDepartment;
	}

	public void setSearchDepartment(String searchDepartment) {
		this.searchDepartment = searchDepartment;
	}

	public String getSearchEducation() {
		return searchEducation;
	}

	public void setSearchEducation(String searchEducation) {
		this.searchEducation = searchEducation;
	}

	public String[] getSearchSkill() {
		return searchSkill;
	}

	public void setSearchSkill(String[] searchSkill) {
		this.searchSkill = searchSkill;
	}

	public String getSearchGraduateStart() {
		return searchGraduateStart;
	}

	public void setSearchGraduateStart(String searchGraduateStart) {
		this.searchGraduateStart = searchGraduateStart;
		if(searchGraduateStart != null && searchGraduateStart.length() != 0) {
			dateStart1 = searchGraduateStart.split("-")[0];
			dateStart2 = searchGraduateStart.split("-")[1];
			dateStart3 = searchGraduateStart.split("-")[2];
		}
	}

	public String getSearchGraduateEnd() {
		return searchGraduateEnd;
	}

	public void setSearchGraduateEnd(String searchGraduateEnd) {
		this.searchGraduateEnd = searchGraduateEnd;
		if(searchGraduateEnd != null && searchGraduateEnd.length() != 0) {
			dateEnd1 = searchGraduateEnd.split("-")[0];
			dateEnd2 = searchGraduateEnd.split("-")[1];
			dateEnd3 = searchGraduateEnd.split("-")[2];
		}
		searchGraduateEnd = dateEnd1+"-"+dateEnd2+"-"+dateEnd3;
	}

	public String getDateStart1() {
		return dateStart1;
	}

	public void setDateStart1(String dateStart1) {
		this.dateStart1 = dateStart1;
	}

	public String getDateStart2() {
		return dateStart2;
	}

	public void setDateStart2(String dateStart2) {
		this.dateStart2 = dateStart2;
	}

	public String getDateStart3() {
		return dateStart3;
	}

	public void setDateStart3(String dateStart3) {
		this.dateStart3 = dateStart3;
	}

	public String getDateEnd1() {
		return dateEnd1;
	}

	public void setDateEnd1(String dateEnd1) {
		this.dateEnd1 = dateEnd1;
	}

	public String getDateEnd2() {
		return dateEnd2;
	}

	public void setDateEnd2(String dateEnd2) {
		this.dateEnd2 = dateEnd2;
	}

	public String getDateEnd3() {
		return dateEnd3;
	}

	public void setDateEnd3(String dateEnd3) {
		this.dateEnd3 = dateEnd3;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword
				+ ", searchName=" + searchName + ", searchGender=" + searchGender + ", searchDepartment=" + searchDepartment
				+ ", searchEducation=" + searchEducation + ", searchSkill=" + searchSkill
				+ ", searchGraduateStart=" + searchGraduateStart + ", searchGraduateEnd=" + searchGraduateEnd
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + ", dateStart1=" +dateStart1 
				+ ", dateStart2=" + dateStart2 + ", dateStart3=" +dateStart3 + ", dateEnd1=" + dateEnd1 
				+ ", dateEnd2= " + dateEnd2 + ", dateEnd3=" + dateEnd3 + "]";
	}
}